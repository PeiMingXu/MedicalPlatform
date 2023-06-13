package com.xmut.controller;

import com.xmut.service.Date_viewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @author
 * @date: 2023/5/31
 **/
@Controller
public class Date_viewController {
    @Autowired
    private Date_viewService date_viewService;
    //统计医生的点赞点击量
    @PostMapping ("/doctorHits")
    @ResponseBody
    public  List doctorHits(){
        List<Map> doctorHits = date_viewService.doctorHits();
        System.out.println("doctorHits=="+doctorHits);
        return doctorHits;
    }
    //统计用户的积分数量
    @PostMapping ("/userPoints")
    @ResponseBody
    public  List userPoints(){
        List<Map> userPoints = date_viewService.userPoints();
        System.out.println("doctorHits=="+userPoints);
        return userPoints;
    }

}
