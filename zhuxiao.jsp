<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="SQLBean" class="bean.SQLBean" scope="page"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
body {
	background-color:black;
}
#Layer1 {position:absolute;
	width:54px;
	height:22px;
	z-index:1;
	left: 997px;
	top: 224px;
}
.STYLE1 {color: white;}
.STYLE2 {font-family: "黑体";color:white;}
.STYLE3 {font-family: "黑体";color:white;}
-->
</style>
<link rel="stylesheet" type="text/css" href="css/banquan.css" />
<title>注销</title>
</head>
<body>
<table width="1000" height="510" border="0" align="center">
  <tr>
    <td height="202"><img src="img/logback.jpg" width="100%" height="100%"></td>
  </tr>
  <tr>
    <td height="249"><div align="center">
      <%
   response.setHeader("refresh", "5; URL = login.jsp");  
   session.invalidate(); 
  %>
    </div>
      <p align="center" class="STYLE2">注销成功，五秒后自动跳转到登录界面</p>
    <p align="center"><span class="STYLE3">或者</span><a href="index.jsp" class="STYLE1">点击跳转</a></p></td>
  </tr>
</table>
<div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 5px;"></div>	
	<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
	  </div>
	</div>
</body>
</html> 