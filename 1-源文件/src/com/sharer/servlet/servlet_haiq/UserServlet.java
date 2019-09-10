package com.sharer.servlet.servlet_haiq;

import com.sharer.entity.entity_haiq.User;
import com.sharer.service.service_haiq.ExploreService;
import com.sharer.service.service_haiq.ModifyPwdService;
import com.sharer.service.service_haiq.UserService;
import com.sharer.util.JsonUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/US")
//item表示请求 1为通过id查找用户 4为通过name模糊查询用户id
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp){
        int item = Integer.parseInt(req.getParameter("item"));
        resp.setContentType("text/html;charset=utf-8");
        int id;
        PrintWriter out=null;
        try {
            out = resp.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        switch(item){
            case 1:
                id = Integer.parseInt(req.getParameter("Uid"));
                User user = UserService.searchUserById(id);
                JsonUtil.toJsonAndWrite(user,out);
                break;
            case 2:
                String inputName = req.getParameter("inputName");
                String oldName = req.getParameter("oldName");
                id = Integer.parseInt( req.getParameter("uid"));
                String inputWords = req.getParameter("inputWords");
                String inputGender = req.getParameter("inputGender");
                String inputBirth = req.getParameter("inputBirth");
                String inputEmail = req.getParameter("inputEmail");
                String inputTel = req.getParameter("inputTel");
                User newUser = new User(inputName,inputGender,inputEmail,inputTel,inputBirth,inputWords);
                newUser.setUid(id);
                boolean flag = ModifyPwdService.userUpdate(newUser,oldName);
                if(flag){
                    com.sharer.entity.entity_yang.User oldUser = (com.sharer.entity.entity_yang.User)req.getSession().getAttribute("user");
                    oldUser.setUname(inputName);
                    oldUser.setUgender(inputGender);
                    oldUser.setUemail(inputEmail);
                    oldUser.setUphone(inputTel);
                    oldUser.setUbirth(inputBirth);
                    oldUser.setUwords(inputWords);
                }
                JsonUtil.toJsonAndWrite(flag,out);
                break;
            case 3:
                List list = ExploreService.getRandomUsers();
                JsonUtil.toJsonAndWrite(list,out);
                break;
            case 4:
                String name = req.getParameter("name");
                list = UserService.blurrySearchByName(name);
                JsonUtil.toJsonAndWrite(list,out);
                break;
        }

    }

}
