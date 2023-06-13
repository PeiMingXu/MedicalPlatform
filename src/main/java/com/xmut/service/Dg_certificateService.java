package com.xmut.service;

import com.xmut.pojo.Dg_certificate;
import com.xmut.pojo.Druggist;

import java.util.List;

public interface Dg_certificateService {
    //根据药剂师id查询证书
    public List<Dg_certificate> selectDg_certificateById(int dg_id);
    //查询药剂师对应证书
    public Druggist selectDruggistByUser(String user);
    //添加证书
    public int insertdgCertificate(Dg_certificate dg_certificate);
    //修改证书
    public  int updateCertificate(Dg_certificate dg_certificate);
    //删除证书
    public Integer deleteByPrimaryKey(Integer id);

}
