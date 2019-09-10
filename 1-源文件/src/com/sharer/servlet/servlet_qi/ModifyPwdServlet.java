/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sharer.servlet.servlet_qi;

import com.sharer.service.service_haiq.ModifyPwdService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MP")
public class ModifyPwdServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userPwd = req.getParameter("userPwd");
        String inputPwd1 = req.getParameter("inputPwd1");
        int uid = Integer.parseInt(req.getParameter("uid"));
//        String np= "shabi";
        String newPwd = req.getParameter("inputPwd2");
        boolean equalStatus = ModifyPwdService.isOldpwdEqual(userPwd,inputPwd1);

  if (equalStatus){
      boolean modifyStatus = ModifyPwdService.modifyPassword(uid, newPwd);
      System.out.println("modifyStatus"+modifyStatus);
      resp.getWriter().write("modifyStatus:"+modifyStatus);
  }else {
      resp.getWriter().write("equalStatus:"+equalStatus);  // 返回与数据库密码不一致，一定为false

  }


    }


}
