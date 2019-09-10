package com.sharer.dao.dao_yang;

import com.sharer.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikesDao {

    // 添加点赞
    public static boolean insertLikes(int Luid, int Lsid) {
        boolean insertStatus = false;
        Connection con = null;
        ResultSet set = null;
        String sql = "insert into likes values(null,?,?)";
        PreparedStatement pst = DBUtil.getPst(sql);
        try {
            con = pst.getConnection();
            pst.setInt(1, Luid);
            pst.setInt(2, Lsid);
            if (pst.executeUpdate() > 0) {
                insertStatus = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("点赞列表插入错误！");
        } finally {
            DBUtil.close(con, pst, set);
        }
        return insertStatus;
    }

    // 取消点赞
    public static boolean deleteLikes(int Luid, int Lsid) {
        String sql = "delete from likes where Luid = ? and Lsid = ?";
        Connection con = null;
        ResultSet set = null;
        boolean deleteStatus = false;
        PreparedStatement pst = DBUtil.getPst(sql);
        try {
            con = pst.getConnection();
            pst.setInt(1, Luid);
            pst.setInt(2, Lsid);
            if (pst.executeUpdate() > 0) {
                deleteStatus = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("取消点赞失败！");
        }
        return deleteStatus;
    }

    // 获得当前动态的点赞数
    public static int getLikesCount(int Lsid) {
        String sql = "SELECT COUNT(DISTINCT Luid) FROM likes WHERE Lsid = ?";
        int likesCount = 0;
        Connection con = null;
        ResultSet set = null;
        PreparedStatement pst = DBUtil.getPst(sql);
        try {
            con = pst.getConnection();
            pst.setInt(1, Lsid);
            set = pst.executeQuery();
             while (set.next())
            likesCount = set.getInt(1);  // 返回这条动态的点赞数
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("获得当前动态赞数失败！");
        } finally {
            DBUtil.close(con, pst, set);
        }
        return likesCount;
    }

    // 查看是否被点赞的状态
    public static boolean isLiked(int Luid, int Lsid) {
        String sql = "select * from likes where Luid = ? and Lsid = ?";
        Connection con = null;
        ResultSet set = null;
        boolean status = false;
        PreparedStatement pst = DBUtil.getPst(sql);
        try {
            con = pst.getConnection();
            pst.setInt(1, Luid);
            pst.setInt(2, Lsid);
            set = pst.executeQuery();
            if (set.next()) {
                status = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("查询点赞状态出错！");
        } finally {
            DBUtil.close(con, pst, set);
        }
        return status;
    }
}
