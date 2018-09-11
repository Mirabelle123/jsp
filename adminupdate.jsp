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
.STYLE2 {
	color:white;
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
</head>
<body>
<%
       
		String price = request.getParameter("price");
        String amount = request.getParameter("amount");
		String id = request.getParameter("id");
        SQLBean.OpenConn();
        ResultSet rs=null;
       String sql1="update car set price='"+price+"' where id='"+id+"'";
		   String sql2="update car set amount='"+amount+"' where id='"+id+"'";
        SQLBean.executeUpdate(sql1);
		   SQLBean.executeUpdate(sql2);
       
    
        %>  
<div align="center" class="box">
<table width="1000" height="472" align="center">
  <tr>
    <td height="209" ><P align="center" class="STYLE1">&nbsp;</P>
      <P align="center" class="STYLE1">&nbsp;</P>
      <P align="center" class="STYLE1">修改成功啦！</P>
      <P align="center" class="STYLE1">&nbsp;</P>
      <p align="center"><a href="adminmessage.jsp?test=<%=id%>" class="STYLE2">返回车辆修改页面</a></p>
      <p align="center">&nbsp;</p></td>
  </tr>
</table>
<P>&nbsp;</P>
</div>
<div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 5px;"></div>
<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
</div> 
</body>
</html> 