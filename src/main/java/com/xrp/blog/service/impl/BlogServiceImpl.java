package com.xrp.blog.service.impl;

import com.xrp.blog.mapper.BlogMapper;
import com.xrp.blog.pojo.Blog;
import com.xrp.blog.util.CacheClient;
import com.xrp.blog.vo.BlogAndTag;
import com.xrp.blog.pojo.Tag;
import com.xrp.blog.service.BlogService;
import com.xrp.blog.util.MarkdownUtils;
import com.xrp.blog.vo.BlogQuery;
import com.xrp.blog.vo.QueryResult;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import javax.annotation.Resource;
import java.util.*;
import java.util.concurrent.TimeUnit;

import static com.xrp.blog.util.RedisConstants.CACHE_BLOG_KEY;
import static com.xrp.blog.util.RedisConstants.CACHE_BLOG_TTL;

@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    private BlogMapper blogDao;
    @Resource
    private CacheClient cacheClient;

    @Override
    public Blog getBlog(Long id) {
//        System.out.println("redis**************");
     /*   Blog blog=cacheClient.queryWithPassThrough
                (CACHE_BLOG_KEY,id,Blog.class,id2->blogDao.getById(id),CACHE_BLOG_TTL, TimeUnit.MINUTES);
        return blog;*/
        return blogDao.getById(id);
    }

    @Override
    public List<Blog> getAllBlog(Long id)   {
     /*   List<Blog> list=cacheClient.queryWithPassThrough
                (CACHE_BLOG_KEY,id,Blog.class,id2->blogDao.getAllBlog(),CACHE_BLOG_TTL, TimeUnit.MINUTES);*/
        try {
            return cacheClient.queryAll(CACHE_BLOG_KEY,id,Blog.class,id2->this.getAll(id),CACHE_BLOG_TTL, TimeUnit.MINUTES);
        } catch (NoSuchFieldException e) {
            throw new RuntimeException(e);
        }

    }
    public List<Blog> getAll(Long id) {
        List<Blog> allBlog = blogDao.getAllBlog();
        System.out.println("blog数量"+allBlog.size());
        return blogDao.getAllBlog();
    }
    @Override
    public Blog getDetailedBlog(Long id) { //获取blog内容详情
        Blog blog=blogDao.getDetailedBlog(id);
        if(blog==null){
            throw new RuntimeException("该博客不存在");
        }
        String content=blog.getContent();

        Blog b=new Blog();
        BeanUtils.copyProperties(blog,b);
        //markdown格式转化为html
        b.setContent(MarkdownUtils.markdownToHtmlExtensions(content));

        blogDao.updateViews(id);//浏览次数+1
        return b;
    }

    @Override
    public List<QueryResult> listBlog(BlogQuery blog) {//后台根据标题、分类、推荐搜索博客
        return blogDao.findByTitleOrTypeOrRecommend(blog);
    }

    @Override
    public List<Blog> getIndexBlog() {
        return blogDao.getIndexBlog();
    }

    @Override
    public List<Blog> getSearchBlog(String query) {
        return blogDao.findByQuery(query);
    }

    @Override
    public List<Blog> getByTagId(Long tagId) {
        return blogDao.getByTagId(tagId);
    }

    @Override
    public List<Blog> getByTypeId(Long typeId) {
        return blogDao.getByTypeId(typeId);
    }

    @Override
    public Integer countBlog() {
        return blogDao.getAllBlog().size();
    }

    @Override
    public Map<String, List<Blog>> archive() {
        Map<String, List<Blog>> map=new LinkedHashMap<>();
        List<String> years=blogDao.findGroupYear(); //年份 ：该年份对应的博客列表
        for (String year :
                years) {
            map.put(year,blogDao.findByYear(year));
        }
        return map;
    }

    @Override
    public List<Blog> recommendBlog(Integer size) {
        return blogDao.getRecommendBlog(size);
    }

    @Transactional
    @Override
    public int saveBlog(Blog blog) {
        blog.setCreateTime(new Date());
        blog.setUpdateTime(new Date());
        blog.setViews(0);
        blogDao.save(blog);
        //保存博客后才能获取自增的id
        Long id = blog.getId();
        //将标签的数据存到t_blogs_tag表中
        List<Tag> tags = blog.getTags();
        BlogAndTag blogAndTag = null;
        for (Tag tag : tags) {
            //新增时无法获取自增的id,在mybatis里修改
            blogAndTag = new BlogAndTag(tag.getId(), id);
            blogDao.saveBlogAndTag(blogAndTag);
        }
        return 1;
    }

    @Transactional
    @Override
    public int updateBlog(Long id,Blog blog) {
        //将标签的数据存到t_blogs_tag表中
        List<Tag> tags = blog.getTags();
        BlogAndTag blogAndTag = null;
        blogDao.deleteTag(blog.getId());
        for (Tag tag : tags) {
            blogAndTag = new BlogAndTag(tag.getId(), blog.getId());
            blogDao.saveBlogAndTag(blogAndTag);
        }
        blog.setUpdateTime(new Date());
        return blogDao.update(blog);
    }
    @Transactional
    @Override
    public void deleteBlog(Long id) {
        blogDao.deleteById(id);

    }
}
