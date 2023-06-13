package com.xmut.pojo;

public class Doctor {
    private Integer user_id;
    private String user_name;
    private String user_password;
    private String user_phone;
    private String user_role;
    private Integer user_status;
    private String dc_title;
    private String dc_hospital;
    private String dc_department;
    private String dc_speciality;
    private Integer dc_evaluate;
    private String dc_image;
    private Double user_balance;
    private String dc_isonline;

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getUser_role() {
        return user_role;
    }

    public void setUser_role(String user_role) {
        this.user_role = user_role;
    }

    public Integer getUser_status() {
        return user_status;
    }

    public void setUser_status(Integer user_status) {
        this.user_status = user_status;
    }

    public String getDc_title() {
        return dc_title;
    }

    public void setDc_title(String dc_title) {
        this.dc_title = dc_title;
    }

    public String getDc_hospital() {
        return dc_hospital;
    }

    public void setDc_hospital(String dc_hospital) {
        this.dc_hospital = dc_hospital;
    }

    public String getDc_department() {
        return dc_department;
    }

    public void setDc_department(String dc_department) {
        this.dc_department = dc_department;
    }

    public String getDc_speciality() {
        return dc_speciality;
    }

    public void setDc_speciality(String dc_speciality) {
        this.dc_speciality = dc_speciality;
    }

    public String getDc_image() {
        return dc_image;
    }

    public void setDc_image(String dc_image) {
        this.dc_image = dc_image;
    }

    public Integer getDc_evaluate() {
        return dc_evaluate;
    }

    public void setDc_evaluate(Integer dc_evaluate) {
        this.dc_evaluate = dc_evaluate;
    }

    public Double getUser_balance() {
        return user_balance;
    }

    public void setUser_balance(Double user_balance) {
        this.user_balance = user_balance;
    }

    public String getDc_isonline() {
        return dc_isonline;
    }

    public void setDc_isonline(String dc_isonline) {
        this.dc_isonline = dc_isonline;
    }

    @Override
    public String toString() {
        return "Doctor{" +
                "user_id=" + user_id +
                ", user_name='" + user_name + '\'' +
                ", user_password='" + user_password + '\'' +
                ", user_phone='" + user_phone + '\'' +
                ", user_role='" + user_role + '\'' +
                ", user_status=" + user_status +
                ", dc_title='" + dc_title + '\'' +
                ", dc_hospital='" + dc_hospital + '\'' +
                ", dc_department='" + dc_department + '\'' +
                ", dc_speciality='" + dc_speciality + '\'' +
                ", dc_evaluate=" + dc_evaluate +
                ", dc_image='" + dc_image + '\'' +
                ", user_balance=" + user_balance +
                ", dc_isonline='" + dc_isonline + '\'' +
                '}';
    }
}
