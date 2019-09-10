package com.sharer.service.service_haiq;

import com.sharer.dao.dao_haiq.FanDao;
import com.sharer.dao.dao_haiq.UsersDao;
import com.sharer.entity.entity_haiq.User;

import java.util.ArrayList;
import java.util.List;

public class FanService {
    public static List<User> getFan(int id){
        String sql = "select * from fan where Fuid = ?";
        List<Integer>list = FanDao.getUserList(sql,id,3);
        return getUserByList(list);
    }
    public static List<User> getLike(int id){
        String sql = "select * from fan where Ffid = ?";
        List<Integer>list = FanDao.getUserList(sql,id,2);
        return getUserByList(list);
    }
    private static List<User> getUserByList(List list){
        String sql = "select * from Users where Uid in (";
        StringBuilder s = new StringBuilder(sql);
        if(list.size() == 0){
            return new ArrayList<>();
        }
        for (int i = 0;i<list.size()-1;i++){
            s.append(list.get(i)+",");
        }
        s.append(list.get(list.size()-1)+")");
        return UsersDao.getUsersBySql(s.toString());
    }
    //判断fid是不是sid的粉丝
    public static boolean isFan(int fid,int sid){
        return FanDao.isFan(fid,sid);
    }
    //增加关注信息
    public static int follow(int id,String name){
        //获取name的id
        User user = UserService.searchUserByName(name);
        if(user == null){
            return 0;
        }
        String sql = "insert into Fan values(null,"+user.getUid()+","+id+")";
        return FanDao.executeSql(sql);
    }
    //增加删除关注信息
    public static int unFollow(int id,String name){
        //获取name的id
        User user = UserService.searchUserByName(name);
        if(user == null){
            return 0;
        }
        String sql = "delete from Fan where Fuid="+user.getUid()+" and Ffid="+id;
        return FanDao.executeSql(sql);
    }
    //获得粉丝数量
    public static int getFanNumber(int id){
        String sql = "select count(*) from fan where Fuid = "+id;
        return FanDao.getNumber(sql);
    }
    //获得关注的数量
    public static int getLikeNumber(int id){
        String sql = "select count(*) from fan where Ffid = "+id;
        return FanDao.getNumber(sql);
    }
}
