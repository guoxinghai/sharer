package com.sharer.service.service_haiq;

import com.sharer.dao.dao_haiq.UsersDao;
import com.sharer.entity.entity_haiq.User;

public class ModifyPwdService {
    public static User searchUserByName(String name) {
        return UsersDao.searchUserByName(name);
    }
    private static boolean isNameConflict(String name) {
        User user = searchUserByName(name);
        if (user != null) {
            return true;
        }
        return false;
    }
    public static boolean userUpdate(User newUser, String oldName) {
        //查看用户名是否冲突
        if (!oldName.equals(newUser.getUname()) && isNameConflict(newUser.getUname())) {
            return false;
        }
        return UsersDao.userUpdate(newUser);
    }
    // 查看输入的密码与旧密码是否一致

    public static boolean isOldpwdEqual(String userPwd, String inputPwd1) {
        if (!userPwd.equals(inputPwd1)) {
            return false;
        } else {
            return true;
        }

    }

    public static boolean modifyPassword(int uid, String newPwd) {


        return UsersDao.modifyPassword(uid, newPwd);
        //修改用户信息

    }
}
