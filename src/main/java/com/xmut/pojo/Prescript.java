package com.xmut.pojo;

import java.util.List;

/**
 * @author
 * @date: 2023/5/19
 **/
public class Prescript {
    private Integer id;
    //一对一映射
    private User user;
    private String p_symptom;
    private String p_drugs;
    //一对一映射
    private User user1;
    //一对一映射
    private User user2;
    private Integer p_status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getP_symptom() {
        return p_symptom;
    }

    public void setP_symptom(String p_symptom) {
        this.p_symptom = p_symptom;
    }

    public String getP_drugs() {
        return p_drugs;
    }

    public void setP_drugs(String p_drugs) {
        this.p_drugs = p_drugs;
    }

    public User getUser1() {
        return user1;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
    }

    public User getUser2() {
        return user2;
    }

    public void setUser2(User user2) {
        this.user2 = user2;
    }

    public Integer getP_status() {
        return p_status;
    }

    public void setP_status(Integer p_status) {
        this.p_status = p_status;
    }

    @Override
    public String toString() {
        return "Prescript{" +
                "id=" + id +
                ", user=" + user +
                ", p_symptom='" + p_symptom + '\'' +
                ", p_drugs='" + p_drugs + '\'' +
                ", user1=" + user1 +
                ", user2=" + user2 +
                ", p_status=" + p_status +
                '}';
    }
}
