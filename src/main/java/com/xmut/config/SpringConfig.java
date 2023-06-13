package com.xmut.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.sql.DataSource;


/**
 * @author
 * @date: 2023/4/24
 **/
@Configuration//声明当前类是一个配置类
@ComponentScan("com.xmut.service") //开启注解扫描
@ComponentScan("com.xmut.task") //开启注解扫描
@Import({MyBatisConfig.class,JdbcConfig.class}) //导入其他配置
@EnableTransactionManagement  //事务管理
@EnableScheduling    //在Spring的配置类中添加一个@EnableScheduling注解就可以开启Spring task了。
                     // 这个注解用于启用Spring的任务调度
public class SpringConfig {

    public DataSourceTransactionManager transactionManager(DataSource dataSource){
        DataSourceTransactionManager transactionManager=new DataSourceTransactionManager();
        //配置数据源
        transactionManager.setDataSource(dataSource);
        return transactionManager;
    }

    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(10485760); // 设置最大上传文件大小为10MB
        multipartResolver.setDefaultEncoding("UTF-8"); // 设置编码为UTF-8
        return multipartResolver;
    }


}
