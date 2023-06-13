package com.xmut.pojo;

public class Dg_Prescript {
    private int p_id;
    private String u_name;
    private String p_symptom;
    private String dc_name;
    private String p_drugs;
    private int dr_id;
    private String dr_comment;
    private int p_status;

    @Override
    public String toString() {
        return "Dg_Prescript{" +
                "p_id=" + p_id +
                ", u_name='" + u_name + '\'' +
                ", p_symptom='" + p_symptom + '\'' +
                ", dc_name='" + dc_name + '\'' +
                ", p_drugs='" + p_drugs + '\'' +
                ", dr_id=" + dr_id +
                ", dr_comment='" + dr_comment + '\'' +
                ", p_status=" + p_status +
                '}';
    }

    public String getDr_comment() {
        return dr_comment;
    }

    public void setDr_comment(String dr_comment) {
        this.dr_comment = dr_comment;
    }

    public int getDr_id() {
        return dr_id;
    }

    public void setDr_id(int dr_id) {
        this.dr_id = dr_id;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getP_symptom() {
        return p_symptom;
    }

    public void setP_symptom(String p_symptom) {
        this.p_symptom = p_symptom;
    }

    public String getDc_name() {
        return dc_name;
    }

    public void setDc_name(String dc_name) {
        this.dc_name = dc_name;
    }

    public String getP_drugs() {
        return p_drugs;
    }

    public void setP_drugs(String p_drugs) {
        this.p_drugs = p_drugs;
    }

    public int getP_status() {
        return p_status;
    }

    public void setP_status(int p_status) {
        this.p_status = p_status;
    }
}
