package com.sharer.servlet.servlet_yang;

import com.sharer.entity.entity_yan.Admin;
import com.sharer.service.service_yang.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/als")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String aname = request.getParameter("aname");
        String apwd = request.getParameter("apwd");
        Admin admin = AdminService.searchAdminByName(aname);
        String result = "";
        if (admin == null) {
            result = "false";
        } else {
            if (admin.getApwd().equals(apwd) ) {
                result = "ture";
                request.getSession().setAttribute("Admin",admin);
                request.getSession().setAttribute("isAdmin",true);
            } else {
                result = "false";
            }
        }
        response.getWriter().write(result);
    }
    }
