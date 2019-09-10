/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sharer.servlet.servlet_yan;

import com.sharer.dao.dao_yan.AdminDao;
import com.sharer.dao.dao_yan.UsersDao;

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
@WebServlet("/uu")
public class UnblockUser extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String id=req.getParameter("Oldid");
        int Uid=Integer.parseInt(id);
        AdminDao ado=new AdminDao();
        UsersDao udo=new UsersDao();
         ado.unblockUser(Uid);
         int status=udo.SelectUserstatusByid(Uid);
         resp.getWriter().println(status);
      
    }
      
}
