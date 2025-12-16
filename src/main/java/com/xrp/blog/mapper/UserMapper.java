package com.xrp.blog.mapper;

import com.xrp.blog.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {

    User findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
}
