package com.sharer.servlet.servlet_haiq;

import com.sharer.service.service_haiq.FanService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

//用flag来判断用户的行为 1代表关注，2代表取关,3代表关注的数量
@WebServlet("/FOS")
public class FriendOperationServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse resp) {
        int flag = Integer.parseInt(req.getParameter("flag"));
        int id = Integer.parseInt(req.getParameter("Uid"));
        String name = req.getParameter("Uname");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = null;
        try {
            out = resp.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        switch (flag){
            case 1:FanService.follow(id,name);break;
            case 2:FanService.unFollow(id,name);break;
            case 3:out.write(FanService.getLikeNumber(id)+"");break;
        }
    }
}
