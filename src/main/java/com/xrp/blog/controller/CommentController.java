package com.xrp.blog.controller;

import com.xrp.blog.pojo.Comment;
import com.xrp.blog.pojo.User;
import com.xrp.blog.service.BlogService;
import com.xrp.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private BlogService blogService;
    @Value("${comment.avatar}")
    private String avatar;// 头像

    @GetMapping("/comments/{blogId}")
    public String toComments(@PathVariable Long blogId, Model model) {
        model.addAttribute("comments", commentService.listCommentByBlogId(blogId));
        return "blog::commentList";
    }

    @PostMapping("/comments")
    public String post(Comment comment, HttpSession session){
        System.out.println("传过来的comment："+ comment);
        Long blogId = comment.getBlogId();
        System.out.println("saveComment的ID："+ blogId);
        comment.setBlog(blogService.getBlog(blogId));

        User user = (User) session.getAttribute("user");
        if(user!=null){ //管理员
            comment.setAvatar(user.getAvatar());
            comment.setAdminComment(true);
        }else{
            comment.setAvatar(avatar);
        }

        commentService.saveComment(comment);
        return "redirect:/comments/"+blogId;
    }
}
