<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="SQLBean" class="bean.SQLBean" scope="page"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"; charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<style type="text/css">
<!--
body {
	background:url(img/logback.jpg);
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
<%
String id=request.getParameter("id");
//out.print(a);
String sql="delete from car where id='"+id+"'";

SQLBean.OpenConn();
SQLBean.executeUpdate(sql);
%>
<div align="center">
      <P align="center" class="STYLE1">&nbsp;</P>
      <P align="center" class="STYLE1">删除成功啦！</P>
      <P align="center" class="STYLE1">&nbsp;</P>
      <p align="center"><a href="adminshow.jsp" class="STYLE2">返回车辆库存页面</a></p>
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