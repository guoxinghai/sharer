package com.sharer.dao.dao_haiq;
import com.sharer.entity.entity_haiq.User;
import com.sharer.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsersDao {
    //设置pst中的sql基本内容
    private static void setPst(PreparedStatement pst,User user){
        try {
            pst.setString(1,user.getUname());
            pst.setString(2,user.getUgender());
            pst.setString(3,user.getUemail());
            pst.setString(4,user.getUphone());
            pst.setString(5,user.getUbirth());
            pst.setString(6,user.getUimg());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //通过特定PreparedStatement查询用户信息
    private static User searchUserByPst(PreparedStatement pst){
        User user = null;
        ResultSet set = null;
        Connection con = null;
        //执行Sql语句
        try {
            set = pst.executeQuery();
            con = pst.getConnection();
            if(set.next()){
                user = new User();
                user.setUid(set.getInt(1));
                user.setUname(set.getString(2));
                user.setUgender(set.getString(3));
                user.setUemail(set.getString(4));
                user.setUphone(set.getString(5));
                user.setUbirth(set.getString(6));
                user.setUimg(set.getString(7));
                user.setUpwd(set.getString(8));
                user.setUstatus(set.getInt(9));
                user.setUwords(set.getString(10));
            }
        } catch (SQLException e) {
            System.out.println("【searchUserByPst()】ResultSet 出错");
            e.printStackTrace();
        }finally{
            //关闭资源
            DBUtil.close(con,pst,set);
        }
        return user;

    }
    //通过用户ID查询用户信息
    public static User searchUserById(int id){
        String sql = "select * from Users where Uid = ?";
        PreparedStatement pst;
        //获取preparedStatement
        pst = DBUtil.getPst(sql);
        try {
            pst.setInt(1,id);
        } catch (SQLException e) {
            System.out.println("【searchUserById()】出错");
            e.printStackTrace();
        }
        //通过searchUserByPst查找用户
        return searchUserByPst(pst);
    }

    //通过用户Uname查询用户信息
    public static User searchUserByName(String name){
        String sql = "select * from Users where Uname = ?";
        PreparedStatement pst;
        //获取preparedStatement
        pst = DBUtil.getPst(sql);
        try {
            pst.setString(1,name);
        } catch (SQLException e) {
            System.out.println("【searchUserByName()】出错");
            e.printStackTrace();
        }
        //通过searchUserByPst查找用户
        return searchUserByPst(pst);
    }
    //通过sql语句查询用户
    public static List<User> getUsersBySql(String sql){
        PreparedStatement pst = DBUtil.getPst(sql);
        List<User> list = new ArrayList<>();
        ResultSet set = null;
        Connection con = null;
        try {
            set = pst.executeQuery();
            con = pst.getConnection();
            while(set.next()){
                int id = set.getInt(1);
                String name = set.getString(2);
                String gender = set.getString(3);
                String email = set.getString(4);
                String phone = set.getString(5);
                String birth = set.getString(6);
                String img = set.getString(7);
                int status = set.getInt(9);
                String words = set.getString(10);
                User user = new User(id,name,gender,email,phone,birth,img,null,status,words);
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(con,pst,set);
        }
        return list;
    }
    //用于用户更改基本信息 Uname,Ugender,Uemail,Uphone,Ubirth,Uimg
    //前提是数据库中拥有本用户，并且用户修改的名字未与其他用户冲突
    public static boolean userUpdate(User newUser){
        boolean flag = false;
        int item = 0;
        String sql = "update Users set Uname=?, Ugender=?,Uemail=?,Uphone=?,Ubirth=?,Uimg=?,Uwords=? where Uid = ?";
        PreparedStatement pst = DBUtil.getPst(sql);
        Connection con = null;
        try {
            con = pst.getConnection();
            setPst(pst,newUser);
            pst.setString(7,newUser.getUwords());
            pst.setInt(8,newUser.getUid());
            item = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭资源
            DBUtil.close(con,pst,null);
        }
        if(item > 0){
            flag = true;
        }
        return flag;
    }
    //修改密码
    public static boolean modifyPassword(int uid, String pwd){
        String sql = "update users set Upwd = ? where Uid = ?";
        boolean flag = false;
        PreparedStatement pst = DBUtil.getPst(sql);
        Connection con = null;
        try {
            con = pst.getConnection();
            pst.setInt(2, uid);
            pst.setString(1,pwd);
            int num = pst.executeUpdate();
            if(num > 0){
                flag = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("密码没修改成功！");
        }finally{
            DBUtil.close(con, pst,null);
        }
        return flag;
    }
    //插入用户
    //前提用户名未冲突
    public static boolean userInsert(User user){
        String sql = "insert into Users values(null,?,?,?,?,?,?,?,?)";
        boolean flag = false;
        PreparedStatement pst = DBUtil.getPst(sql);
        try {
            setPst(pst,user);
            pst.setString(7,user.getUpwd());
            pst.setInt(8,user.getUstatus());
            pst.setString(8,user.getUwords());
            if(pst.executeUpdate() > 0){
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
    //查询用户表中的用户数
    public static int getUsersNumber(){
        String sql = "select count(*) from users";
        return Dao.getNmberBySql(sql);
    }
    //更新用户头像
    public static int updateUserImage(int uid,String img){
        String sql = "update users set Uimg = ? where Uid = ?";
        int col = 0;
        PreparedStatement pst = DBUtil.getPst(sql);
        Connection con = null;
        try {
            pst.setString(1,img);
            pst.setInt(2,uid);
            con = pst.getConnection();
            col = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(con,pst,null);
        }
        return col;
    }
    //通过用户名称模糊搜索
    public static List<Integer> blurrySearchByName(String name){
        String sql = "select * from users where Uname like ? limit 4";
        List<Integer> list = new ArrayList<>();
        PreparedStatement pst = DBUtil.getPst(sql);
        ResultSet set = null;
        Connection con = null;
        try {
            pst.setString(1,"%"+name+"%");
            con = pst.getConnection();
            set = pst.executeQuery();
            while(set.next()){
                list.add(set.getInt("Uid"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(con,pst,set);
        }
        return list;
    }

}
