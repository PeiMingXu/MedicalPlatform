package com.xmut.mapper;

import com.xmut.pojo.User;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * @author
 * @date: 2023/5/31
 **/
public interface Date_viewMapper {
   //统计医生的点击量
    public List<Map> doctorHits();

    //统计用户
    public List<Map> userPoints();
}
