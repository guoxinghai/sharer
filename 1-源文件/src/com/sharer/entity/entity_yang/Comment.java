package com.sharer.entity.entity_yang;

public class Comment {
    private int cid;
    private int cuid;
    private int csid;
    private String ctime;
    private String ctext;

    public Comment(int cid, int cuid, int csid, String ctime, String ctext) {
        this.cid = cid;
        this.cuid = cuid;
        this.csid = csid;
        this.ctime = ctime;
        this.ctext = ctext;
    }

    public Comment(int cuid, int csid, String ctime, String ctext) {
        this.cuid = cuid;
        this.csid = csid;
        this.ctime = ctime;
        this.ctext = ctext;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getCuid() {
        return cuid;
    }

    public void setCuid(int cuid) {
        this.cuid = cuid;
    }

    public int getCsid() {
        return csid;
    }

    public void setCsid(int csid) {
        this.csid = csid;
    }

    public String getCtime() {
        return ctime;
    }

    public void setCtime(String ctime) {
        this.ctime = ctime;
    }

    public String getCtext() {
        return ctext;
    }

    public void setCtext(String ctext) {
        this.ctext = ctext;
    }
}
