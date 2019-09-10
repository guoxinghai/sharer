/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sharer.servlet.servlet_yan;

import com.alibaba.fastjson.JSON;
import com.sharer.dao.dao_yan.UsersDao;
import com.sharer.entity.entity_yan.User;
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
@WebServlet("/su")
public class SelectUsers extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        UsersDao udo = new UsersDao();
        List<User> users = udo.SelectUsers();

        String json = JSON.toJSON(users).toString();
        resp.getWriter().println(json);
    }

}
