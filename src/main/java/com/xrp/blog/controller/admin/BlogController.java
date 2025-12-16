package com.xrp.blog.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xrp.blog.pojo.Blog;
import com.xrp.blog.pojo.Type;
import com.xrp.blog.pojo.User;
import com.xrp.blog.service.BlogService;
import com.xrp.blog.service.TagService;
import com.xrp.blog.service.TypeService;
import com.xrp.blog.vo.BlogQuery;
import com.xrp.blog.vo.QueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class BlogController {
    private static final String INPUT = "admin/blogs-input";
    private static final String LIST = "admin/blogs";
    private static final String REDIRECT_LIST = "redirect:/admin/blogs";

    @Autowired
    private BlogService blogService;
    @Autowired
    private TypeService typeService;
    @Autowired
    private TagService tagService;

    @GetMapping("/blogs")
    public String blogs(@RequestParam(required = false,defaultValue = "1",value = "pageNum")int pagenum, Model model){
        PageHelper.startPage(pagenum,5);
        List<Blog> allBlog=blogService.getAllBlog(1L);
        PageInfo pageInfo=new PageInfo<>(allBlog);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("types",typeService.getAllTypeAndBlog()); //做下拉type标签用
        model.addAttribute("tags",tagService.getAllTagAndBlog());
        return LIST;
    }
    @PostMapping("/blogs/search")
    public String search(@RequestParam(required = false,defaultValue = "1",value = "pageNum")int pagenum, BlogQuery blog, Model model){
        PageHelper.startPage(pagenum,5);



        List<QueryResult> search = blogService.listBlog(blog);
        PageInfo<QueryResult> pageInfo=new PageInfo<>(search);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("message", "查询成功");
        return "admin/blogs :: blogList"; //返回blogs下blogList片段(局部渲染,ajax)
    }

    @GetMapping("/blogs/input")
    public String toAdd(Model model){//去新增博客页面
        model.addAttribute("types",typeService.getAllType());
        model.addAttribute("tags",tagService.getAllTag());
        model.addAttribute("blog",new Blog());

        return INPUT;
    }
    @GetMapping("/blogs/{id}/input")
    public String toEdit(@PathVariable Long id,Model model){//去编辑博客页面
        System.out.println("前段传来的toBlogUpdate的id："+id);
        Blog blog = blogService.getBlog(id);
        System.out.println("前段传来的toBlogUpdate的id查到的blogById："+blog);
//        List<Type> adminType = typeService.getAdminType();
        Type typeById = typeService.getType(blog.getTypeId());
        System.out.println("前段传来的toBlogUpdate的id查到的typeById："+typeById);

        model.addAttribute("types",typeService.getAllType());
        model.addAttribute("tags",tagService.getAllTag());
        blog.init();//将tags集合转换为tagIds字符串
        model.addAttribute("blog",blog);//返回blog对象给前端th:object

        return INPUT;
    }

    @PostMapping("/blogs/edit")//新增、编辑博客
    public String post(Blog blog, RedirectAttributes attributes,HttpSession session){ //session中有user对象
        //设置user属性
//        blog.setUser((User) session.getAttribute("user"));
        //设置用户id
//        blog.setUserId(blog.getUser().getId());
        //前端传入type.id,根据id查询type对象
        System.out.println("###############"+blog.getTypeId());
        blog.setType(typeService.getType(blog.getTypeId()));
        System.out.println("###############"+blog.getType());
        //设置blog中typeId属性
        //blog.setTypeId(blog.getType().getId());
        //给blog中的List<Tag>赋值
        blog.setTags(tagService.getAllTagAndBlog(blog.getTagIds()));
        System.out.println("###############"+tagService.getAllTagAndBlog(blog.getTagIds()));
        if (blog.getId() == null) {   //id为空，则为新增;保存到数据库才会有id
            blog.setUser((User) session.getAttribute("user"));
            blog.setUserId(blog.getUser().getId());
            blogService.saveBlog(blog);
        } else {
            blogService.updateBlog(blog.getId(), blog);
            System.out.println("updateBlog的showBlog"+blog);
        }

        attributes.addFlashAttribute("meassage", "操作成功");
        return REDIRECT_LIST;
    }
    @GetMapping("/blogs/{id}/delete")
    public String delete(@PathVariable Long id,RedirectAttributes attributes){
        blogService.deleteBlog(id);
        attributes.addFlashAttribute("message","删除成功!");
        return REDIRECT_LIST;
    }


}
