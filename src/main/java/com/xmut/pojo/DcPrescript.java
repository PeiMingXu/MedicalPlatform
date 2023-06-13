package com.xmut.pojo;

/**
 * @author
 * @date: 2023/5/19
 **/
public class DcPrescript {
    private Integer p_id;
    private Integer p_user;
    private String p_symptom;
    private String p_drugs;
    private Integer dc_id;
    private Integer dr_id;
    private String dr_comment;
    private Integer p_status;
    private String username;
    private String doctorname;

    public Integer getP_id() {
        return p_id;
    }

    public void setP_id(Integer p_id) {
        this.p_id = p_id;
    }

    public Integer getP_user() {
        return p_user;
    }

    public void setP_user(Integer p_user) {
        this.p_user = p_user;
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

    public Integer getDc_id() {
        return dc_id;
    }

    public void setDc_id(Integer dc_id) {
        this.dc_id = dc_id;
    }

    public Integer getDr_id() {
        return dr_id;
    }

    public void setDr_id(Integer dr_id) {
        this.dr_id = dr_id;
    }

    public String getDr_comment() {
        return dr_comment;
    }

    public void setDr_comment(String dr_comment) {
        this.dr_comment = dr_comment;
    }

    public Integer getP_status() {
        return p_status;
    }

    public void setP_status(Integer p_status) {
        this.p_status = p_status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDoctorname() {
        return doctorname;
    }

    public void setDoctorname(String doctorname) {
        this.doctorname = doctorname;
    }

    @Override
    public String toString() {
        return "DcPrescript{" +
                "p_id=" + p_id +
                ", p_user=" + p_user +
                ", p_symptom='" + p_symptom + '\'' +
                ", p_drugs='" + p_drugs + '\'' +
                ", dc_id=" + dc_id +
                ", dr_id=" + dr_id +
                ", dr_comment='" + dr_comment + '\'' +
                ", p_status=" + p_status +
                ", username='" + username + '\'' +
                ", doctorname='" + doctorname + '\'' +
                '}';
    }
}
