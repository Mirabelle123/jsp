<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="SQLBean" class="bean.SQLBean" scope="page"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"	+ request.getServerName() + ":" + request.getServerPort()	+ path + "/";
	String username=request.getParameter("userName");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"; charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<style type="text/css">
<!--
body {
	background:url(img/logback.jpg);
}
a{
				text-decoration: none;
			}
.STYLE1 {
	font-family: "黑体";
	font-size: 24px;
	color:white;
}
#Layer1 {position:absolute;
	width:54px;
	height:22px;
	z-index:1;
	left: 991px;
	top: 239px;
}
.STYLE2 {color: white;}
-->
</style></head>
<body>
<div class="box">

<div align="center">
      <P align="right" class="STYLE1">
      <c:choose>
		<c:when test="${not empty sessionScope.user}">
    			欢迎你：<%=session.getAttribute("user").toString()%>
                <a href="zhuxiao.jsp" class="STYLE1">注销</a>
	  </c:when>
		<c:otherwise>
    			你还没有登录，请先<a href="login.jsp" class="STYLE1">登录</a>
                
                </c:otherwise></c:choose>
                </P>
      
      
      
    <P align="center" class="STYLE1">请扫描如下二维码进行支付：</P>
        <P align="center" class="STYLE1"><img src="img/pay.jpg" width="350" height="400" alt=""/></P>
      <P align="center" class="STYLE1">&nbsp;</P>
      <p align="center"><a href="show.jsp?search=<%=request.getParameter("search")%>&id=<%=request.getParameter("id")%>" class="STYLE2">返回车辆详情页面</a></p>
      <p align="center">&nbsp;</p></td>

</div>
</div>
      <div style="width: auto;border: 0.5px solid whitesmoke; margin-top:50px;"></div>
<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
</div> 
</body>
</html> 