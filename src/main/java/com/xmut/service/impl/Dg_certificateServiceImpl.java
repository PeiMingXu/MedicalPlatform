package com.xmut.service.impl;

import com.xmut.mapper.Dg_certificateMapper;
import com.xmut.pojo.Dg_certificate;
import com.xmut.pojo.Druggist;
import com.xmut.service.Dg_certificateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Dg_certificateServiceImpl implements Dg_certificateService {

    @Autowired
    Dg_certificateMapper dg_certificateMapper;

    @Override
    //根据药剂师id查询证书
    public List<Dg_certificate> selectDg_certificateById(int dg_id) {
        return dg_certificateMapper.selectDg_certificateById(dg_id);
    }
    //查询药剂师对应证书
    @Override
    public Druggist selectDruggistByUser(String user) {
        return dg_certificateMapper.selectDruggistByUser(user);
    }
    //添加证书
    @Override
    public int insertdgCertificate(Dg_certificate dg_certificate) {
        return dg_certificateMapper.insertdgCertificate(dg_certificate);
    }
    //修改证书
    @Override
    public int updateCertificate(Dg_certificate dg_certificate) {
        return dg_certificateMapper.updateCertificate(dg_certificate);
    }
    //删除证书
    @Override
    public Integer deleteByPrimaryKey(Integer id){
        return dg_certificateMapper.deleteByPrimaryKey(id);
    }


}
