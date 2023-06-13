package com.xmut.service;


import com.xmut.entity.PageResult;
import com.xmut.pojo.Prescript;


/**
 * @author
 * @date: 2023/5/19
 **/
public interface PrescriptService {

    //查询全部药方
    public PageResult findByAll(Prescript prescript, Integer pageNum, Integer pageSize);

}
