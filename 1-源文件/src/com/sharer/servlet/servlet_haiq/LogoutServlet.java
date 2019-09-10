package com.sharer.servlet.servlet_haiq;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends javax.servlet.http.HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<HttpSession> list = (List<HttpSession>)request.getServletContext().getAttribute("userSession");
        list.remove(request.getSession());
        request.getSession().invalidate();
        response.sendRedirect("index.jsp");
    }
}
