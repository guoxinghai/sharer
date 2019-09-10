package com.sharer.entity.entity_haiq;

public class Share {
    private int sid;
    private int suid;
    private String stext;
    private String simg;
    private String stime;
    private int svisible;

    public Share() {
    }

    public Share(int sid, int suid, String stext, String simg, String stime, int svisible) {
        this.sid = sid;
        this.suid = suid;
        this.stext = stext;
        this.simg = simg;
        this.stime = stime;
        this.svisible = svisible;
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

    public String getStime() {
        return stime;
    }

    public void setStime(String stime) {
        this.stime = stime;
    }

    public int getSvisible() {
        return svisible;
    }

    public void setSvisible(int svisible) {
        this.svisible = svisible;
    }
}
