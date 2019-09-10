package com.sharer.servlet.servlet_haiq;

import com.sharer.service.service_haiq.LikeService;
import com.sharer.util.JsonUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LS")//item为1表示获取某个动态的赞 2为增加一条点赞数据 3为删除一条点赞数据 4判断用户是否给动态点赞
public class LikeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp){
        int item = Integer.parseInt(req.getParameter("item"));
        int sid;
        int uid;
        int num;
        boolean flag;
        PrintWriter out=null;
        try {
            out = resp.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        switch (item){
            case 1:
                sid = Integer.parseInt(req.getParameter("sid"));
                num = LikeService.getLikeNumber(sid);
                JsonUtil.toJsonAndWrite(num,out);
                break;
            case 2:
                sid = Integer.parseInt(req.getParameter("sid"));
                uid = Integer.parseInt(req.getParameter("uid"));
                LikeService.insert(uid,sid);
                break;
            case 3:
                sid = Integer.parseInt(req.getParameter("sid"));
                uid = Integer.parseInt(req.getParameter("uid"));
                LikeService.delete(uid,sid);
                break;
            case 4:
                sid = Integer.parseInt(req.getParameter("sid"));
                uid = Integer.parseInt(req.getParameter("uid"));
                flag = LikeService.isLikeShare(uid,sid);
                JsonUtil.toJsonAndWrite(flag,out);
                break;
        }
    }
}
