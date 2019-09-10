package com.sharer.servlet.servlet_yang;

import com.sharer.entity.entity_yang.User;
import com.sharer.service.service_yang.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/uls")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        String Uname = request.getParameter("Uname");
        String Upwd = request.getParameter("Upwd");
        String result = " ";


        User user = UserService.searchUserByName(Uname);
//        System.out.println(user.getUpwd());
        if (null == user) { // 代表没查询到用户
            result = "false";
        } else {
            if (user.getUstatus() == 1) {
            result = "ban";
            } else {
                if (Upwd.equals(user.getUpwd())) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    request.getSession().setAttribute("isAdmin",false);
                    //将用户session加入到userSession中
                    List<HttpSession> list ;
                    Object obj = request.getServletContext().getAttribute("userSession");
                    if(obj==null){
                        list = new ArrayList<>();
                        request.getServletContext().setAttribute("userSession",list);
                    }else{
                        list = (ArrayList<HttpSession>)obj;
                    }
                    list.add(session);
                    result = "true";

                } else {
                    result = "false";
                }
            }
        }


        response.getWriter().write(result);

    }


}
