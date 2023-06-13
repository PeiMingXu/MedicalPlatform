package com.xmut.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xmut.entity.PageResult;
import com.xmut.mapper.UserMapper;
import com.xmut.pojo.User;
import com.xmut.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author
 * @date: 2023/4/25
 **/
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    //登陆
    @Override
    public User login(User user) {
        return userMapper.findUserByPhoneAndPassword(user);
    }

    //注册,添加用户
    @Override
    public boolean logon(User user) {
        //新增加的用户，默认状态设置为0
        user.setStatus(0);
        int result = userMapper.addUser(user);
        if (result>0){
            return true;
        }else {
            return false;
        }
    }
    //查找手机号
    @Override
    public String findPhone(String phone) {
        return userMapper.findByPhone(phone);
    }
    //查找全部用户，显示在表格
    @Override
    public PageResult findByAll(User user, Integer pageNum, Integer pageSize) {
        //开启分页查询
        PageHelper.startPage(pageNum,pageSize);
        //调用mapper
        Page<User> page = userMapper.findByAll(user);
        return new PageResult(page.getTotal(),page.getResult());
    }
    //通过id查询
    @Override
    public User findById(Integer id) {
        return userMapper.findById(id);
    }
    //账号封禁
    @Override
    public Integer borrowUser(User user) {

        return userMapper.borrowUser(user);//调用mapper
    }
    //用户编辑
    @Override
    public Integer esitUser(User user) {
        return userMapper.editUser(user);
    }

}
