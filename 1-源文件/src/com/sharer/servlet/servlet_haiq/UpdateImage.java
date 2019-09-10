package com.sharer.servlet.servlet_haiq;

import com.sharer.entity.entity_yang.User;
import com.sharer.service.service_haiq.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@MultipartConfig(location="C:\\shareData\\userImg")
@WebServlet("/UI")
public class UpdateImage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        //<Context docBase="E:\images\" path="img" reloadable="true"/>
        Part part = request.getPart("file");
        int uid = Integer.parseInt(request.getParameter("uid"));
        //普通的字段可以采用常规的getparamter的方法得到。
        String fileName = getFileNameFromPart(part);
        part.write(fileName);
        String path = getServletContext().getInitParameter("userPath") + fileName;
        //更新数据库用户头像
        UserService.updateUserImage(uid,fileName);
        //更新session用户头像
        User user = (User)request.getSession().getAttribute("user");
        user.setUimg(fileName);
        response.getWriter().write(path);
    }

    //截取文件名

    public String getFileNameFromPart(Part part) {

        String header = part.getHeader("Content-Disposition");
        String fileName = header.substring(header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));

        return fileName;

    }
}
