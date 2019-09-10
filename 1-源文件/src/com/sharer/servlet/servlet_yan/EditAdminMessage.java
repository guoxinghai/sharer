/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sharer.servlet.servlet_yan;

import com.sharer.dao.dao_yan.AdminDao;
import com.sharer.entity.entity_yan.Admin;
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
@WebServlet("/eam")
public class EditAdminMessage extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//         AdminDao  ado=new AdminDao();
//         Admin Admin=ado.SelectAdmin().get(0);
//            String  Adminname=req.getParameter("Adminname2");
//            String Adminid=req.getParameter("Adminid2");
//            req.setAttribute("Admin", Admin);
//            req.getRequestDispatcher("AdminMain.jsp").forward(req, resp);
        req.setCharacterEncoding("UTF-8");
        AdminDao ado = new AdminDao();
        Admin admin = new Admin();
        String oldname = req.getParameter("Oldname");
        String newname = req.getParameter("Adminname2");
        String id = req.getParameter("Adminid3");
        int aid = Integer.parseInt(id);
        String phone = req.getParameter("AdminTelname");
        String email = req.getParameter("AdminEmname");
        String birth = req.getParameter("AdminBirname");
        admin.setAname(newname);

        
        admin.setAid(aid);
        admin.setAphone(phone);
        admin.setAemail(email);
        admin.setAbirth(birth);
        ado.updateMessage(admin, oldname); 

//                  req.setAttribute("Admin", admin);
        req.setAttribute("Admin", admin);
        req.getRequestDispatcher("/AdminMain.jsp").forward(req, resp);

    }
}
