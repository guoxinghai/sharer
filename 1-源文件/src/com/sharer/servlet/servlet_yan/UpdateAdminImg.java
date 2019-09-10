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
@WebServlet("/uai")
public class UpdateAdminImg  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         AdminDao  ado=new AdminDao();
         String id=req.getParameter("Oldid");
         String img=req.getParameter("GetIImgname");
         int aid=Integer.parseInt(id);
 
         ado.UpdateAdminImg(img , aid);
    }
    
}
