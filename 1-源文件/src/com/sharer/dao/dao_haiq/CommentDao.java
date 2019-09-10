package com.sharer.dao.dao_haiq;

import com.sharer.entity.entity_haiq.Comment;
import com.sharer.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDao {
    //通过resultSet获取并返回一个comment
    private static Comment getCommentBySet(ResultSet set){
        Comment com= null;
        try {
            int cid = set.getInt(1);
            int cuid = set.getInt(2);

            int csid = set.getInt(3);
            String time = set.getString(4);
            String text = set.getString(5);
            com = new Comment(cid,cuid,csid,time,text);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return com;

    }
    //获取某个文章的所有评论(按点赞数排序）
    public static List<Comment> getComments(int sid){
        List<Comment>list = new ArrayList<>();
        String sql = "select * from Comment where Csid = ? order by Ctime desc";
        PreparedStatement pst = DBUtil.getPst(sql);
        ResultSet set = null;
        Connection con = null;

        try {
            pst.setInt(1,sid);
            con = pst.getConnection();
            set = pst.executeQuery();
            while(set.next()){
                list.add(getCommentBySet(set));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(con,pst,set);
        }
        return list;
    }
    //插入一条评论数据
    public static int insert(Comment com){
        String sql = "insert into comment values(null,? ,? , ?, ?)";
        int num = 0;
        PreparedStatement pst = DBUtil.getPst(sql);
        Connection con = null;
        try {
            con = pst.getConnection();
            pst.setInt(1,com.getCuid());
            pst.setInt(2,com.getCsid());
            pst.setString(3,com.getCtime());
            pst.setString(4,com.getCtext());
            num = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(con,pst,null);
        }
        return num;
    }
    //后去某个动态的评论数
    public static int getCommentNumber(int sid){
        String sql = "select count(*) from comment where Csid = '"+sid+"'";
        return Dao.getNmberBySql(sql);
    }
}
