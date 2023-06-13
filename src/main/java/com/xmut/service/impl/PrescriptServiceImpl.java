package com.xmut.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xmut.entity.PageResult;
import com.xmut.mapper.PrescriptMapper;
import com.xmut.pojo.Prescript;
import com.xmut.service.PrescriptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author
 * @date: 2023/5/19
 **/
@Service
public class PrescriptServiceImpl implements PrescriptService {
    @Autowired
    private PrescriptMapper prescriptMapper;

    //查询全部药方
    @Override
    public PageResult findByAll(Prescript prescript, Integer pageNum, Integer pageSize) {
        //开启分页查询
        PageHelper.startPage(pageNum, pageSize);
        //调用mapper
        Page<Prescript> page = prescriptMapper.findByAll(prescript);
        return new PageResult(page.getTotal(), page.getResult());
    }
}
