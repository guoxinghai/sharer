package com.sharer.servlet.servlet_haiq;


import com.sharer.service.service_haiq.FanService;
import com.sharer.util.JsonUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


@WebServlet("/FS")
public class FanServlet extends HttpServlet {
    //根据flag的值获取用户想要获得粉丝列表还是关注列表：1为获得粉丝列表 2为获得关注列表 3获取粉丝数量 4获取关注数量
    public void doPost(HttpServletRequest req, HttpServletResponse resp){
        int Uid = Integer.parseInt(req.getParameter("Uid"));
        int flag = Integer.parseInt(req.getParameter("flag"));
        List list = null;
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = resp.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        switch(flag){
            case 1:
                list = FanService.getFan(Uid);
                JsonUtil.toJsonAndWrite(list,out);
                break;
            case 2:
                list = FanService.getLike(Uid);
                JsonUtil.toJsonAndWrite(list,out);
                break;
            case 3:
                int num = FanService.getFanNumber(Uid);
                JsonUtil.toJsonAndWrite(num,out);
                break;
            case 4:
                num = FanService.getLikeNumber(Uid);
                JsonUtil.toJsonAndWrite(num,out);
                break;
        }


    }
}
