package com.xmut.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xmut.entity.PageResult;
import com.xmut.mapper.DrugsMapper;
import com.xmut.pojo.Drugs;
import com.xmut.service.DrugsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author
 * @date: 2023/5/20
 **/
@Service
public class DrugsServiceImpl implements DrugsService {
    @Autowired
    private DrugsMapper drugsMapper;
    //通过id查询
    @Override
    public Drugs findById(Integer id) {
        return drugsMapper.findById(id);
    }

   //查询全部药材
   @Override
    public PageResult findByAll(Drugs drugs, Integer pageNum, Integer pageSize) {
        //开启分页查询
        PageHelper.startPage(pageNum,pageSize);
        //调用mapper
        Page<Drugs> page = drugsMapper.findByAll(drugs);
        return new PageResult(page.getTotal(),page.getResult());
    }
   //查找全部药材
    @Override
    public String findDrugs(String d_name) {
        return drugsMapper.findByD_name(d_name);
    }

    //添加药材
    @Override
    public boolean addDrugs(Drugs drugs) {
//新增加的药材，默认状态设置为1
        drugs.setD_status(1);
        int result = drugsMapper.addDrugs(drugs);
        if (result>0){
            return true;
        }else {
            return false;
        }
    }
   //修改药材
    @Override
    public Integer editDrugs(Drugs drugs) {
        return drugsMapper.editDrugs(drugs);
    }

    //药材下架
    @Override
    public Integer borrowDrugs(Drugs drugs) {
        return drugsMapper.borrowDrugs(drugs);
    }

    @Override
    public List<Drugs> allfindDurgs() {
        return drugsMapper.allfindDurgs();
    }
}
