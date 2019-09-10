package com.sharer.util;

import java.sql.*;

public class DBUtil {
    private static String driver = ResourceUtil.getDriver();
    private static String url = ResourceUtil.getURL();
    private static String user = ResourceUtil.getUser();
    private static String password = ResourceUtil.getPassword();
    //注册驱动
    static{
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            System.out.println("驱动注册失败");
            e.printStackTrace();
        }
    }
    //获取数据库连接
    public static Connection getConnetion(){
        Connection con = null;
        try {
            con = DriverManager.getConnection(url,user,password);
        } catch (SQLException e) {
            System.out.println("获取数据库连接出错！");
            e.printStackTrace();
        }
        return con;
    }
    //获取PreparedStatement
    public static PreparedStatement getPst(String sql){
        Connection con = getConnetion();
        PreparedStatement pst = null;
        //判断数据库连接为空
        if(con == null){
            System.out.println("数据库连接为NULL");
            return null;
        }
        //获取prepareStatement
        try {
            pst = con.prepareStatement(sql);
        } catch (SQLException e) {
            System.out.println("【getPst()】PreparedStatement 出错");
            e.printStackTrace();
        }
        return pst;
    }
    //释放资源
    public static void close(Connection con, PreparedStatement pst, ResultSet set){
        try {
            if(set != null) {
                set.close();
            }
            if(pst != null){
                pst.close();
            }
            if(con != null){
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("释放资源出错");
            e.printStackTrace();
        }
    }
}
