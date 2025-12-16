package com.xrp.blog.util;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class RedisData {
    private LocalDateTime expireTime; //逻辑过期时间
    private Object data;
}
