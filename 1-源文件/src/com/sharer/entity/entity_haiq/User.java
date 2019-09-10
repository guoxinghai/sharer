package com.sharer.entity.entity_haiq;

public class User {
    private int uid;
    private String uname;
    private String upwd;
    private String ugender;
    private String uemail;
    private String uphone;
    private String ubirth;
    private String uimg;
    private int ustatus;
    private String uwords;
    ////Uid ,Uid=?, Ugender=?,Uemail=?,Uphone=?,Ubirth=?,Uimg=?
    public User(){}
    public User(int Uid,String Uname,String Ugender,String Uemail,String Uphone,String Ubirth,String Uimg){
        this.setUname(Uname);
        this.setUid(Uid);
        this.setUgender(Ugender);
        this.setUemail(Uemail);
        this.setUphone(Uphone);
        this.setUbirth(Ubirth);
        if(Uimg==null){
            this.setUimg("defaultImg.jpeg");
        }else{
            this.setUimg(Uimg);
        }
    }
    public User(int Uid,String Uname,String Ugender,String Uemail,String Uphone,String Ubirth,String Uimg,String Upwd,int Ustatus,String Uwords){
        this(Uid,Uname,Ugender,Uemail,Uphone,Ubirth,Uimg);
        this.setUpwd(Upwd);
        this.setUstatus(Ustatus);
        this.setUwords(Uwords);

    }

    public User(String uname, String ugender, String uemail, String uphone, String ubirth, String uwords) {
        this.uname = uname;
        this.ugender = ugender;
        this.uemail = uemail;
        this.uphone = uphone;
        this.ubirth = ubirth;
        this.uwords = uwords;
        this.uimg="defaultImg.jpeg";
    }
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getUgender() {
        return ugender;
    }

    public void setUgender(String ugender) {
        this.ugender = ugender;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone;
    }

    public String getUbirth() {
        return ubirth;
    }

    public void setUbirth(String ubirth) {
        this.ubirth = ubirth;
    }

    public String getUimg() {
        return uimg;
    }

    public void setUimg(String uimg) {
        this.uimg = uimg;
    }

    public int getUstatus() {
        return ustatus;
    }

    public void setUstatus(int ustatus) {
        this.ustatus = ustatus;
    }

    public String getUwords(){
        return this.uwords;
    }

    public void setUwords(String uwords){
        this.uwords = uwords;
    }
}
