package com.xmut.config;



import com.xmut.intercepter.ResourceInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;

import java.util.List;

/**
 * @author
 * @date: 2023/4/24
 **/
@Configuration//声明当前类是一个配置类
@ComponentScan("com.xmut.controller") //注解扫描
@PropertySource("classpath:ignoreUrl.properties")//读取文件
@EnableWebMvc  //1：使用EnableWebMvc开启springmvc注解方式配置
public class SpringMvcConfig implements WebMvcConfigurer {
    @Value("#{'${ignoreUrl}'.split(',')}")
    private  List<String> ignoreUrl;

    //开启静态资源的释放
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    //配置视图解析器
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp("/",".jsp");
    }



    // 配置拦截器，重写方法addInterceptors
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new ResourceInterceptor(ignoreUrl))//调用ResourceInterceptor
                .addPathPatterns("/**")
                .excludePathPatterns("/css/**","/img/**","/js/**","/logos/**");//排除一些路径
    }

    /**
     * ④：4、配置静态资源访问处理器
     *
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/images/**").addResourceLocations("/images/");
    }



    //上传文件
    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        // 必须和用户JSP 的pageEncoding属性一致，以便正确解析表单的内容
        multipartResolver.setDefaultEncoding("UTF-8");
        //设置上传文件的总大小，单位是字节 100MB
        multipartResolver.setMaxUploadSizePerFile(10 * 1024 * 1024);
        //设置每个文件上传的大小，单位是字节 10MB
        multipartResolver.setMaxUploadSize(100 * 1024 * 1024);
        // resolveLazily属性启用是为了推迟文件解析，以便捕获文件大小异常
        multipartResolver.setResolveLazily(true);
        return multipartResolver;
    }

    // //文件上传
    // @Override
    // public void addResourceHandlers(ResourceHandlerRegistry registry) {
    //     registry.addResourceHandler("/static/**").addResourceLocations("/static/");
    // }
    //
    // @Bean
    // public CommonsMultipartResolver multipartResolver() {
    //     CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
    //     multipartResolver.setMaxUploadSize(10485760); // 设置最大上传文件大小为10MB
    //     multipartResolver.setDefaultEncoding("UTF-8"); // 设置编码为UTF-8
    //     return multipartResolver;
    // }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(new MappingJackson2HttpMessageConverter());
    }



}
