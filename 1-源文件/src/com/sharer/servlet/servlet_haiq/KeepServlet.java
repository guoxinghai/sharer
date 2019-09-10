package com.sharer.servlet.servlet_haiq;

import com.sharer.service.service_haiq.KeepService;
import com.sharer.util.JsonUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/KS")//item为1为获取收藏动态 2为判断某个人是否收藏了动态 3为增加收藏数据 4 为删除收藏数据
public class KeepServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp){
        resp.setContentType("text/html;charset=utf-8");
        int item = Integer.parseInt(req.getParameter("item"));
        int uid = Integer.parseInt(req.getParameter("uid"));
        int sid;
        List list;
        PrintWriter out = null;
        try {
            out = resp.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        switch(item){
            case 1:
                int start = Integer.parseInt(req.getParameter("start"));
                //获取动态
                list = KeepService.getCollectionShares(uid,start);
                //写入json数据并返回
                JsonUtil.toJsonAndWrite(list,out);
                break;
            case 2:
                sid = Integer.parseInt(req.getParameter("sid"));
                boolean flag = KeepService.isKeep(uid,sid);
                //写入json数据并返回
                JsonUtil.toJsonAndWrite(flag,out);
                break;
            case 3:
                sid = Integer.parseInt(req.getParameter("sid"));
                KeepService.insert(uid,sid);
                break;
            case 4:
                sid = Integer.parseInt(req.getParameter("sid"));
                KeepService.delete(uid,sid);
                break;

        }

    }
}
