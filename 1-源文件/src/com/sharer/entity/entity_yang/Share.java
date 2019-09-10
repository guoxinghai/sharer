package com.sharer.entity.entity_yang;

public class Share {
    private int sid;
    private int suid;
    private String stext;
    private String simg;
    private String stime;
    private int svisible;

    public String getStime() {
        return stime;
    }

    public void setStime(String stime) {
        stime = stime;
    }

    public  Share(){};
    public Share(int Sid,int Suid,String Stext,String Simg,String Stime,int Svisible){
        this.sid = Sid;
        this.suid = Suid;
        this.stext = Stext;
        this.simg = Simg;
        this.stime = Stime;
        this.svisible = Svisible;
    }
    public Share(int Suid,String Stext,String Simg,String Stime,int Svisible){

        this.suid = Suid;
        this.stext = Stext;
        this.simg = Simg;
        this.stime = Stime;
        this.svisible = Svisible;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getSuid() {
        return suid;
    }

    public void setSuid(int suid) {
        this.suid = suid;
    }

    public String getStext() {
        return stext;
    }

    public void setStext(String stext) {
        this.stext = stext;
    }

    public String getSimg() {
        return simg;
    }

    public void setSimg(String simg) {
        this.simg = simg;
    }

    public int getSvisible() {
        return svisible;
    }

    public void setSvisible(int svisible) {
        this.svisible = svisible;
    }
}
