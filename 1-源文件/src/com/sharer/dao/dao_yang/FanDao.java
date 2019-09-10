package com.sharer.dao.dao_yang;

import com.sharer.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FanDao {
    public static List<Integer> getFan(int id){
        List<Integer> list = new ArrayList<>();
        String sql = "select * from fan where Fuid = ?"; // 根据用户的Fuid去查询自己粉丝的Ffid
        PreparedStatement pst = DBUtil.getPst(sql);
        ResultSet set = null;
        Connection con = null;
        try {
            pst.setInt(1,id);
            set = pst.executeQuery();
            con = pst.getConnection();

            while(set.next()){
                list.add(set.getInt(3));
            }
        } catch (SQLException e) {
            System.out.println("【getUserFan（）】出错");
            e.printStackTrace();
        }finally {
            //释放资源
            DBUtil.close(con,pst,set);
        }
    return list;
    }

    //判断fid是不是sid的粉丝
    public static boolean isFan(int fid,int sid){
        boolean flag = false;
        String sql = "select * from Fan where Fuid = ? and Ffid = ?";
        PreparedStatement pst = DBUtil.getPst(sql);
        ResultSet set = null;
        Connection con = null;
        try {
            pst.setInt(1,sid);
            pst.setInt(2,fid);
            set = pst.executeQuery();
            con = pst.getConnection();
            if(set.next()){
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(con,pst,set);
        }
        return flag;
    }

    public static List<Integer> getFuid(int Uid){
        List<Integer> list = new ArrayList<>();
        String sql = "select distinct Fuid from fan where Ffid = ?"; // 获取当前登录用户的idol和自己的id不能重复（Fuid）
        PreparedStatement pst = DBUtil.getPst(sql);
        ResultSet set = null;
        Connection con = null;
        try {
            pst.setInt(1,Uid);
            set = pst.executeQuery();
            while (set.next()){
                int Fuid = set.getInt(1);
                list.add(Fuid);
            }
            list.add(Uid);// 添加当前用户的id
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("getIdol 出错！");
        }finally {
            DBUtil.close(con,pst,set);
        }
        return list;

    }
}
