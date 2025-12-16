package com.xrp.blog.mapper;

import com.xrp.blog.pojo.Blog;
import com.xrp.blog.vo.BlogAndTag;
import com.xrp.blog.vo.BlogQuery;
import com.xrp.blog.vo.QueryResult;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BlogMapper {
    Blog getById(Long id);  //后台展示博客*

    Blog getDetailedBlog(@Param("id") Long id);  //博客详情

    List<Blog> getAllBlog();

    List<Blog> getByTypeId(Long typeId);  //根据类型id获取博客

    List<Blog> getByTagId(Long tagId);  //根据标签id获取博客

    List<Blog> getIndexBlog();  //主页博客展示

    List<Blog> getRecommendBlog(Integer size);  //推荐博客展示*

    List<Blog> findByQuery(String query);  //全局搜索博客*

    List<QueryResult> findByTitleOrTypeOrRecommend(BlogQuery blog);  //后台根据标题、分类、推荐搜索博客*

    List<String> findGroupYear();  //查询所有年份，返回一个集合*

    List<Blog> findByYear(@Param("year") String year);  //按年份查询博客*

    int updateViews(Long id); //浏览次数+1*

    int count();//统计blog总数

    int save(Blog blog);

    int saveBlogAndTag( BlogAndTag blogAndTag);

    int deleteTag(Long id);

    int update(Blog blog);

    int deleteById(Long id);
}
