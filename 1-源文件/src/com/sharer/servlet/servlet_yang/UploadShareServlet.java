package com.sharer.servlet.servlet_yang;

import com.sharer.entity.entity_yang.Share;
import com.sharer.entity.entity_yang.User;
import com.sharer.service.service_yang.ShareService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@MultipartConfig(location = "C:\\shareData\\shareImg")

@WebServlet("/uss")

public class UploadShareServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // TODO Auto-generated method stub

        //得到part对象，这个对象有write的方法，直接写到指定位置。但是千万别忘了写@MultipartConfig(location="E:/")注解，不指定位置默认是写到注解指定的位置。
        response.setContentType("text/html;charset = utf-8");
        Part part = request.getPart("file");
        //普通的字段可以采用常规的getparamter的方法得到。
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int Suid = user.getUid();
        String Stext = request.getParameter("Stext");
        String Simg = ShareService.getFileNameFromPart(part);
        String Stime = ShareService.getCurrentTime();
        int Svisible = Integer.parseInt(request.getParameter("Svisible"));

        Share share = new Share(Suid, Stext, Simg, Stime, Svisible);
        boolean status = ShareService.insertShare(share);
//        System.out.println("status" + status);
//        System.out.println("1" + part.getName());
//        System.out.println("2" + part.getHeader("Content-Disposition"));
//        System.out.println("3" + part.getSize());


//        System.out.println("4" + Simg);
        part.write(Simg);  // 写入硬盘



    }




}
