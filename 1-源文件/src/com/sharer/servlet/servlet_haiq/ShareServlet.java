package com.sharer.servlet.servlet_haiq;

import com.sharer.service.service_haiq.ShareService;
import com.sharer.util.JsonUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/SS")
//item标志着请求的内容1代表请求动态列表，2代表通过id请求动态,3通过用户id请求用户发表动态的数量
//4通过sid删除动态
public class ShareServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        int item = Integer.parseInt(req.getParameter("item"));
        resp.setContentType("text/html;charset=utf-8");
        Object data = null;
        int start;
        int uid;
        int flag;
        int sid;
        switch (item){
            case 1:
                start = Integer.parseInt(req.getParameter("start"));
                uid = Integer.parseInt(req.getParameter("Uid"));
                flag = Integer.parseInt(req.getParameter("flag"));
                data = ShareService.getShares(uid,flag,start);
                break;
            case 2:
                sid = Integer.parseInt(req.getParameter("Sid"));
                data = ShareService.getShareById(sid);
                break;
            case 3:
                uid = Integer.parseInt(req.getParameter("Uid"));
                data = ShareService.getShareNumber(uid);
                break;
            case 4:
                sid = Integer.parseInt(req.getParameter("Sid"));
                data = ShareService.deleteShareById(sid);
                break;
        }


        try {
            JsonUtil.toJsonAndWrite(data,resp.getWriter());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
