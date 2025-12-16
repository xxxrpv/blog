package com.xrp.blog.controller;

import com.xrp.blog.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PictureShowController {

    @Autowired
    private PictureService pictureService;

    @GetMapping("/pictures")
    public String toPictures(Model model){
        model.addAttribute("pictures",pictureService.listPictures());
        return "picture";
    }
}
