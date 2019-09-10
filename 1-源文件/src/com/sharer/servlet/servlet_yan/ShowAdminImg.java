/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sharer.servlet.servlet_yan;

import com.alibaba.fastjson.JSON;
import com.sharer.dao.dao_yan.AdminImgsDao;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 浪里追大白
 */
@WebServlet("/ShowAdminImg")
public class ShowAdminImg  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AdminImgsDao aid=new AdminImgsDao();
        List<String> list=aid.SelectAdminImgs();
          String json=JSON.toJSON(list).toString();
        resp.getWriter().println(json);
    }
    
}
