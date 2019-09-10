package com.sharer.servlet.servlet_haiq;

import com.sharer.service.service_haiq.FanService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/IFS")
public class IsFanServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse resp){
        int fid = Integer.parseInt(req.getParameter("Fid"));
        int sid = Integer.parseInt(req.getParameter("Sid"));
        boolean flag = FanService.isFan(fid,sid);
        try {
            resp.getWriter().write(""+flag);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
