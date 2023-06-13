package com.xmut.mapper;

import com.github.pagehelper.Page;
import com.xmut.pojo.Certificates;
import com.xmut.pojo.Drugs;
import com.xmut.pojo.User;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

/**
 * @author
 * @date: 2023/5/31
 **/
public interface CertificatesMapper {
    //查询全部证书
    @Select("select * from dg_certificate")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property ="user",column="dg_id",
                    one = @One(select = "com.xmut.mapper.UserMapper.findById")
            ),
    })
    public Page<Certificates> findByAll(Certificates certificates);

    //通过id查询
    @Select("select * from dg_certificate where id=#{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property ="user",column="dg_id",
                    one = @One(select = "com.xmut.mapper.UserMapper.findById")
            ),
    })
    public Certificates findById(Integer id);


    //证书审核
    public Integer borrowCertificates(Certificates certificates);
    //证书驳回
    public Integer addCertificates(Certificates certificates);
}
