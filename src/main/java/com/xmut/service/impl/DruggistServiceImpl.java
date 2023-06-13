package com.xmut.service.impl;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xmut.entity.PageResult;
import com.xmut.mapper.DruggistMapper;
import com.xmut.pojo.Dg_Prescript;
import com.xmut.pojo.Druggist;
import com.xmut.service.DruggistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DruggistServiceImpl implements DruggistService {
    @Autowired
    private DruggistMapper druggistMapper;

    @Override
    //查询个人性息
    public Druggist selectDruggistById(String user) {
        return druggistMapper.selectDruggistById(user);
    }

    @Override
    //修改药剂师信息
    public int updateDruggist(Druggist druggist) {
        return druggistMapper.updateDruggist(druggist);
    }
    //查找全部用户，显示在表格
    @Override
    public PageResult findByAll(Dg_Prescript dg_prescript, Integer pageNum, Integer pageSize) {
        //开启分页查询
        PageHelper.startPage(pageNum, pageSize);
        //调用mapper
        Page<Dg_Prescript> page = (Page<Dg_Prescript>) druggistMapper.findByAll(dg_prescript);
        return new PageResult(page.getTotal(), page.getResult());
    }
    //查询药单
    @Override
    public List<Dg_Prescript> selectDg_PrescriptAll() {
        return druggistMapper.selectDg_PrescriptAll();
    }

    //修改药单
    @Override
    public int updatePrescriptionById(Dg_Prescript dg_prescript) {
        return druggistMapper.updatePrescriptionById(dg_prescript);
    }
    //查询个人审核药单
    @Override
    public Druggist selectDg_PrescriptByUser(String user) {
        return druggistMapper.selectDg_PrescriptByUser(user);
    }
}
