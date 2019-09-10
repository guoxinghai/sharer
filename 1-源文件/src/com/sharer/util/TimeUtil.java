package com.sharer.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
    //获取当前时间
    public static String getCurrentTime(){
        String format = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        return dateFormat.format(new Date());
    }
}
