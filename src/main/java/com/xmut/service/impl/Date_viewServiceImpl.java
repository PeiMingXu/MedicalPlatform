package com.xmut.service.impl;

import com.xmut.mapper.Date_viewMapper;
import com.xmut.service.Date_viewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author
 * @date: 2023/5/31
 **/
@Service
public class Date_viewServiceImpl implements Date_viewService {
    @Autowired
    private Date_viewMapper date_viewMapper;
    //统计医生的点击数量
    @Override
    public List<Map> doctorHits() {
        return date_viewMapper.doctorHits();
    }
    //统计用户积分的数量
    @Override
    public List<Map> userPoints() {
        return date_viewMapper.userPoints();
    }
}
