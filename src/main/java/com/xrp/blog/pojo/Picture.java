package com.xrp.blog.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Picture {
    private Long id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date time;
    private String address;
    private String description;

}
