package com.xrp.blog.service;

import com.xrp.blog.pojo.Comment;

import java.util.List;

public interface CommentService {
    //获取评论列表
    List<Comment> listCommentByBlogId(Long blogId);

    int saveComment(Comment comment);
}
