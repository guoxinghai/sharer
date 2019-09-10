/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sharer.dao.dao_yan;

import com.sharer.util.DatabaseUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 浪里追大白
 */
public class AdminImgsDao {

//查询所有图片的名称
    public List<String> SelectAdminImgs() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<String> list = new ArrayList();
        try {
            con = DatabaseUtil.getConnection();
            ps = con.prepareStatement("select  img from Adminimgs ");
            rs = ps.executeQuery();
            while (rs.next()) { //next()判断有没有下一行，并移动到下一行

                String img = rs.getString(1);
                list.add(img);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
        return list;
    }
}
