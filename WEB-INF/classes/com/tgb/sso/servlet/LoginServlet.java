package com.tgb.sso.servlet;


import java.io.IOException;

import java.io.PrintWriter;

import java.*;
import javax.servlet.ServletException;

import javax.servlet.http.Cookie;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import sun.misc.UCEncoder;

/** 
 * 用户登录Servlet 
 *  
 * @author lizi 
 * @version 1.0.0 2015年7月14日19:29:45 
 */  
public class LoginServlet extends HttpServlet {  
  
    // 若用户提交的是Get请求，则将此请求转发给doPost  
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        this.doPost(request, response);  
    }  
  
    // 接受用户的Post请求  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
        // 获取用户输入的用户名  
        String userName = request.getParameter("userName");  
        // 获取用户输入的面  
        String password = request.getParameter("password");  
     String username=URLEncoder.encode(userName,"UTF-8");
        if (userName != null && password != null) {  
           
                // 把用户名存储在session中  
                request.getSession().setAttribute("user", userName);  
  
                // 向客户端写入cookie，名为为sso  
                Cookie c = new Cookie("sso", username);  
                c.setMaxAge(3600);// 设置cookie有效时间为1小时  
                c.setDomain(".tgb.com");// www.taobao.tgb.com  
                                        // www.tianmao.tgb.com  
                c.setPath("/");// 拦截所有的请求  
                response.addCookie(c);// 把cookie添加到response中  
           
        }  
        // 跳转到index.jsp页面  
        response.sendRedirect(request.getContextPath() + "/index.jsp");  
    }  
  
      
}  