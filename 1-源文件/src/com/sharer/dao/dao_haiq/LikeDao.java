package com.sharer.dao.dao_haiq;

public class LikeDao {
    //获取某个动态的获赞数
    public static int getLikeNumber(int sid){
        String sql = "select count(*) from likes where Lsid = "+sid;
        int num = Dao.getNmberBySql(sql);
        return num;
    }
    //通过sql语句增加或删除点赞数据
    public static boolean operateBySql(String sql,int uid, int sid){
        return Dao.operateBySql(sql,uid,sid);
    }
    //判断用户是否点赞
    public static boolean isLikeShare(int uid,int sid){
        String sql = "select * from likes where Luid = ? and Lsid = ?";
        return Dao.isInclude(sql,uid,sid);
    }
}
