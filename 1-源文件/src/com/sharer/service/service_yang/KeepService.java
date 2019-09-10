package com.sharer.service.service_yang;

import com.sharer.dao.dao_yang.KeepDao;
import com.sharer.entity.entity_yang.Keep;

public class KeepService {

    public static boolean insertKeep (Keep keep){
        return KeepDao.insertKeep(keep);
    }

    public static  boolean deleteKeep(int Kuid,int Ksid){
        return KeepDao.deleteKeep(Kuid,Ksid);
    }

    public static boolean isKeep(int Kuid,int Ksid){ return  KeepDao.isKeep(Kuid, Ksid); }
}
