package com.sharer.servlet.servlet_yang;

import com.sharer.service.service_yang.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//import User;


@WebServlet("/rcs")
public class RegisterConflictServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String jsonResult = "";
//        String Uphone = req.getParameter("Uphone");
//        String Uemail = req.getParameter("Uemail");
//        String Uname = req.getParameter("Uname");
//        String Upwd = req.getParameter("Upwd");
//        User user = new User(Uphone, Uemail, Uname, Upwd);
//        boolean status = UserService.userInsert(user);
//        resp.setContentType("text/html;charset=utf-8");
//        try {
//            if (status == false) { // 冲突则返回false
//                jsonResult = "{\"valid\":false}";
//
//            } else {
//              //插入成功返回true
//                jsonResult = "{\"valid\":true}";
//            }
//        } catch (Exception e){
//            e.printStackTrace();
//        }
//        resp.getWriter().write(jsonResult);
        resp.setContentType("text/html;charset=utf-8");
        String jsonResult = "";
        String Uname = req.getParameter("Uname");

        boolean status = UserService.isNameConflict(Uname);
        if (status) {
            //如果名称存在
            jsonResult = "{\"valid\":false}";
        }else{
            //如果该名称不存在
            jsonResult = "{\"valid\":true}";
        }

        resp.getWriter().write(jsonResult);
    }


}
