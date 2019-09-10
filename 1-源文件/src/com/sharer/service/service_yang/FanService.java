package com.sharer.service.service_yang;

import com.sharer.dao.dao_yang.FanDao;
import com.sharer.dao.dao_yang.UsersDao;
import com.sharer.entity.entity_yang.User;

import java.util.ArrayList;
import java.util.List;

public class FanService {
    public static List<User> getFan(int id){
        String sql = "select * from Users where Uid in (";
        StringBuilder s = new StringBuilder(sql);
        List<Integer>list = FanDao.getFan(id);
        if(list.size() == 0){
            return new ArrayList<>();
        }
        for (int i = 0;i<list.size()-1;i++){
            s.append(list.get(i)+",");
        }
        s.append(list.get(list.size()-1)+")");
        return UsersDao.getUsersBySql(s.toString()); // 通过用户粉丝的id去到users表中查询用户
    }
    //判断fid是不是sid的粉丝
    public static boolean isFan(int fid,int sid){
        return FanDao.isFan(fid,sid);
    }
}
