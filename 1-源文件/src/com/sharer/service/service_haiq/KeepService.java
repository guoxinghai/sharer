package com.sharer.service.service_haiq;

import com.sharer.dao.dao_haiq.KeepDao;
import com.sharer.dao.dao_haiq.ShareDao;
import com.sharer.entity.entity_haiq.Share;
import com.sharer.util.TimeUtil;

import java.util.ArrayList;
import java.util.List;

public class KeepService {
    private static int item=6;//item表示一次取得的动态数
    //通过id获取用户收藏的文章其中start是动态开始的位置
    public static List<Share> getCollectionShares(int id,int start){
        String sql = "select * from share where Sid in (";//查询动态的sql语句
        List<Share>shareList = new ArrayList<>();
        //获取该用户收藏的全部动态id
        List idList = KeepDao.getSharesId(id);
        int len = idList.size();
        if(idList.size()==0 || start > len){
            return shareList;
        }
        for (int i=start;i<start+item&&i<len;i++){
            if(i==start+item-1||i==len-1){
                sql = sql + idList.get(i) +" )";
                break;
            }
            sql = sql + idList.get(i) + " ,";
        }
        //通过sql获取动态
        shareList = ShareDao.getSharesBySql(sql);
        return shareList;
    }
    //判断某个用户是否收藏了动态
    public static boolean isKeep(int uid,int sid){
        return KeepDao.isKeep(uid,sid);
    }
    //增加一条动态的点赞数据
    public static boolean insert(int uid, int sid){
        String time = TimeUtil.getCurrentTime();
        String sql = "insert into keep values(null,?,?,'"+time+"')";
        return KeepDao.operateBySql(sql,uid,sid);
    }
    //删除一条动态的点赞数据
    public static boolean delete(int uid, int sid){
        String sql = "delete from keep where Kuid = ? and Ksid = ?";
        return KeepDao.operateBySql(sql,uid,sid);
    }

}
