/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sharer.entity.entity_yan;

/**
 *
 * @author 浪里追大白
 */
public class Admin {
      private int  aid;
      private String  aname;
      private String  agender;
      private String  aemail;
      private String  aphone;
      private String  abirth;
      private String  aimg;
      private String apwd;
      
      public  Admin(int  aid, String aname,String agender,String aemail,String aphone,String abirth,String aimg,String apwd){
                 this.aid=aid;
                 this.aname=aname;
                 this.agender=agender;
                 this.aemail=aemail;
                 this.aphone=aphone;
                 this.abirth=abirth;
                this.aimg=aimg;
                this.apwd=apwd;
                 
      }

    public Admin() {
    }


      
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
      
}
