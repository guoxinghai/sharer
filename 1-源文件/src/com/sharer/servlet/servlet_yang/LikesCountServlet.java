package com.sharer.servlet.servlet_yang;

import com.sharer.service.service_yang.LikesService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LikesCountServlet")
public class LikesCountServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
     int Lsid = Integer.parseInt(request.getParameter("Lsid"));
     int likesCount = LikesService.getLikesCount(Lsid);
//     System.out.println("likecount"+likesCount);
     response.getWriter().write(likesCount+"");
    }


}
