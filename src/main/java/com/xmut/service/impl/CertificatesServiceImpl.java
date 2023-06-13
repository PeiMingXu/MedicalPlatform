package com.xmut.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xmut.entity.PageResult;
import com.xmut.mapper.CertificatesMapper;
import com.xmut.pojo.Certificates;
import com.xmut.pojo.Prescript;
import com.xmut.service.CertificatesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author
 * @date: 2023/5/31
 **/
@Service
public class CertificatesServiceImpl implements CertificatesService {
    @Autowired
    private CertificatesMapper certificatesMapper;

    //查询全部订单
    @Override
    public PageResult findByAll(Certificates certificates, Integer pageNum, Integer pageSize) {
        //开启分页查询
        PageHelper.startPage(pageNum, pageSize);
        //调用mapper
        Page<Certificates> page = certificatesMapper.findByAll(certificates);
        return new PageResult(page.getTotal(), page.getResult());
    }
    //通过id查询
    @Override
    public Certificates findById(Integer id) {
        return certificatesMapper.findById(id);
    }
    //证书审核
    @Override
    public Integer borrowCertificates(Certificates certificates) {
        return certificatesMapper.borrowCertificates(certificates);
    }

    @Override
    public boolean addCertificates(Certificates certificates) {
        //驳回，默认状态设置为2
        certificates.setDg_status(2);
        int result = certificatesMapper.addCertificates(certificates);
        if (result>0){
            return true;
        }else {
            return false;
        }
    }
}
