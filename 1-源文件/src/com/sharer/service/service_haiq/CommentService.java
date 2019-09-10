package com.sharer.service.service_haiq;

import com.sharer.dao.dao_haiq.CommentDao;
import com.sharer.entity.entity_haiq.Comment;
import com.sharer.util.TimeUtil;

import java.util.List;

public class CommentService {
    //获取某个动态得评论
    public static List getComments(int sid){
        return CommentDao.getComments(sid);
    }
    //增加一条评论
    public static int insertComment(int cuid,int csid,String text){
        String time = TimeUtil.getCurrentTime();
        return CommentDao.insert(new Comment(cuid,csid,time,text));
    }
    //获取某个动态的评论数
    public static int getCommentNumber(int sid){
        return CommentDao.getCommentNumber(sid);
    }
}

