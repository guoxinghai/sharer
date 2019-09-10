package com.sharer.service.service_haiq;

import com.sharer.dao.dao_haiq.ShareDao;
import com.sharer.entity.entity_haiq.Share;

import java.util.List;

public class ShareService {
    public static List<Share> getShares(int id, int flag, int start){
        return ShareDao.getShares(id,flag,start);
    }

    public static Share getShareById(int id){
        return ShareDao.getShareById(id);
    }
    //查询用户发表动态的数量
    public static int getShareNumber(int uid){
        return ShareDao.getShareNumber(uid);
    }

    public static boolean deleteShareById(int sid){
        return ShareDao.deleteShareById(sid);
    }
}
