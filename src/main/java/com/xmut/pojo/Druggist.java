package com.xmut.pojo;

import java.util.List;

public class Druggist {
    private int id;
    private String user;
    private String pwd;
    private String name;
    private String six;
    private int grades;
    private String clas;
    //一对多：药剂书的证书
    private List<Dg_certificate> dg_certificateList;
    //一对多：药剂师审核的药单
    private List<Dg_Prescript> dg_prescriptList;

    @Override
    public String toString() {
        return "Druggist{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", pwd='" + pwd + '\'' +
                ", name='" + name + '\'' +
                ", six='" + six + '\'' +
                ", grades=" + grades +
                ", clas='" + clas + '\'' +
                ", dg_certificateList=" + dg_certificateList +
                ", dg_prescriptList=" + dg_prescriptList +
                '}';
    }

    public List<Dg_Prescript> getDg_prescriptList() {
        return dg_prescriptList;
    }

    public void setDg_prescriptList(List<Dg_Prescript> dg_prescriptList) {
        this.dg_prescriptList = dg_prescriptList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSix() {
        return six;
    }

    public void setSix(String six) {
        this.six = six;
    }


    public int getGrades() {
        return grades;
    }

    public void setGrades(int grades) {
        this.grades = grades;
    }

    public String getClas() {
        return clas;
    }

    public void setClas(String clas) {
        this.clas = clas;
    }

    public List<Dg_certificate> getDg_certificateList() {
        return dg_certificateList;
    }

    public void setDg_certificateList(List<Dg_certificate> dg_certificateList) {
        this.dg_certificateList = dg_certificateList;
    }
}
