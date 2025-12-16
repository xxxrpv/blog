package com.xrp.blog.service.impl;


import com.xrp.blog.mapper.TypeMapper;
import com.xrp.blog.pojo.Type;
import com.xrp.blog.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    private TypeMapper typeRepository;

    @Override
    public int saveType(Type type) {
        return typeRepository.save(type);
    }

    @Override
    public Type getType(Long id) {
        return typeRepository.getById(id);
    }

    @Override
    public Type getTypeByName(String name) {
        return typeRepository.findByName(name);
    }

    @Override
    public List<Type> getAllTypeAndBlog() {
        return typeRepository.findAll();
    }

    @Override
    public List<Type> getAllType() {
        return typeRepository.getAllType();
    }


    @Transactional
    @Override
    public int updateType(Type type) {
        return typeRepository.update(type);
    }

    @Override
    public List<Type> topType(Integer size) { //首页右侧
        return typeRepository.getBlogType(size);
    }

    @Override
    public void deleteType(Long id) {
        typeRepository.deleteById(id);
    }
}
