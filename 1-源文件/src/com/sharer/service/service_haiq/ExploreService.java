package com.sharer.service.service_haiq;

import com.sharer.dao.dao_haiq.ShareDao;
import com.sharer.dao.dao_haiq.UsersDao;
import com.sharer.entity.entity_haiq.Share;
import com.sharer.entity.entity_haiq.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ExploreService {
    private static int item = 4;
    public static User searchUserById(int id) {
        return UsersDao.searchUserById(id);
    }
    public static List<User> getRandomUsers() {
        int num = getUsersNumber();
        int unums = num < item ? num : item;
        Random ran = new Random();
        ArrayList<Integer> UsersIdBox = new ArrayList<>();
        List<User> UsersList = new ArrayList();
        for (int i = 0; i < unums; i++) {
            int n = ran.nextInt(num+1);
            if (n == 0 || UsersIdBox.contains(n)) {
                i--;
            } else {
                User user = searchUserById(n);
                if(user==null){
                    i--;
                }else{
                    UsersList.add(user);
                    UsersIdBox.add(n);
                }

            }
        }
        return UsersList;
    }
    //获取六个随机动态
    public static List<Share> getRandomShare(){
        int num = ShareDao.getShareNumber();
        int max = ShareDao.getShareMaxNumber();
        int snums = num < 6 ? num : 6;
        Random ran = new Random();
        ArrayList<Integer> SharesIdBox = new ArrayList<>();
        List<Share> SharesList = new ArrayList();
        System.out.println("snum :"+snums);
        for (int i = 0; i < snums; i++) {
            int n = ran.nextInt(max+1);
            if (n == 0 || SharesIdBox.contains(n)) {
                i--;
            } else {
                Share share = ShareDao.getShareById(n);
                if(share == null){
                    i--;
                }else {
                    System.out.println(n);
                    SharesList.add(share);
                    SharesIdBox.add(n);
                }
            }
        }
        return SharesList;
    }
    public static int getUsersNumber() {
        return UsersDao.getUsersNumber();
    }
}
