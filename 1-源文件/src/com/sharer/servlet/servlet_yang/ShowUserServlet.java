package com.sharer.servlet.servlet_yang;

import com.alibaba.fastjson.JSON;
import com.sharer.entity.entity_yang.User;
import com.sharer.service.service_yang.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/sus")
public class ShowUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int  Suid = Integer.parseInt(request.getParameter("Suid"));
        User user = UserService.searchUserById(Suid); // 查询发此动态的用户信息
        response.setContentType("text/html;charset=utf-8");
        String userInfo = JSON.toJSONString(user);
//        System.out.println(userInfo);
        response.getWriter().println(userInfo);

    }


}
