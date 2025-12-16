package com.xrp.blog.service.impl;

import com.xrp.blog.mapper.UserMapper;
import com.xrp.blog.pojo.User;
import com.xrp.blog.service.UserService;
import com.xrp.blog.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userRepository;
    @Override
    public User checkUser(String username, String password) {
        User user=userRepository.findByUsernameAndPassword(username, MD5Utils.code(password));
        return user;
    }
}
