package com.xrp.blog.service;


import com.xrp.blog.pojo.Tag;

import java.util.List;

public interface TagService {

    int saveTag(Tag type);

    Tag getTag(Long id);

    Tag getTagByName(String name);

    List<Tag> getAllTagAndBlog();

    List<Tag> getAllTag();

    List<Tag> topTag(Integer size);

    List<Tag> getAllTagAndBlog(String ids);

    int updateTag(Tag type);

    void deleteTag(Long id);
}
