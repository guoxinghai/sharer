package com.sharer.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EncodingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig){
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        //该方法接收三个参数
        //1. 表示拦截的请求对象
        //2. 表示拦截的响应对象
        //3. 一个FilterChain对象，表示过滤器链，可用于操作过滤器链上的过滤器
        //可以在控制台观察下面这行代码的输出判断过滤器的doFitler()方法什么时候被调用
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        request.setCharacterEncoding("utf-8"); //修改请求编码
        response.setCharacterEncoding("utf-8");
        chain.doFilter(request, response);//相当于放行的意思
    }

    //destroy()方法在一个过滤器实例被摧毁前调用，用于释放资源
    @Override
    public void destroy() {
    }
}
