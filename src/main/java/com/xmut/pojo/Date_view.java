package com.xmut.pojo;

/**
 * @author
 * @date: 2023/5/31
 **/
public class Date_view {
    private Integer user_id;
    private String user_name;
    private String dc_evaluate;
    private Integer user_balance;

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

    public String getDc_evaluate() {
        return dc_evaluate;
    }

    public void setDc_evaluate(String dc_evaluate) {
        this.dc_evaluate = dc_evaluate;
    }

    public Integer getUser_balance() {
        return user_balance;
    }

    public void setUser_balance(Integer user_balance) {
        this.user_balance = user_balance;
    }

    @Override
    public String toString() {
        return "Date_view{" +
                "user_id=" + user_id +
                ", user_name='" + user_name + '\'' +
                ", dc_evaluate='" + dc_evaluate + '\'' +
                ", user_balance=" + user_balance +
                '}';
    }
}
