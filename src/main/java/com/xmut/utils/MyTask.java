package com.xmut.utils;



import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;



/**
 * @author
 * @date: 2023/5/24
 **/
@Component
//周期函数

@EnableScheduling //第一步，开启定时任务
public class MyTask {
    public static void main(String[] args) {
        // SpringApplication.run(MyTask.class, args);
    }

    @Scheduled(fixedRate = 5*1000) //第二步，设置定时执行，每5s钟执行一次
    public void doSometing(){
        System.out.println("Hello Spring 定时器");
    }




}
