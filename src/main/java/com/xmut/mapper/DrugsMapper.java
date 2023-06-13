package com.xmut.mapper;

import com.github.pagehelper.Page;
import com.xmut.pojo.Drugs;

import com.xmut.pojo.User;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author
 * @date: 2023/5/20
 **/
public interface DrugsMapper {
    //通过id查询
    @Select("select * from durgs where d_id=#{d_id}")
    public Drugs findById(Integer id);


    //查询全部药材
    @Select("<script>\n" +
            "        select * from durgs\n" +
            "        <where>\n" +
            "            <if test=\"d_name!=null and d_name.trim()!=''\">\n" +
            "                and d_name like concat('%',#{d_name},'%')\n" +
            "            </if>\n" +
            "            <if test=\"d_indication!=null and d_indication.trim()!=''\">\n" +
            "                and d_indication like concat('%',#{d_indication},'%')\n" +
            "            </if>\n" +
            "            <if test=\"d_use!=null and d_use.trim()!=''\">\n" +
            "                and d_use like concat('%',#{d_use},'%')\n" +
            "            </if>\n" +
            "        </where>\n" +
            "        order by d_id\n" +
            "    </script>")
    public Page<Drugs> findByAll(Drugs drugs);


    //查找药材名
    @Select("select * from durgs where d_name=#{d_name}")
    @Results(id = "phoneResult",value = {
            @Result(property ="d_name",column ="d_name"),
    })
    public String findByD_name(String d_name);


    //添加药材
    public Integer addDrugs(Drugs drugs);


    //药材信息修改
    public Integer editDrugs(Drugs drugs);

    //药材下架
    public Integer borrowDrugs(Drugs drugs);

    public List<Drugs> allfindDurgs();






}
