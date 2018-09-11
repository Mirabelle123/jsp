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
 * �û���¼Servlet 
 *  
 * @author lizi 
 * @version 1.0.0 2015��7��14��19:29:45 
 */  
public class LoginServlet extends HttpServlet {  
  
    // ���û��ύ����Get�����򽫴�����ת����doPost  
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        this.doPost(request, response);  
    }  
  
    // �����û���Post����  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
        // ��ȡ�û�������û���  
        String userName = request.getParameter("userName");  
        // ��ȡ�û��������  
        String password = request.getParameter("password");  
     String username=URLEncoder.encode(userName,"UTF-8");
        if (userName != null && password != null) {  
           
                // ���û����洢��session��  
                request.getSession().setAttribute("user", userName);  
  
                // ��ͻ���д��cookie����ΪΪsso  
                Cookie c = new Cookie("sso", username);  
                c.setMaxAge(3600);// ����cookie��Чʱ��Ϊ1Сʱ  
                c.setDomain(".tgb.com");// www.taobao.tgb.com  
                                        // www.tianmao.tgb.com  
                c.setPath("/");// �������е�����  
                response.addCookie(c);// ��cookie��ӵ�response��  
           
        }  
        // ��ת��index.jspҳ��  
        response.sendRedirect(request.getContextPath() + "/index.jsp");  
    }  
  
      
}  