package com.sharer.entity.entity_yang;

public class Admin {

    private  int aid;
    private String aname;
    private String agender;
    private String aemail;
    private String aphone;
    private String abirth;
    private String aimg;
    private String apwd;

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getAgender() {
        return agender;
    }

    public void setAgender(String agender) {
        this.agender = agender;
    }

    public String getAemail() {
        return aemail;
    }

    public void setAemail(String aemail) {
        this.aemail = aemail;
    }

    public String getAphone() {
        return aphone;
    }

    public void setAphone(String aphone) {
        this.aphone = aphone;
    }

    public String getAbirth() {
        return abirth;
    }

    public void setAbirth(String abirth) {
        this.abirth = abirth;
    }

    public String getAimg() {
        return aimg;
    }

    public void setAimg(String aimg) {
        this.aimg = aimg;
    }

    public String getApwd() {
        return apwd;
    }

    public void setApwd(String apwd) {
        this.apwd = apwd;
    }



    public Admin(){}

    public Admin(String aname,String apwd){
        this.aname = aname;
        this.apwd = apwd;
    }


}
