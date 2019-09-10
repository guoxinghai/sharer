/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sharer.dao.dao_yan;

import com.sharer.entity.entity_yan.Admin;
import com.sharer.util.DatabaseUtil;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 浪里追大白
 */
public class AdminDao {

    public List<Admin> SelectAdmin() {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Admin> list = new ArrayList();

        try {
            con = DatabaseUtil.getConnection();
            ps = con.prepareStatement("select * from admin ");
            rs = ps.executeQuery();
            while (rs.next()) { //next()判断有没有下一行，并移动到下一行
                int aid = rs.getInt(1);
                String aname = rs.getString(2);
                String agender = rs.getString(3);
                String aemail = rs.getString(4);
                String aphone = rs.getString(5);
                String abirth = rs.getString(6);
                String aimg = rs.getString(7);
                String apwd = rs.getString(8);
                Admin Admin = new Admin(aid, aname, agender, aemail, aphone, abirth, aimg, apwd);
                list.add(Admin);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
        return list;
    }

    //更新管理员的信息
    public void updateMessage(Admin Admin, String name) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DatabaseUtil.getConnection();
            String sql = " Update admin set aname=?,aid=?,aphone=?,aemail=?,abirth=? where aname=?";
            ps = con.prepareStatement(sql);
//            System.out.println(name);
            ps.setString(1, Admin.getAname());
            ps.setInt(2, Admin.getAid());
            ps.setString(3, Admin.getAphone());
            ps.setString(4, Admin.getAemail());
            ps.setString(5, Admin.getAbirth());
            ps.setString(6, name);

            if (ps.executeUpdate() > 0) {
                System.out.println("信息更新成功");
            } else {
                System.out.println("信息更新失败！");
            }
//            System.out.println(Admin.getAname());
//            System.out.println(Admin.getAphone());
//            System.out.println(Admin.getAemail());         
//            System.out.println(Admin.getAbirth());
//           int i = ps.executeUpdate();
//            System.out.println(i);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
//return null;
    }

    //通过Admin姓名查询信息
    public List<Admin> SelectMessagebyName(String name) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Admin> list = new ArrayList();

        try {
            con = DatabaseUtil.getConnection();
            ps = con.prepareStatement("select * from admin where  aname=?");
            rs = ps.executeQuery();
            ps.setString(1, name);
            while (rs.next()) { //next()判断有没有下一行，并移动到下一行

                int aid = rs.getInt(1);
                String aname = rs.getString(2);
                String agender = rs.getString(3);
                String aemail = rs.getString(4);
                String aphone = rs.getString(5);
                String abirth = rs.getString(6);
                String aimg = rs.getString(7);
                String apwd = rs.getString(8);
                Admin Admin = new Admin(aid, aname, agender, aemail, aphone, abirth, aimg, apwd);
                list.add(Admin);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
        return list;

    }
//        管理员修改密码

    public void UpdatepwdbyID(String pwd, int id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DatabaseUtil.getConnection();
            String sql = " Update admin set apwd=? where aid=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, pwd);
            ps.setInt(2, id);
            ps.executeUpdate();
            if (ps.executeUpdate() > 0) {
                System.out.println("密码更新成功");
            } else {
                System.out.println("密码更新失败！");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }

    }
    //封号

    public void titlesUser(int id) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DatabaseUtil.getConnection();
            String sql = " Update users set Ustatus=1 where Uid=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();     
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
    }
    //解封
      public void unblockUser(int id) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DatabaseUtil.getConnection();
            String sql = " Update users set Ustatus=0 where Uid=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();     
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
    }
    //更新管理员头像

    public void UpdateAdminImg(String img, int id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DatabaseUtil.getConnection();
            String sql = " Update admin set aimg=? where aid=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, img);
            ps.setInt(2, id);
            ps.executeUpdate();
            if (ps.executeUpdate() > 0) {
                System.out.println("头像更新成功");
            } else {
                System.out.println("头像更新失败！");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }

    }
    //将图片上传到数据库

    public void uploadImg() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String path = "C:\\Users\\浪里追大白\\Documents\\NetBeansProjects\\Share\\web\\images";
        File file = new File(path);
        File[] arr = file.listFiles();

        con = DatabaseUtil.getConnection();
        for (int i = 0; i < arr.length; i++) {
            File item = arr[i];
            String name = item.getName();
            String sql = "insert into Adminimgs values (null,?)";
            try {
                ps = con.prepareStatement(sql);
                ps.setString(1, name);
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                DatabaseUtil.close(rs, ps, con);
            }

        }

    }
    //通过用户id查询密码
          public String SelectAdminpwdByid(int id) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String pwd= null;
        try {
            con = DatabaseUtil.getConnection();
            String sql = " select apwd from admin where aid=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            rs=ps.executeQuery();
            while (rs.next()) {
           pwd=rs.getString(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
         return pwd;
    }
}
