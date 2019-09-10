package com.sharer.servlet.servlet_yang;

import com.sharer.entity.entity_yang.User;
import com.sharer.service.service_yang.KeepService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/iks")
public class IsKeepServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int Ksid = Integer.parseInt(request.getParameter("Ksid"));
        User user = (User)request.getSession().getAttribute("user");
        int Kuid = user.getUid();
        boolean status = KeepService.isKeep(Kuid,Ksid);
        try {
            response.getWriter().write(""+status);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
