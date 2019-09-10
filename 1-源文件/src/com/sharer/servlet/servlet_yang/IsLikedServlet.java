package com.sharer.servlet.servlet_yang;

import com.sharer.service.service_yang.LikesService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/IsLikedServlet")
public class IsLikedServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    int Luid = Integer.parseInt(request.getParameter("Luid"));
    int Lsid = Integer.parseInt(request.getParameter("Lsid"));
    boolean status = LikesService.isLiked(Luid,Lsid);
    response.getWriter().write(status+"");

    }

}
