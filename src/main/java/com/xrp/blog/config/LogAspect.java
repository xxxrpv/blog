package com.xrp.blog.config;
/*需求:记录日志内容
 *  请求 url
 *  访问者 ip
 *  调用方法 classMethod
 *  参数 args
 *  返回内容*/
import lombok.AllArgsConstructor;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

//使用aop进行日志处理
@Aspect //生成代理对象
@Component
public class LogAspect {
    private final Logger logger=LoggerFactory.getLogger(this.getClass());

    @Pointcut(value = "execution(* com.xrp.blog.controller.*.*(..))") //切入点
    public void log() {}

    @Before("log()")
    public void doBefore(JoinPoint joinpoint){
        ServletRequestAttributes attributes=(ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        String url=request.getRequestURI().toString();
        String ip=request.getRemoteAddr();
        //获得类名.方法名
        String classMethod=joinpoint.getSignature().getDeclaringTypeName()+"."+joinpoint.getSignature().getName();
        //获得方法参数
        Object[] args= joinpoint.getArgs();

        RequestLog requestLog=new RequestLog(url,ip,classMethod,args);

        //打印请求信息
        logger.info("Request: {}",requestLog);

        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println("访问IP："+requestLog.ip+" 时间："+ formatter.format(date));

    }

/*    @After("log()")
    public void doAfter(){
        System.out.println("-----------doAfter-----------");
    }*/
    @AfterReturning(returning = "result",pointcut = "log()")
    public void doAfterReturn(Object result){
        logger.info("Result : {}",result); //打印返回值
    }



    @AllArgsConstructor //生成全参构造
    private class RequestLog{ //用于封装请求信息
        private String url;
        private String ip;
        private String classMethod;
        private Object[] args;//请求参数


        @Override
        public String toString() {
            return "{" +
                    "url='" + url + '\'' +
                    ", ip='" + ip + '\'' +
                    ", classMethod='" + classMethod + '\'' +
                    ", args=" + Arrays.toString(args) +
                    '}';
        }
    }

}
