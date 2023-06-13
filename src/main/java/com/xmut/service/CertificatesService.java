package com.xmut.service;

import com.xmut.entity.PageResult;
import com.xmut.pojo.Certificates;
import com.xmut.pojo.Drugs;
import com.xmut.pojo.User;

/**
 * @author
 * @date: 2023/5/31
 **/
public interface CertificatesService {
    //查询全部药方
    public PageResult findByAll(Certificates certificates, Integer pageNum, Integer pageSize);
    //通过id查询
    public Certificates findById(Integer id);
    //证书审核
    public Integer borrowCertificates(Certificates certificates);
    //证书驳回
    public boolean addCertificates(Certificates certificates);
}
