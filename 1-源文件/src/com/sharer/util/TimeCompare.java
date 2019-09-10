package com.sharer.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class TimeCompare {
    public static int timeCompare(String time1,String time2){
        String format = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
        int flag=0;
        try {
            long d1 = simpleDateFormat.parse(time1).getTime();
            long d2 = simpleDateFormat.parse(time2).getTime();
            flag = Long.compare(d1,d2);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return flag;
    }
}
