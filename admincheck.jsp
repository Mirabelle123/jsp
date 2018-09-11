<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="SQLBean" class="bean.SQLBean" scope="page"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"	+ request.getServerName() + ":" + request.getServerPort()	+ path + "/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
body {
	background: url(img/logback.jpg);
}
#Layer1 {position:absolute;
	width:54px;
	height:22px;
	z-index:1;
	left: 997px;
	top: 224px;
}
#sub{
	color:white;
	background: url(/img/search.jpg) no-repeat fixed center;
	}
	.box{
		color:white;}
-->
</style>
<link rel="stylesheet" type="text/css" href="css/banquan.css" />
<title>管理员登录验证</title>
</head>
<body>
<table width="1000" height="458" align="center">
                  <tr>
                    <td height="202"></td>
                  </tr>
                  <tr>
                    <td height="195"><table height="50" align="center">
                     <div class="box" align="center"> 
                      <% String adminname=request.getParameter("adminname");
   String adminpassword=request.getParameter("adminpassword");
   //out.print(username);
   //out.print(password);
String sql="select * from admin";
SQLBean.OpenConn();
ResultSet rs=SQLBean.executeQuery(sql);
while(rs.next()){
if(adminname.equals(rs.getString("adminname"))&&adminpassword.equals(rs.getString("adminpassword"))){
out.print("登录成功");%>
                     

                      
                          
                          <div align="center"></div>
                          <div align="center"></div>
                          <div align="center"></div>
                      <p><a href="adminshow.jsp">确定</a></p>
                      <%}else{
	out.print("您的账号或密码不正确！");%></div>
                      
	
                      
                          <div align="center"></div>
                          <div align="center"></div>
                      <p style="text-align:center; color:white;"><a href="adminlogin.jsp">重新登录</a></p>
                      <%}}
	%>
                      <%rs.close();
				SQLBean.closeStmt();
				SQLBean.closeConn();
				%>
                     
  </table></td>
                  </tr>
                </table>
          <div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 28px;"></div>
     <div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
	  </div>
</body>
</html> 





