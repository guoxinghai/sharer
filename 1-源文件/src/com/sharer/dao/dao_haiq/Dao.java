package com.sharer.dao.dao_haiq;

import com.sharer.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Dao {
    //通过sql语句查询某个表中符合条件的的元组个数
    public static int getNmberBySql(String sql){
        int number  = 0;
        PreparedStatement pst = DBUtil.getPst(sql);
        ResultSet set = null;
        Connection con = null;
        try {
            set = pst.executeQuery();
            con = pst.getConnection();
            if(set.next()){
                number = set.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(con,pst,set);
        }
        return number;
    }
    //通过2 个int元素和sql判断表中是否含有某条数据
    public static boolean isInclude(String sql,int e1,int e2){
        boolean flag = false;
        PreparedStatement pst = DBUtil.getPst(sql);
        ResultSet set = null;
        Connection con = null;
        try {
            pst.setInt(1,e1);
            pst.setInt(2,e2);
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
    //通过sql语句和2个int属性增加或删除数据
    public static boolean operateBySql(String sql,int e1, int e2){
        boolean flag = false;
        PreparedStatement pst = DBUtil.getPst(sql);
        Connection con = null;
        try {
            pst.setInt(1,e1);
            pst.setInt(2,e2);
            con = pst.getConnection();
            if(pst.executeUpdate() > 0){
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(con,pst,null);
        }
        return flag;
    }
}
