package com.xmut.service;

import com.xmut.entity.PageResult;
import com.xmut.pojo.Dg_Prescript;
import com.xmut.pojo.Druggist;

import java.util.List;


public interface DruggistService {
    //查询个人性息
    public Druggist selectDruggistById(String user);
    //修改药剂师信息
    public int updateDruggist(Druggist druggist);
    //查询全部用户
    public PageResult findByAll(Dg_Prescript dg_prescript, Integer pageNum, Integer pageSize);
    //查询药单
    public List<Dg_Prescript> selectDg_PrescriptAll();
    //修改药单
    public int updatePrescriptionById(Dg_Prescript dg_prescript);
    //查询个人审核药单
    public Druggist selectDg_PrescriptByUser(String user);
}


