package com.xmut.mapper;

import com.xmut.pojo.Dg_certificate;
import com.xmut.pojo.Druggist;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface Dg_certificateMapper {
    //根据药剂师id查询证书
    @Select("select * from dg_certificate where dg_id=#{dg_id} and dg_status=3")
    public List<Dg_certificate> selectDg_certificateById(int dg_id);

    //查询药剂师对应证书
    @Select("select * from druggist_view where user=#{user}")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "dg_certificateList",
                    many = @Many(select = "com.xmut.mapper.Dg_certificateMapper.selectDg_certificateById")
            )
    })
    public Druggist selectDruggistByUser(String user);

    //添加证书
    @Insert("insert into dg_certificate(dg_name,dg_grades,dg_picture,dg_id)values(#{dg_name},#{dg_grades},#{dg_picture},#{dg_id})")
    public int insertdgCertificate(Dg_certificate dg_certificate);

    //修改证书
    @Update("UPDATE dg_certificate SET dg_name=#{dg_name},dg_grades=#{dg_grades},dg_picture=#{dg_picture} WHERE dg_id=#{dg_id}")
    public int updateCertificate(Dg_certificate dg_certificate);

    //删除证书
    @Delete("DELETE FROM dg_certificate WHERE id = #{id}")
    public Integer deleteByPrimaryKey(Integer id);


  ;
}
