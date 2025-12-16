package com.xrp.blog.service;

import com.xrp.blog.pojo.Picture;

import java.util.List;

public interface PictureService {
    //查询所有照片
    List<Picture> listPictures();

    //添加图片
    int savePicture(Picture picture);

    //根据id查询照片
    Picture getPicture(Long id);

    //    编辑修改相册
    int updatePicture(Picture picture);

    //    删除照片
    void deletePicture(Long id);
}
