package com.sharer.dao.dao_haiq;

import com.sharer.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class KeepDao {
    //通过id查找某人收藏的动态的id
    public static List<Integer> getSharesId(int id){
        String sql = "select * from keep where Kuid = ? order by Ktime desc";
        List<Integer> list = new ArrayList<>();
        PreparedStatement pst = DBUtil.getPst(sql);
        ResultSet set = null;
        Connection con = null;

        try {
            pst.setInt(1, id);
            con = pst.getConnection();
            set = pst.executeQuery();
            while(set.next()){
                int sid = set.getInt(3);
                list.add(sid);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(con,pst,set);
        }
        return list;
    }
    //判断用户是否收藏的某个动态
    public static boolean isKeep(int uid,int sid){
        String sql = "select * from keep where Kuid = ? and Ksid = ?";
        return Dao.isInclude(sql,uid,sid);
    }
    //通过sql语句增加或删除收藏数据
    public static boolean operateBySql(String sql,int uid, int sid){
        return Dao.operateBySql(sql,uid,sid);
    }
}
