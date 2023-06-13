package com.xmut.config;

import org.springframework.context.annotation.Bean;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * @author
 * @date: 2023/5/25
 **/
public class MvcSupport {
    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        //设置上传文件的总大小，单位是字节 100MB
        resolver.setMaxUploadSize(1024 * 1024 * 100);
        //设置每个文件上传的大小，单位是字节 10MB
        resolver.setMaxUploadSizePerFile(1024 * 1024 * 10);
        return resolver;
    }

}
