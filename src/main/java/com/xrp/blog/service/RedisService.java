package com.xrp.blog.service;

import cn.hutool.core.util.BooleanUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.xrp.blog.util.RedisData;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;

import static com.xrp.blog.util.RedisConstants.CACHE_NULL_TTL;
import static com.xrp.blog.util.RedisConstants.LOCK_SHOP_KEY;


@Slf4j
@Component
public class RedisService {
    private final StringRedisTemplate stringRedisTemplate;

    public RedisService(StringRedisTemplate stringRedisTemplate) {
        this.stringRedisTemplate = stringRedisTemplate;
    }
    public void set(String key, Object value, Long time, TimeUnit timeUnit){
        stringRedisTemplate.opsForValue().set(key, JSONUtil.toJsonStr(value), time, timeUnit);
    }
    public void setWithLogicalExpire(String key, Object value, Long time, TimeUnit timeUnit){//逻辑过期
        // 设置逻辑过期
        RedisData redisData = new RedisData();
        redisData.setData(value);
        redisData.setExpireTime(LocalDateTime.now().plusSeconds(timeUnit.toSeconds(time)));
        // 写入Redis
        stringRedisTemplate.opsForValue().set(key, JSONUtil.toJsonStr(redisData));

    }

    public <R,ID> List<R> queryAllBlog(String prefix, ID id, Class<R> type, Function<ID,List<R>> dbFallBack
            , Long time, TimeUnit timeUnit) throws NoSuchFieldException { //R，id泛型； keyPre key前缀；dbFallBack 函数式编程，传入的查询数据库的函数
        // 1.从redis查询商铺缓存
        Set<String> keys = stringRedisTemplate.keys(prefix .concat("*") );//获取所有的前缀开头的key
        // 2.判断是否存在
        if (!keys.isEmpty()) {
            // 3.存在，直接返回
            List<String> values = stringRedisTemplate.opsForValue().multiGet(keys);
            List<R> list=new ArrayList<>();
            for (String json: values) {
                list.add(JSONUtil.toBean(json,type));
            }
            System.out.println("从redis中读取全部blog");
            return list;
        }

        // 4.不存在，根据id查询数据库
        List<R> blogList = dbFallBack.apply(id);
        // 6.存在，写入redis
        System.out.println("未命中，查询数据库并写入redis 共"+blogList.size()+"个");
        for (R obj:blogList){
            try {
//                method = obj.getClass().getMethod("getId");
                Field field = obj.getClass().getDeclaredField("id");
                field.setAccessible(true);
                Long id2 = (Long) field.get(obj);
                String key = prefix + id2;
                System.out.println("写入key:"+key);
                this.set(key,obj,time,timeUnit);
            } catch (IllegalAccessException e) {
                throw new RuntimeException(e);
            }

        }


        return blogList;
    }
    public <R,ID> R queryWithPassThrough(String keyPre, ID id, Class<R> type, Function<ID,R> dbFallBack
            ,Long time,TimeUnit timeUnit){ //R，id泛型； keyPre key前缀；dbFallBack 函数式编程，传入的查询数据库的函数
//        String key = CACHE_SHOP_KEY + id;
        String key = keyPre + id;
        // 1.从redis查询商铺缓存
        String json = stringRedisTemplate.opsForValue().get(key);
        // 2.判断是否存在
        if (StrUtil.isNotBlank(json)) {
            // 3.存在，直接返回
            return JSONUtil.toBean(json, type);
        }
        // 判断命中的是否是空值
        if (json != null) {
            return null;
        }

        // 4.不存在，根据id查询数据库
        R r = dbFallBack.apply(id);
        // 5.不存在，返回错误
        if (r == null) {
            // 将空值写入redis
            stringRedisTemplate.opsForValue().set(key, "", CACHE_NULL_TTL, TimeUnit.MINUTES);
            // 返回错误信息
            return null;
        }
        // 6.存在，写入redis
        this.set(key,r,time,timeUnit);

        return r;
    }
    /*#############利用逻辑过期解决缓存击穿问题*********/
    private static  final ExecutorService executorService= Executors.newFixedThreadPool(10);//线程池
    public <R,ID> R queryWithLogicalExpire(String keyPre, ID id, Class<R> type,
                                           Function<ID,R> dbFallBack ,Long time,TimeUnit timeUnit) {
        String key = keyPre + id;
        // 1.从redis查询商铺缓存
        String json = stringRedisTemplate.opsForValue().get(key);
        // 2.判断是否存在
        if (StrUtil.isBlank(json)) {
            // 3.不存在
            return null;
        }
        // 4.命中，需要先把json反序列化为对象
        RedisData redisData = JSONUtil.toBean(json, RedisData.class);

        JSONObject data = (JSONObject) redisData.getData();
        R r = JSONUtil.toBean(data, type); //Shop.class

        LocalDateTime expireTime = redisData.getExpireTime();
        //5。判断是否过期
        if (expireTime.isAfter(LocalDateTime.now())) {
            // 5.1.未过期，直接返回店铺信息
            return r;
        }
        // 5.2.已过期，需要缓存重建

        //6.缓存重建
        // 6.1.获取互斥锁
        String lockKey=LOCK_SHOP_KEY+id;
        boolean isLock = tryLock(lockKey);
        // 6.2.判断是否获取锁成功
        if (isLock){
            //6.3 成功，开启独立线程，实现缓存重建
            executorService.submit(()->{
                try {
                    //查询数据库
                    R r1= dbFallBack.apply(id);
                    //写入redis
                    this.setWithLogicalExpire(key,r1,time,timeUnit);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }finally {
                    //释放锁
                    unlock(lockKey);
                }
            });
        }
        return r;
    }
    public <R, ID> R queryWithMutex(
            String keyPrefix, ID id, Class<R> type, Function<ID, R> dbFallback, Long time, TimeUnit unit) {
        String key = keyPrefix + id;
        // 1.从redis查询商铺缓存
        String shopJson = stringRedisTemplate.opsForValue().get(key);
        // 2.判断是否存在
        if (StrUtil.isNotBlank(shopJson)) {
            // 3.存在，直接返回
            return JSONUtil.toBean(shopJson, type);
        }
        // 判断命中的是否是空值
        if (shopJson != null) {
            // 返回一个错误信息
            return null;
        }

        // 4.实现缓存重建
        // 4.1.获取互斥锁
        String lockKey = LOCK_SHOP_KEY + id;
        R r = null;
        try {
            boolean isLock = tryLock(lockKey);
            // 4.2.判断是否获取成功
            if (!isLock) {
                // 4.3.获取锁失败，休眠并重试
                Thread.sleep(50);
                return queryWithMutex(keyPrefix, id, type, dbFallback, time, unit);
            }
            // 4.4.获取锁成功，根据id查询数据库
            r = dbFallback.apply(id);
            // 5.不存在，返回错误
            if (r == null) {
                // 将空值写入redis
                stringRedisTemplate.opsForValue().set(key, "", CACHE_NULL_TTL, TimeUnit.MINUTES);
                // 返回错误信息
                return null;
            }
            // 6.存在，写入redis
            this.set(key, r, time, unit);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }finally {
            // 7.释放锁
            unlock(lockKey);
        }
        // 8.返回
        return r;
    }


    private boolean tryLock (String key){//尝试获取锁
        Boolean flag = stringRedisTemplate.opsForValue().setIfAbsent(key, "1", 10, TimeUnit.SECONDS);//利用redis的setnx方法来表示获取锁，
        return BooleanUtil.isTrue(flag);//拆箱，
    }
    private void unlock(String key){//释放锁
        stringRedisTemplate.delete(key);
    }

}
