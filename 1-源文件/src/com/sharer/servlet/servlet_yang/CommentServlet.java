package com.sharer.servlet.servlet_yang;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.sharer.entity.entity_yang.Comment;
import com.sharer.entity.entity_yang.User;
import com.sharer.service.service_yang.CommentService;
import com.sharer.service.service_yang.UserService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/cs")
//item 为1获取某个文章的所有评论,为2判断用户是否给某个评论点赞了,3代表给评论点赞,
// 4代表取消评论赞,5获取评论点赞数,6添加评论,7获取动态的评论数
public class CommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        resp.setContentType("text/html;charset=utf-8");

        int item, sid;
        PrintWriter out = null;

        item = Integer.parseInt(req.getParameter("item"));
        switch (item) {
            case 1:
                sid = Integer.parseInt(req.getParameter("sid"));
                List<Comment> commentList = CommentService.getComments(sid);

                JSONArray commentArray = JSONArray.parseArray(JSON.toJSONString(commentList));
                try {
                    resp.getWriter().println(commentArray);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            case 2: //根据cuid获取用户名称
                int cuid = Integer.parseInt(req.getParameter("cuid"));
                User user = UserService.searchUserById(cuid);
                String uname = user.getUname();
                try {
                    resp.getWriter().write(uname);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
//            case 2:
//                cid = Integer.parseInt(req.getParameter("cid"));
//                uid = Integer.parseInt(req.getParameter("uid"));
//                boolean flag = ThumbsService.isThumbs(uid,cid);
//                JsonUtil.toJsonAndWrite(flag,out);
//                break;
//            case 3:
//                cid = Integer.parseInt(req.getParameter("cid"));
//                uid = Integer.parseInt(req.getParameter("uid"));
//                ThumbsService.thumbs(uid,cid);
//                break;
//            case 4:
//                cid = Integer.parseInt(req.getParameter("cid"));
//                uid = Integer.parseInt(req.getParameter("uid"));
//                ThumbsService.concel(uid,cid);
//                break;
//            case 5:
//                cid = Integer.parseInt(req.getParameter("cid"));
//                int num = ThumbsService.getThumbsNumber(cid);
//                JsonUtil.toJsonAndWrite(num,out);break;
            case 3:
                cuid = Integer.parseInt(req.getParameter("cuid"));
                int csid = Integer.parseInt(req.getParameter("csid"));
                String text = req.getParameter("text");
                int n = CommentService.insertComment(cuid, csid, text);
                try {
                    resp.getWriter().println(n);
                } catch (IOException e) {
                    e.printStackTrace();
                }
//            case 7:
//                sid = Integer.parseInt(req.getParameter("sid"));
//                num = CommentService.getCommentNumber(sid);
//                JsonUtil.toJsonAndWrite(num,out);
//                break;
        }


    }

}
