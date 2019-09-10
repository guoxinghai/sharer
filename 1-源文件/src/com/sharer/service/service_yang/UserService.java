package com.sharer.service.service_yang;

import com.sharer.dao.dao_yang.UsersDao;
import com.sharer.entity.entity_yang.User;

public class UserService {

    public static boolean isNameConflict(String name){
        User user = searchUserByName(name);
        if(user != null){
            return true;
        }
        return false;
    }
    public static User searchUserById(int id){
        return UsersDao.searchUserById(id);
    }

    public static User searchUserByName(String name){
        return UsersDao.searchUserByName(name);
    }

    public static boolean userUpdate(User newUser){
        //查看用户名是否冲突
        if(isNameConflict(newUser.getUname())){
            return false;
        }
        //修改用户信息
        return UsersDao.userUpdate(newUser);
    }

    public static boolean userInsert(User user){
        //查看用户名是否冲突
        if(isNameConflict(user.getUname())){
            return false;
        }
        //插入用户
        return UsersDao.userInsert(user);
    }

    public static int getUsersNumber(){
        return UsersDao.getUsersNumber();
    }
}
