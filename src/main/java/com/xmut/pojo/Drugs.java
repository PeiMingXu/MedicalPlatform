package com.xmut.pojo;

public class Drugs {

    private Integer d_id;  //药品id
    private String d_name; //药品名称
    private String d_indication; //适应症
    private String d_use; //用法用量
    private String d_picture;//图片
    private Integer d_status;//状态

    public Integer getD_id() {
        return d_id;
    }

    public void setD_id(Integer d_id) {
        this.d_id = d_id;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }

    public String getD_indication() {
        return d_indication;
    }

    public void setD_indication(String d_indication) {
        this.d_indication = d_indication;
    }

    public String getD_use() {
        return d_use;
    }

    public void setD_use(String d_use) {
        this.d_use = d_use;
    }

    public String getD_picture() {
        return d_picture;
    }

    public void setD_picture(String d_picture) {
        this.d_picture = d_picture;
    }

    public Integer getD_status() {
        return d_status;
    }

    public void setD_status(Integer d_status) {
        this.d_status = d_status;
    }

    @Override
    public String toString() {
        return "Drugs{" +
                "d_id=" + d_id +
                ", d_name='" + d_name + '\'' +
                ", d_indication='" + d_indication + '\'' +
                ", d_use='" + d_use + '\'' +
                ", d_picture='" + d_picture + '\'' +
                ", d_status=" + d_status +
                '}';
    }
}
