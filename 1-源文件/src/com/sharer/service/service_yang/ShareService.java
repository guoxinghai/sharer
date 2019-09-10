package com.sharer.service.service_yang;

import com.sharer.dao.dao_yang.FanDao;
import com.sharer.dao.dao_yang.ShareDao;
import com.sharer.entity.entity_yang.Share;

import javax.servlet.http.Part;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

// 获取当前用户所关注人的动态
public class ShareService {

public static List<Share> getShareByUid(int Uid,int start){
   List<Integer> list =  FanDao.getFuid(Uid); // 根据当前登录用户的Uid去获取当前用户idol们的Fuid
    return ShareDao.searchShareBySuid(list,start);
}

// 复制到图片到虚拟路径
    public static String getFileNameFromPart(Part part) {

        String header = part.getHeader("Content-Disposition");
        System.out.println(header);
        String fileName = header.substring(header.indexOf("filename=\"")+10, header.lastIndexOf("\""));
        return fileName;

    }

    // 获取当前发动态的时间
    public  static  String getCurrentTime(){
        Date date = new Date();
        String str = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat sdf = new SimpleDateFormat(str);
        String currentTime = sdf.format(date);
       return currentTime;
    }

    public  static boolean insertShare(Share share){
     return  ShareDao.insertShare(share);
    }

}

