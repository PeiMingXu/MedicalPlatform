package com.xmut.task;


import com.xmut.mapper.PrescriptMapper;
import com.xmut.pojo.Prescript;
import com.xmut.utils.SMSUtil_one_time;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

import java.util.List;
import java.util.concurrent.*;
import java.util.stream.Collectors;

/**
 * @author
 * @date: 2023/6/1
 **/
@Component //注入spring容器
public class TaskComponent {
    @Autowired
    private PrescriptMapper prescriptMapper;

    // spring-task
    // 定义CountDownLatch，初始值为phonelist的长度，
    // 每次执行完一个手机号的短信发送操作时，将计数器减1，当计数器为0时，就停止定时任务的执行
    private CountDownLatch countDownLatch;

    /*秒 分 时 日 月 周 年*/     //0/30 15 8 * * ?  每天上午八点15执行,30秒执行一次
    @Scheduled(cron = "0/30 0 8 * * ? ") //每天上午八点执行，30秒执行一次
    public void taskSendingSMS() throws InterruptedException {
        System.out.println("定时任务开始执行");
        List<Prescript> byAll1 = prescriptMapper.findByAll1(null);

        //转换成stream()流，.map() 把每一个prescript对象对应的用户的手机号获取出来，
        // .distinct()可以对手机号去重 collect(Collectors.toList()) 返回一个手机号集合
        List<String> phonelist = byAll1.stream().map(prescript -> prescript.getUser().getPhone()).distinct().collect(Collectors.toList());

        // 创建一个线程池 使用多线程的方式来实现每个手机号都执行工具类的需求。
        // 每个手机号都分配一个线程来执行发送短信的操作
        ExecutorService executorService = Executors.newFixedThreadPool(phonelist.size());

        // 初始化CountDownLatch
        countDownLatch = new CountDownLatch(phonelist.size());
        //循环遍历
        for(String phone : phonelist) {
                // 将发送短信的操作放入一个Callable对象中
                    Callable<Void> task = () -> {
                // 调用发送短信的方法，将手机号码和短信内容作为参数传入
                    HttpServletRequest request = null;
                    System.out.println("当前发送手机号=="+phone);
                    SMSUtil_one_time.sendSMS(request,phone);
                    // 计数器减1
                    countDownLatch.countDown();
                    return null;
            };
                // 将Callable对象提交给线程池执行
                executorService.submit(task);
         }
                // 等待所有任务执行完毕
                countDownLatch.await();
                // 关闭线程池
                executorService.shutdown();
                System.out.println("定时任务执行完毕");
    }
}
