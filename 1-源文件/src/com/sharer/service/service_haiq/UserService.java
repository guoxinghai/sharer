package com.sharer.service.service_haiq;

import com.sharer.dao.dao_haiq.UsersDao;
import com.sharer.entity.entity_haiq.User;

import java.util.List;


public class UserService {

    private static boolean isNameConflict(String name) {
        User user = searchUserByName(name);
        if (user != null) {
            return true;
        }
        return false;
    }

    public static User searchUserById(int id) {
        return UsersDao.searchUserById(id);
    }

    public static User searchUserByName(String name) {
        return UsersDao.searchUserByName(name);
    }







    public static boolean userInsert(User user) {
        //查看用户名是否冲突
        if (isNameConflict(user.getUname())) {
            return false;
        }
        //插入用户
        return UsersDao.userInsert(user);
    }

    public static int getUsersNumber() {
        return UsersDao.getUsersNumber();
    }

    //更新用户头像
    public static int updateUserImage(int uid, String img) {
        return UsersDao.updateUserImage(uid, img);
    }

    //通过用户名称模糊搜索
    public static List<Integer> blurrySearchByName(String name){
        return UsersDao.blurrySearchByName(name);
    }


}
