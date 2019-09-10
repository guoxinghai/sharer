package com.sharer.dao.dao_yang;

import com.sharer.entity.entity_yang.Share;
import com.sharer.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShareDao {

    // 用分页查询获取idol和当前用户可见的动态,已经拿到idol和当前用户的id（用户就是粉丝Ffid
    public static List<Share> searchShareBySuid(List<Integer> list, int start) {
        List<Share> shareList = new ArrayList<>();
        String s = String.valueOf(list);
        String s1 = s.replace('[', '(').replace(']', ')');
        String sql = "select * from share where Suid in" + s1 + "AND Svisible=0 ORDER BY Stime DESC LIMIT ?,5 ";
        PreparedStatement pst = DBUtil.getPst(sql);
        ResultSet set = null;
        Connection con = null;
        try {
            con = pst.getConnection();
            pst.setInt(1, (start - 1) * 5);
            set = pst.executeQuery();
            while (set.next()) {
                int Sid = set.getInt(1);
                int Suid = set.getInt(2);
                String Stext = set.getString(3);
                String Simg = set.getString(4);
                String Stime = set.getString(5);
                int Svisable = set.getInt(6);
                Share share = new Share(Sid, Suid, Stext, Simg, Stime, Svisable);
                shareList.add(share);

            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("searchShareBySuid 出错!");
        } finally {
            DBUtil.close(con, pst, set);
        }


        return shareList;
    }

    public static boolean insertShare(Share share) {
        String sql = "insert into share values(null,?,?,?,?,?) ";
        boolean status = false;
        ResultSet set = null;
        Connection con = null;
        PreparedStatement pst = DBUtil.getPst(sql);
        try {
            con = pst.getConnection();
            pst.setInt(1, share.getSuid());
            pst.setString(2, share.getStext());
            pst.setString(3, share.getSimg());
            pst.setString(4, share.getStime());
            pst.setInt(5, share.getSvisible());
            if(pst.executeUpdate() > 0){
                status = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("插入动态失败！");
        }finally {
            DBUtil.close(con,pst,set);
        }
        return status;
    }
// 通过pst来获取shareList
//    public static List<Share> getSharebyPst(PreparedStatement pst){
//        List<Share> shareList = new ArrayList<>();
//        Connection con = null;
//        ResultSet set = null;
//
//        try {
//            set = pst.executeQuery();
//            con = pst.getConnection();
//            while (set.next()){
//
//              int Sid = set.getInt(1);
//              int Suid = set.getInt(2);
//              String Stext = set.getString(3);
//              String Simg = set.getString(4);
//              String Stime = set.getString(5);
//              int Svisable = set.getInt(6);
//              Share share = new Share(Sid,Suid,Stext,Simg,Stime,Svisable);
//              shareList.add(share);
//            }
//        } catch (SQLException e){
//            e.printStackTrace();
//            System.out.println(" getSharebySql 错误！");
//        }finally {
//            DBUtil.close(con,pst,set);
//        }
//        return shareList;
//    }
}
