package com.sharer.servlet.servlet_yang;

import com.sharer.service.service_yang.LikesService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
  // 点赞的servlet简写跟用户的servley冲突，所以用原名

@WebServlet("/UpdateLikesServlet")
public class UpdateLikesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int flag = Integer.parseInt(request.getParameter("flag"));
        int Luid = Integer.parseInt(request.getParameter("Luid"));
        int Lsid = Integer.parseInt(request.getParameter("Lsid"));
        if (flag == 1){ // flag为1是添加
           boolean insertStatus =  LikesService.insertLikes(Luid,Lsid);
           response.getWriter().write(insertStatus+"");
        }else {
            boolean deleteStatus = LikesService.deleteLikes(Luid,Lsid);
            response.getWriter().write(deleteStatus+"");
        }


    }


}
