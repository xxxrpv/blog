package com.xrp.blog.mapper;


import com.xrp.blog.pojo.Type;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TypeMapper {

    int save(Type type);

    Type getById(Long id);

    Type findByName(String name);

    List<Type> findAll();

    List<Type> getAllType();

    List<Type> getBlogType(Integer size);  //首页右侧展示type对应的博客数量

    int update(Type type);

    int deleteById(Long id);
}
