package com.sharer.util;

import java.util.ResourceBundle;

public class ResourceUtil {
    private static ResourceBundle re = ResourceBundle.getBundle("db");
    //获得数据库的用户名
    public static String getUser(){
        return re.getString("user");
    }
    //获得数据库的用户名密码
    public static String getPassword(){
        return re.getString("password");
    }
    //获得数据库driver
    public static String getDriver(){
        return re.getString("driver");
    }
    //获得URL
    public static String getURL(){
        return re.getString("url");
    }


}
