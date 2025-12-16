package com.xrp.blog.service.impl;


import com.xrp.blog.mapper.TagMapper;
import com.xrp.blog.pojo.Tag;
import com.xrp.blog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service
public class TagServiceImpl implements TagService {

    @Autowired
    private TagMapper tagRepository;

    @Transactional
    @Override
    public int saveTag(Tag tag) {
        return tagRepository.save(tag);
    }

    @Transactional
    @Override
    public Tag getTag(Long id) {
        return tagRepository.getById(id);
    }

    @Override
    public Tag getTagByName(String name) {
        return tagRepository.findByName(name);
    }

    @Override
    public List<Tag> getAllTagAndBlog() {
        return tagRepository.getAllTagAndBlog();
    }

    @Override
    public List<Tag> getAllTag() {
        return tagRepository.getAllTag();
    }

    @Override
    public List<Tag> topTag(Integer size) {
        return tagRepository.getBlogTag(size);
    }


    @Override
    public List<Tag> getAllTagAndBlog(String ids) {
        List<Tag> tags = new ArrayList<>();
        List<Long> longs = convertToList(ids);
        for (Long long1 : longs) {
            tags.add(tagRepository.getById(long1));
        }
        return tags;
    }

    private List<Long> convertToList(String ids) {//把前端的tagIds字符串转换为list集合
        List<Long> list = new ArrayList<>();
        if (!"".equals(ids) && ids != null) {
            String[] idarray = ids.split(",");
            for (int i=0; i < idarray.length;i++) {
                list.add(new Long(idarray[i]));
            }
        }
        return list;
    }


    @Transactional
    @Override
    public int updateTag(Tag tag) {
        return tagRepository.update(tag);
    }



    @Transactional
    @Override
    public void deleteTag(Long id) {
        tagRepository.deleteTag(id);
    }
}
