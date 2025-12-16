package com.xrp.blog.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xrp.blog.pojo.Blog;
import com.xrp.blog.pojo.Type;
import com.xrp.blog.service.BlogService;
import com.xrp.blog.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller

public class TypeShowController {
    @Autowired
    private TypeService typeService;
    @Autowired
    private BlogService blogService;

    @GetMapping("/types/{id}")
    public String toTypes(@RequestParam(required = false,defaultValue = "1",value = "pageNum")Integer pagenum,
                          @PathVariable Long id,Model model){
        PageHelper.startPage(pagenum, 100);  //开启分页
        List<Type> types=typeService.getAllTypeAndBlog();//获取全部标签
        //-1从导航点过来的
        if(id==-1){
            id=types.get(0).getId();//取第一个标签
        }

        List<Blog> blogs = blogService.getByTypeId(id);
        PageInfo<Blog> pageInfo = new PageInfo<>(blogs);

        model.addAttribute("types",types);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("activeTypeId",id);//选中
        return "types";

    }
}
