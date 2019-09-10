package com.sharer.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CheckFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        if(request.getSession(false)==null||request.getSession(false).getMaxInactiveInterval()==0){
            String ctxPath=request.getContextPath()+"/"; //获取程序的上下文路径
            response.sendRedirect(ctxPath+"index.jsp"); //这里使用warning.html的完整路径
        }else if ((Boolean)request.getSession().getAttribute("isAdmin")){
            filterChain.doFilter(req,resp);
        }
        else if(request.getSession(false).getAttribute("user")==null){
            String ctxPath=request.getContextPath()+"/"; //获取程序的上下文路径
            response.sendRedirect(ctxPath+"index.jsp"); //这里使用warning.html的完整路径
        }else{
            filterChain.doFilter(req,resp);
        }

    }

    @Override
    public void destroy() {

    }
}
