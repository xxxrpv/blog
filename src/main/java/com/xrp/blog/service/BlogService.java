package com.xrp.blog.service;

import com.xrp.blog.pojo.Blog;
import com.xrp.blog.vo.BlogQuery;
import com.xrp.blog.vo.QueryResult;


import java.util.List;
import java.util.Map;


public interface BlogService {
    Blog getBlog(Long id);//后台展示博客

    List<Blog> getAllBlog(Long id);
    Blog getDetailedBlog(Long id);//前端展示博客
    //分页查询
    List<QueryResult> listBlog(BlogQuery blog);

    List<Blog> getIndexBlog();

    List<Blog> getSearchBlog(String query);//搜索,匹配标题/内容

    List<Blog> getByTagId(Long tagId);//根据tag查询

    List<Blog> getByTypeId(Long typeId);//根据tag查询

    Integer countBlog();

    Map<String, List<Blog>> archive();

    int saveBlog(Blog blog);

    int updateBlog(Long id,Blog blog);

    void deleteBlog(Long id);

    List<Blog> recommendBlog(Integer size);


}
