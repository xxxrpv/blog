package com.xrp.blog.service;

import com.xrp.blog.pojo.User;

public interface UserService {

    User checkUser(String username,String password);
}
