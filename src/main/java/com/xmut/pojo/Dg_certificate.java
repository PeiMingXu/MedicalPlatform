package com.xmut.pojo;

public class Dg_certificate {
    private Integer id;
    private String dg_name;
    private String dg_grades;
    private String dg_picture;
    private int dg_id;
    private int dg_status;

    @Override
    public String toString() {
        return "Dg_certificate{" +
                "id=" + id +
                ", dg_name='" + dg_name + '\'' +
                ", dg_grades='" + dg_grades + '\'' +
                ", dg_picture='" + dg_picture + '\'' +
                ", dg_id=" + dg_id +
                ", dg_status=" + dg_status +
                '}';
    }

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

    public int getDg_id() {
        return dg_id;
    }

    public void setDg_id(int dg_id) {
        this.dg_id = dg_id;
    }

    public int getDg_status() {
        return dg_status;
    }

    public void setDg_status(int dg_status) {
        this.dg_status = dg_status;
    }
}