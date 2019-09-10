package com.sharer.servlet.servlet_haiq;

import com.sharer.service.service_haiq.CommentService;
import com.sharer.service.service_haiq.ThumbsService;
import com.sharer.util.JsonUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/CS")
//item 为1获取某个文章的所有评论,为2判断用户是否给某个评论点赞了,3代表给评论点赞,
// 4代表取消评论赞,5获取评论点赞数,6添加评论,7获取动态的评论数
public class CommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp){
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        int item,sid,uid,cid;
        try {
            out = resp.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        item = Integer.parseInt(req.getParameter("item"));
        switch (item){
            case 1:
                sid = Integer.parseInt(req.getParameter("sid"));
                List list = CommentService.getComments(sid);
                JsonUtil.toJsonAndWrite(list,out);
                break;
            case 2:
                cid = Integer.parseInt(req.getParameter("cid"));
                uid = Integer.parseInt(req.getParameter("uid"));
                boolean flag = ThumbsService.isThumbs(uid,cid);
                JsonUtil.toJsonAndWrite(flag,out);
                break;
            case 3:
                cid = Integer.parseInt(req.getParameter("cid"));
                uid = Integer.parseInt(req.getParameter("uid"));
                ThumbsService.thumbs(uid,cid);
                break;
            case 4:
                cid = Integer.parseInt(req.getParameter("cid"));
                uid = Integer.parseInt(req.getParameter("uid"));
                ThumbsService.concel(uid,cid);
                break;
            case 5:
                cid = Integer.parseInt(req.getParameter("cid"));
                int num = ThumbsService.getThumbsNumber(cid);
                JsonUtil.toJsonAndWrite(num,out);break;
            case 6:
                int cuid = Integer.parseInt(req.getParameter("cuid"));
                int csid = Integer.parseInt(req.getParameter("csid"));
                String text = req.getParameter("text");
                int n = CommentService.insertComment(cuid,csid,text);
                JsonUtil.toJsonAndWrite(n,out);
                break;
            case 7:
                sid = Integer.parseInt(req.getParameter("sid"));
                num = CommentService.getCommentNumber(sid);
                JsonUtil.toJsonAndWrite(num,out);
                break;
        }

    }

}
