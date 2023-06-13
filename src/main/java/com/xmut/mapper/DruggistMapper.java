package com.xmut.mapper;

import com.xmut.pojo.Dg_Prescript;
import com.xmut.pojo.Druggist;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface DruggistMapper {
    //注册
    @Insert("insert into druggist_view(user,pwd,name,six,ages,clas)values(#{user},#{pwd},#{name},#{six},#{ages},#{clas})")
    public int insertDruggist(Druggist druggist);

    //修改药剂师信息
    @Update("update druggist_view set pwd=#{pwd} where user=#{user}")
    public int updateDruggist(Druggist druggist);

    //注销
    @Update("update druggist_view set pwd=#{pwd} where user=#{user}")
    public int deleteDruggist(Druggist druggist);

    //查询个人性息
    @Select("select * from druggist_view where user=#{user}")
    public Druggist selectDruggistById(String user);

    //查询所有药剂师信息
    @Select("sselect * from prescript_view")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "selectPrescript",
                    many = @Many(select = "com.xmut.mapper.DruggistMapper.selectDruggistById")
            )
    })
    public List<Dg_Prescript> findByAll(Dg_Prescript dg_prescript);

    //查询药单
    @Select("select * from prescript_view where p_status=1")
    public List<Dg_Prescript> selectDg_PrescriptAll();
    //药单审核
    @Update("update prescript set dr_id=#{dr_id},dr_comment=#{dr_comment},p_status=#{p_status} where p_id=#{p_id}")
    public int updatePrescriptionById(Dg_Prescript dg_prescript);

    //查询个人审核药单
    @Select("select * from prescript_view where dr_id=#{dr_id} and p_status=2")
    public List<Dg_Prescript> selectDg_PrescriptById(int dr_id);
    //根据药剂师查询个人审核药单
    @Select("select * from druggist_view where user=#{user} ")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "dg_prescriptList",
                    many = @Many(select = "com.xmut.mapper.DruggistMapper.selectDg_PrescriptById")
            )
    })
    public Druggist selectDg_PrescriptByUser(String user);
}


