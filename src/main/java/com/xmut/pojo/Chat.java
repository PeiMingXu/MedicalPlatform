package com.xmut.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Chat {
    private Integer id;
    private Integer dc_id;
    private Integer u_id;
    private String status;
    private Integer chat_number;
    private String u_name;
    private Date create_time;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDc_id() {
        return dc_id;
    }

    public void setDc_id(Integer dc_id) {
        this.dc_id = dc_id;
    }

    public Integer getU_id() {
        return u_id;
    }

    public void setU_id(Integer u_id) {
        this.u_id = u_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getChat_number() {
        return chat_number;
    }

    public void setChat_number(Integer chat_number) {
        this.chat_number = chat_number;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public Date getCreate_time() {
        return create_time;
    }
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    @Override
    public String toString() {
        return "Chat{" +
                "id=" + id +
                ", dc_id=" + dc_id +
                ", u_id=" + u_id +
                ", status='" + status + '\'' +
                ", chat_number=" + chat_number +
                ", u_name='" + u_name + '\'' +
                ", create_time=" + create_time +
                '}';
    }
}
