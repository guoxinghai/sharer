package com.sharer.service.service_haiq;

import com.sharer.dao.dao_haiq.LikeDao;

public class LikeService {
    //或取动态所得赞数
    public static int getLikeNumber(int sid){
        return LikeDao.getLikeNumber(sid);
    }
    //增加一条动态的点赞数据
    public static boolean insert(int uid, int sid){
        String sql = "insert into likes values(null,?,?)";
        return LikeDao.operateBySql(sql,uid,sid);
    }
    //删除一条动态的点赞数据
    public static boolean delete(int uid, int sid){
        String sql = "delete from likes where Luid = ? and Lsid = ?";
        return LikeDao.operateBySql(sql,uid,sid);
    }
    //判断用户是否点赞
    public static boolean isLikeShare(int uid,int sid){
        return LikeDao.isLikeShare(uid,sid);
    }
}
