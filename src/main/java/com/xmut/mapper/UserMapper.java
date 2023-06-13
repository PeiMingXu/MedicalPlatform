package com.xmut.mapper;

import com.github.pagehelper.Page;
import com.xmut.pojo.User;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

/**
 * @author
 * @date: 2023/5/11
 **/
public interface UserMapper {

    //用户登陆
    @Select("select * from user where user_phone=#{phone} and user_password=#{password} and user_status='0'")
    @Results(id = "userResult",value = {
            @Result(id = true,property = "id",column = "user_id"),
            @Result(property ="name",column="user_name"),
            @Result(property ="password",column ="user_password"),
            @Result(property ="phone",column ="user_phone"),
            @Result(property ="role",column ="user_role"),
            @Result(property ="status",column ="user_status")
    })
    public User findUserByPhoneAndPassword(User user);

    //用户注册,添加用户
    public Integer addUser(User user);

    //查找手机号
    @Select("select * from user where user_phone=#{phone}")
    @Results(id = "phoneResult",value = {
            @Result(property ="phone",column ="user_phone"),
    })
    public String findByPhone(String phone);

    //查询全部用户
    @Select("<script>\n" +
            "        select * from user\n" +
            "        <where>\n" +
            "            <if test=\"name!=null and name.trim()!=''\">\n" +
            "                and user_name like concat('%',#{name},'%')\n" +
            "            </if>\n" +
            "            <if test=\"phone!=null and phone.trim()!=''\">\n" +
            "                and user_phone like concat('%',#{phone},'%')\n" +
            "            </if>\n" +
            "            <if test=\"role!=null and role.trim()!=''\">\n" +
            "                and user_role like concat('%',#{role},'%')\n" +
            "            </if>\n" +
            "        </where>\n" +
            "        order by user_status\n" +
            "    </script>")
    @ResultMap("userResult")
    public Page<User> findByAll(User user);

    //通过id查询
    @Select("select * from user where user_id=#{id}")
    @ResultMap("userResult")
    public User findById(Integer id);

    //用户封禁
    public Integer borrowUser(User user);

    //用户修改
    public Integer editUser(User user);


}
