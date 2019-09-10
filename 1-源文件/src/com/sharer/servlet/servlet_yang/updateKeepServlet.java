package com.sharer.servlet.servlet_yang;

import com.sharer.entity.entity_yang.Keep;
import com.sharer.service.service_yang.KeepService;
import com.sharer.util.TimeUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/uks")
public class updateKeepServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset = utf-8");
//        User user = (User) request.getSession().getAttribute("user");
        int flag = Integer.parseInt(request.getParameter("flag"));
        int Ksid = Integer.parseInt(request.getParameter("Ksid"));
        int Kuid = Integer.parseInt(request.getParameter("Kuid"));  // 从页面获取会话然后传过来
        String Ktime = TimeUtil.getCurrentTime();
        if (flag == 1) {
            Keep keep = new Keep(Kuid, Ksid,Ktime);
            boolean insertStatus = KeepService.insertKeep(keep);
            response.getWriter().write(""+insertStatus);
        } else {
            boolean deleteStatus = KeepService.deleteKeep(Kuid,Ksid);
            response.getWriter().write(""+deleteStatus);
        }

    }
}
