package com.sharer.service.service_yang;

import com.sharer.dao.dao_yang.AdminDao;
import com.sharer.entity.entity_yan.Admin;

public class AdminService {
    public static Admin searchAdminByName(String Admin){
       return AdminDao.searchAdminByName(Admin);
    }
}
