package com.sharer.util;

import com.alibaba.fastjson.JSON;

import java.io.PrintWriter;

public class JsonUtil {
    public static void toJsonAndWrite(Object list, PrintWriter writer){
        String json = JSON.toJSON(list).toString();
        writer.write(json);
    }

}
