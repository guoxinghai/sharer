package com.sharer.dao.dao_haiq;

import com.sharer.entity.entity_haiq.Share;
import com.sharer.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShareDao {
    private static int item=6;//指定一次获取的文章数目
    //通过ResultSet设置share对象的内容flag：0代表作者获取，1代表他人获取
    private static Share setShare(ResultSet set, int flag){
        Share share = null;
        try {
            if(set.getInt(6)==1 && flag==1){
                return null;
            }
            int sid = set.getInt(1);
            int suid = set.getInt(2);
            String stext = set.getString(3);
            String simg = set.getString(4);
            String stime = set.getString(5);
            int visible = set.getInt(6);
            share = new Share(sid,suid,stext,simg,stime,visible);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return share;
    }
    //获取item个文章,其中start为从第start动态开始获取
    //分为作者本身获取，或他人获取,flag:0表示作者获取，1代表他人获取
    public static List<Share> getShares(int id,int flag,int start){
        String sql = "select * from Share where Suid = ? order by Stime desc limit ?,?";
        PreparedStatement pst = DBUtil.getPst(sql);
        Connection con = null;
        ResultSet set = null;
        List<Share> list = new ArrayList<>();
        try {
            pst.setInt(1,id);
            pst.setInt(2,start);
            pst.setInt(3,item);
            con = pst.getConnection();
            set = pst.executeQuery();
            while(set.next()){
                Share share = setShare(set,flag);
                if(share != null){
                    list.add(share);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭资源
            DBUtil.close(con,pst,set);
        }
        return list;
    }
    //通过sql语句获取动态(不检测visible)
    public static List<Share> getSharesBySql(String sql){
        List<Share>list = new ArrayList<>();
        PreparedStatement pst = DBUtil.getPst(sql);
        ResultSet set = null;
        Connection con = null;
        try {
            con = pst.getConnection();
            set = pst.executeQuery();
            while(set.next()){
                Share share = setShare(set,0);
                if(share != null){
                    list.add(share);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(con,pst,set);
        }
        return list;
    }
    //通过id获取动态
    public static Share getShareById(int id){
        Share share = null;
        String sql = "select * from Share where Sid = ?";
        PreparedStatement pst = DBUtil.getPst(sql);
        ResultSet set = null;
        Connection con = null;
        try {
            pst.setInt(1,id);
            con = pst.getConnection();
            set = pst.executeQuery();
            while(set.next()){
                share = setShare(set,0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(con,pst,set);
        }
        return share;
    }
    //查询某用户动态的数量
    public static int getShareNumber(int uid){
        String sql = "select count(*) from share where Suid = "+uid;
        return Dao.getNmberBySql(sql);
    }
    //查询动态的总数量
    public static int getShareNumber(){
        String sql = "select count(*) from share";
        return Dao.getNmberBySql(sql);
    }
    //查询动态id最大值
    public static int getShareMaxNumber(){
        String sql = "select sid from share order by sid desc limit 1";
        return Dao.getNmberBySql(sql);
    }
    //通过动态id删除动态
    public static boolean deleteShareById(int sid){
        String sql = "delete from share where Sid = ?";
        PreparedStatement pst = DBUtil.getPst(sql);
        boolean flag = false;
        Connection con = null;
        try {
            pst.setInt(1,sid);
            con = pst.getConnection();
            if(pst.executeUpdate()>0){
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
