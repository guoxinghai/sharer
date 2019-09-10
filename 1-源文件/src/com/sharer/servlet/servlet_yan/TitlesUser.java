/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sharer.servlet.servlet_yan;

import com.sharer.dao.dao_yan.AdminDao;
import com.sharer.dao.dao_yan.UsersDao;
import com.sharer.entity.entity_yang.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 浪里追大白
 */
@WebServlet("/tu")
public class TitlesUser extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String id=req.getParameter("Oldid");
        int Uid=Integer.parseInt(id);
        AdminDao ado=new AdminDao();
        UsersDao  udo=new UsersDao();
         ado.titlesUser(Uid);
         int status=udo.SelectUserstatusByid(Uid);
         //查找该用户的session并删除session的user属性
        List<HttpSession> list = (List<HttpSession>)req.getServletContext().getAttribute("userSession");
        if(list!=null){
            for (int i=0;i<list.size();i++){
                HttpSession session = list.get(i);
                if(session!=null&&((User)(session.getAttribute("user"))).getUid()==Uid){
                    session.invalidate();
                    list.remove(session);
                    break;
                }
        }
        }

         resp.getWriter().println(status);
        
              
    }
      
}
