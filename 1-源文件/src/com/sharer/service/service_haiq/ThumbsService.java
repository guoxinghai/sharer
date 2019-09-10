package com.sharer.service.service_haiq;

import com.sharer.dao.dao_haiq.ThumbsDao;

public class ThumbsService {
    //判断用户是否给某个评论点了赞
    public static boolean isThumbs(int uid,int cid){
        return ThumbsDao.isThumbs(uid,cid);
    }
    //点赞
    public static int thumbs(int uid,int cid){
        String sql = "insert into thumbs values(null, ?, ?)";
        return ThumbsDao.operate(sql,uid,cid);
    }
    //取消赞
    public static int concel(int uid,int cid){
        String sql = "delete from thumbs where Tuid = ? and Tcid = ?";
        return ThumbsDao.operate(sql,uid,cid);
    }
    //获取某条评论得点赞数
    public static int getThumbsNumber(int cid){
        return ThumbsDao.getThumbsNumber(cid);
    }
}
