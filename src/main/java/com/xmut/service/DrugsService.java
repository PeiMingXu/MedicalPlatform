package com.xmut.service;

import com.xmut.entity.PageResult;
import com.xmut.pojo.Drugs;
import com.xmut.pojo.User;

import java.util.List;

/**
 * @author
 * @date: 2023/5/20
 **/
public interface DrugsService {

    //通过id查询
    public Drugs findById(Integer id);

    //查询全部药材
    public PageResult findByAll(Drugs drugs, Integer pageNum, Integer pageSize);
    //查找药材名
    public String findDrugs(String d_name);

    //添加药材
    public boolean addDrugs(Drugs drugs);

    //药材编辑
    public Integer editDrugs(Drugs drugs);

    //药材下架
    public Integer borrowDrugs(Drugs drugs);

    List<Drugs> allfindDurgs();

}
