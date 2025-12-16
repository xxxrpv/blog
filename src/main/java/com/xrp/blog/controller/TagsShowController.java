package com.xrp.blog.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xrp.blog.pojo.Blog;
import com.xrp.blog.pojo.Tag;
import com.xrp.blog.service.BlogService;
import com.xrp.blog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class TagsShowController {
    @Autowired
    private TagService tagService;
    @Autowired
    private BlogService blogService;

    @GetMapping("/tags/{id}")
    public String toTypes(@RequestParam(required = false,defaultValue = "1",value = "pageNum")Integer pagenum,
                          @PathVariable Long id, Model model){
        PageHelper.startPage(pagenum, 100);
        List<Tag> tags = tagService.getAllTagAndBlog();
        //-1表示从首页导航点进来的
        if (id == -1) {
            id = tags.get(0).getId();
        }
        List<Blog> blogs = blogService.getByTagId(id);
        PageInfo<Blog> pageInfo = new PageInfo<>(blogs);
        model.addAttribute("tags",tags);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("activeTagId",id);//选中
        return "tags";

    }
}
