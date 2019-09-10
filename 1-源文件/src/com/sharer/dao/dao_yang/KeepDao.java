package com.sharer.dao.dao_yang;

import com.sharer.entity.entity_yang.Keep;
import com.sharer.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class KeepDao {
    // 添加收藏
    public static boolean insertKeep(Keep keep) {
        boolean status = false;
        Connection con = null;
        ResultSet set = null;
        String sql = "Insert into Keep values(null,?,?,?)";
        PreparedStatement pst = DBUtil.getPst(sql);
        try {
            con = pst.getConnection();
            pst.setInt(1, keep.getKuid());
            pst.setInt(2, keep.getKsid());
            pst.setString(3,keep.getKtime());
            if (pst.executeUpdate() > 0)
                status = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("添加收藏失败！");
        } finally {
            DBUtil.close(con, pst, set);
        }
        return status;
    }

    // 删除收藏
    public static boolean deleteKeep(int Kuid, int Ksid) {
        boolean status = false;
        Connection con = null;
        ResultSet set = null;
        String sql = "delete from Keep where Kuid=? and Ksid=?";
        PreparedStatement pst = DBUtil.getPst(sql);
        try {
            con = pst.getConnection();
            pst.setInt(1, Kuid);
            pst.setInt(2, Ksid);
            if (pst.executeUpdate() > 0) {
                status = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("删除收藏失败！");
        } finally {
            DBUtil.close(con, pst, set);
        }
        return status;
    }

    // 查看是否收藏
    public static boolean isKeep(int Kuid, int Ksid) {
        boolean status = false;
        String sql = "select * from Keep where Kuid=? and Ksid=?";
        Connection con = null;
        ResultSet set = null;
        PreparedStatement pst = DBUtil.getPst(sql);
        try {
            con = pst.getConnection();
            pst.setInt(1, Kuid);
            pst.setInt(2, Ksid);
            set = pst.executeQuery();
            if (set.next()){  // 如果查询的到
            status = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("查看是否收藏错误！");
        }finally {
            DBUtil.close(con,pst,set);
        }
        return status;
        }

    }
