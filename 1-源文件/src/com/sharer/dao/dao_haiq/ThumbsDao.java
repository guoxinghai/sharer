package com.sharer.dao.dao_haiq;

import com.sharer.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ThumbsDao {
    //判断用户是否给某个评论点了赞
    public static boolean isThumbs(int uid,int cid){
        String sql = "select * from thumbs where Tuid=? and Tcid=?";
        PreparedStatement pst = DBUtil.getPst(sql);
        ResultSet set = null;
        Connection con = null;
        try {
            pst.setInt(1,uid);
            pst.setInt(2,cid);
            set = pst.executeQuery();
            con = pst.getConnection();
            if(set.next()){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(con,pst,set);
        }
        return false;
    }
    //通过sql语句操作（删除，增加）thumbs表
    public static int operate(String sql,int uid,int cid){
        int flag = 0;
        PreparedStatement pst = DBUtil.getPst(sql);
        Connection con = null;
        try {
            pst.setInt(1,uid);
            pst.setInt(2,cid);
            flag = pst.executeUpdate();
            con = pst.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(con,pst,null);
        }
        return flag;
    }
    //获取某个评论得点赞数
    public static int getThumbsNumber(int cid){
        String sql = "select count(*) from thumbs where Tcid = ?";
        PreparedStatement pst = DBUtil.getPst(sql);
        ResultSet set = null;
        Connection con = null;
        int num = 0;
        try {
            pst.setInt(1,cid);
            con = pst.getConnection();
            set = pst.executeQuery();
            if(set.next()){
                num = set.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(con,pst,set);
        }
        return num;
    }

}
