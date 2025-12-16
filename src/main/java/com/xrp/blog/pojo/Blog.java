package com.xrp.blog.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Blog {

    private Long id;

    private String title;

    private String content;//博客内容
    private String description;
    private String firstPicture;
    private String flag;
    private Integer views; //浏览次数
    private boolean appreciation;
    private boolean shareStatement;
    private boolean commentabled;//是否开启评论
    private boolean published; //1 发布 0 保存草稿
    private boolean recommend;

    private Date createTime;
    private Date updateTime;

    private Type type;
    private User user;

    //这个属性用来在mybatis中进行连接查询的
    private Long typeId;
    private Long userId;

    private List<Comment> comments=new ArrayList<>();

    private List<Tag> tags=new ArrayList<>();

    //不保存到数据库
    private String tagIds;

    public void init(){
        this.tagIds = tagsToIds(this.getTags());
    }
    //将tags集合转换为tagIds字符串形式：“1,2,3”,将当前数据库中的tags转换为前端可识别的tagIds
    private String tagsToIds(List<Tag> tags){
        if(!tags.isEmpty()){
            StringBuffer ids = new StringBuffer();
            boolean flag = false;
            for(Tag tag: tags){
                if(flag){
                    ids.append(",");
                }else {
                    flag = true;
                }
                ids.append(tag.getId());
            }
            return ids.toString();
        }else {
            return tagIds;
        }
    }
}
