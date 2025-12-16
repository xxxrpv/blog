package com.xrp.blog.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xrp.blog.pojo.Blog;
import com.xrp.blog.pojo.Tag;
import com.xrp.blog.pojo.Type;
import com.xrp.blog.service.BlogService;
import com.xrp.blog.service.TagService;
import com.xrp.blog.service.TypeService;
import com.xrp.blog.util.IpUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class
IndexController {

    @Autowired
    private BlogService blogService;
    @Autowired
    private TypeService typeService;
    @Autowired
    private TagService tagService;

    @GetMapping("/")
    public String toIndex(@RequestParam(required = false,defaultValue = "1",value = "pageNum")Integer pagenum,
                          Model model){
        PageHelper.startPage(pagenum, 6);
        List<Blog> allBlog = blogService.getIndexBlog();
        List<Type> types = typeService.getAllTypeAndBlog();  //获取博客的类型(联表查询)
        List<Tag> tags = tagService.getAllTagAndBlog();  //获取博客的标签(联表查询)
        List<Blog> recommendBlog =blogService.recommendBlog(8);  //获取推荐博客
        //得到分页结果对象
        PageInfo<Blog> pageInfo = new PageInfo<>(allBlog);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("types",types);
        model.addAttribute("tags",tags);
        model.addAttribute("recommendBlogs",recommendBlog);

//        System.out.println(IpUtil.getIpAddr(request));
        return "index";
    }

    @PostMapping("/search")
    public String search(@RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum,
                         @RequestParam String query, Model model) {
        PageHelper.startPage(pageNum,10);
        List<Blog> searchResult=blogService.getSearchBlog(query);
        PageInfo<Blog> pageInfo=new PageInfo<>(searchResult);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("query",query);
        return "search";
    }
    //blog详情
    @GetMapping("/blog/{id}")
    public String blog(@PathVariable Long id,Model model ){
        model.addAttribute("blog",blogService.getDetailedBlog(id));
        System.out.println("查看博客详情blog"+id);
        return "blog";
    }

    @GetMapping("/about")
    public String toAbout(){
        return "about";
    }

    public String newBlogs(){

        return "_fragment :: newblogList";
    }

}
