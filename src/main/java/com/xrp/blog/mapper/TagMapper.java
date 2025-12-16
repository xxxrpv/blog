package com.xrp.blog.mapper;


import com.xrp.blog.pojo.Tag;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TagMapper {
    Tag getById(Long id);

    Tag findByName(String name);

    List<Tag> getAllTagAndBlog();

    List<Tag> getAllTag();

    List<Tag> getBlogTag(Integer size);  //首页展示博客标签

    int save(Tag tag);

    int update(Tag tag);

    int deleteTag(Long id);
}
