package com.sharer.dao.dao_haiq;

import com.sharer.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FanDao {

    public static List<Integer> getUserList(String sql,int id,int flag){
        List<Integer> list = new ArrayList<>();
        PreparedStatement pst = DBUtil.getPst(sql);
        ResultSet set = null;
        Connection con = null;
        try {
            pst.setInt(1,id);
            set = pst.executeQuery();
            con = pst.getConnection();

            while(set.next()){
                list.add(set.getInt(flag));
            }
        } catch (SQLException e) {
            System.out.println("【getUserList（）】出错");
            e.printStackTrace();
        }finally {
            //释放资源
            DBUtil.close(con, pst, set);
        }
        return list;
    }
    //判断fid是不是sid的粉丝
    public static boolean isFan(int fid,int sid){
        String sql = "select * from Fan where Fuid = ? and Ffid = ?";
        return Dao.isInclude(sql,sid,fid);
    }
    //执行sql语句增加或删除Fan表数据
    public static int executeSql(String sql){
        PreparedStatement pst = DBUtil.getPst(sql);
        Connection con = null;
        int item = 0;
        try {
            con = pst.getConnection();
            item = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭资源
            DBUtil.close(con,pst,null);
        }
        return item;
    }
    //获得粉丝或关注对象的数量
    public static int getNumber(String sql){
        return Dao.getNmberBySql(sql);
    }
}
