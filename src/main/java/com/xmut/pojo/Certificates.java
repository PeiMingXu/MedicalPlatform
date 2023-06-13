package com.xmut.pojo;

/**
 * @author
 * @date: 2023/5/31
 **/
public class Certificates {
    private Integer id;
    private String dg_name;
    private String dg_grades;
    private String dg_picture;
    //一对一映射
    private User user;
    private Integer dg_status;
    private String  dg_reason;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDg_name() {
        return dg_name;
    }

    public void setDg_name(String dg_name) {
        this.dg_name = dg_name;
    }

    public String getDg_grades() {
        return dg_grades;
    }

    public void setDg_grades(String dg_grades) {
        this.dg_grades = dg_grades;
    }

    public String getDg_picture() {
        return dg_picture;
    }

    public void setDg_picture(String dg_picture) {
        this.dg_picture = dg_picture;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getDg_status() {
        return dg_status;
    }

    public void setDg_status(Integer dg_status) {
        this.dg_status = dg_status;
    }

    public String getDg_reason() {
        return dg_reason;
    }

    public void setDg_reason(String dg_reason) {
        this.dg_reason = dg_reason;
    }

    @Override
    public String toString() {
        return "Certificates{" +
                "id=" + id +
                ", dg_name='" + dg_name + '\'' +
                ", dg_grades='" + dg_grades + '\'' +
                ", dg_picture='" + dg_picture + '\'' +
                ", user=" + user +
                ", dg_status=" + dg_status +
                ", dg_reason='" + dg_reason + '\'' +
                '}';
    }
}
