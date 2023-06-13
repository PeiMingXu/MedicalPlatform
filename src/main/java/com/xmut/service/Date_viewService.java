package com.xmut.service;

import java.util.List;
import java.util.Map;

/**
 * @author
 * @date: 2023/5/31
 **/
public interface Date_viewService {
    //统计医生的点击量
    public List<Map> doctorHits();
    //统计用户积分的数量
    public List<Map> userPoints();
}
