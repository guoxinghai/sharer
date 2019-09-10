package com.sharer.servlet.servlet_qi;


import com.sharer.service.service_haiq.ExploreService;
import com.sharer.util.JsonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/EP")
public class ExplorePageServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out=resp.getWriter();
        List list = ExploreService.getRandomShare();
        JsonUtil.toJsonAndWrite(list,out);


    }
}
