package com.xmut.service;

import com.xmut.entity.PageResult;
import com.xmut.pojo.User;

/**
 * @author
 * @date: 2023/4/25
 **/
public interface UserService {

    //登陆
    public User login(User user);
    //注册,添加用户
    public boolean logon(User user);
    //查找账号
    public String findPhone(String phone);
    //查询全部用户
    public PageResult findByAll(User user, Integer pageNum,Integer pageSize);
    //通过id查询
    public User findById(Integer id);
    //账号封禁
    public Integer borrowUser(User user);
    //账号编辑
    public Integer esitUser(User user);
}
