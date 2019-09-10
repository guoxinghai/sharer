package com.sharer.entity.entity_yang;

public class Likes {
    private int lid;
    private int luid;
    private int lsid;

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public int getLuid() {
        return luid;
    }

    public void setLuid(int luid) {
        this.luid = luid;
    }

    public int getLsid() {
        return lsid;
    }

    public void setLsid(int lsid) {
        this.lsid = lsid;
    }

    public Likes(){

    }

    public Likes(int Lid,int Luid,int Lsid){
        this.lid = Lid;
        this.luid = Luid;
        this.lsid = Lsid;
    }

}
