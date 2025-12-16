package com.xrp.blog.controller;

import com.xrp.blog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ArchiveShowController {
    @Autowired
    BlogService blogService;

    @GetMapping("/archives")
    public String toArchives(Model model){
        model.addAttribute("archiveMap",blogService.archive());
        model.addAttribute("blogCount",blogService.countBlog());//博客总条数
        return "archives";
    }
}
