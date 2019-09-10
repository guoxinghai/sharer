/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sharer.servlet.servlet_yan;

import com.sharer.dao.dao_yan.AdminDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 浪里追大白
 */
@WebServlet("/pwd")
public class UpdateAdminpwd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        AdminDao ado = new AdminDao();
        
        String id = req.getParameter("Oldid");
         int aid = Integer.parseInt(id);
        String oldpwd = req.getParameter("oldpwd");
        
        String dboldpwd=ado.SelectAdminpwdByid(aid);
//        System.out.println(oldpwd);
//        System.out.println(dboldpwd);
       
        String apwd = req.getParameter("newpwd");
        
        if (oldpwd.equals(dboldpwd) ){
            ado.UpdatepwdbyID(apwd, aid);
        } else {
            resp.getWriter().write("false");
        }

    }

}
