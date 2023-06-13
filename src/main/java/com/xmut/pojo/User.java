package com.xmut.pojo;

import java.io.Serializable;

/**
 * @author
 * @date: 2023/4/25
 **/
public class User implements Serializable {//实现Serializable,适用于一些第三方框架
    private Integer id;
    private String name;
    private String password;
    private String phone;
    private String role;
    private Integer status;
    private String dc_image;
    private String dc_isonline;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDc_image() {
        return dc_image;
    }

    public void setDc_image(String dc_image) {
        this.dc_image = dc_image;
    }

    public String getDc_isonline() {
        return dc_isonline;
    }

    public void setDc_isonline(String dc_isonline) {
        this.dc_isonline = dc_isonline;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", role='" + role + '\'' +
                ", status=" + status +
                ", dc_image='" + dc_image + '\'' +
                ", dc_isonline='" + dc_isonline + '\'' +
                '}';
    }
}
