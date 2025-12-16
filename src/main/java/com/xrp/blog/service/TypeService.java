package com.xrp.blog.service;

import com.xrp.blog.pojo.Type;

import java.util.List;

public interface TypeService {
    //新增
    int saveType(Type type);
    //查
    Type getType(Long id);
    Type getTypeByName(String name);
    List<Type> getAllTypeAndBlog();

    List<Type> getAllType();

    List<Type> topType(Integer size);//首页右侧展示type对应的博客数量
    //修改
    int updateType(Type type);
    //删除
    void deleteType(Long id);

}
