package com.sharer.servlet.servlet_yang;

import com.sharer.entity.entity_yang.User;
import com.sharer.service.service_yang.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/rs")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String Uphone = req.getParameter("Uphone");
        String Uemail = req.getParameter("Uemail");
        String Uname = req.getParameter("Uname");
        String Upwd = req.getParameter("Upwd");
        User user = new User(Uphone, Uemail, Uname, Upwd);

        boolean status = UserService.userInsert(user); // true代表用户名没有冲突

        if (status){
        req.setAttribute("registrationStatus",true);
        req.getRequestDispatcher("/index.jsp").forward(req,resp);

        }


    }


}
