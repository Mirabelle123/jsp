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
h1{
	text-align: center;
	color: #BBBBBB;
	font-family: "华文仿宋", "华文宋体", "华文中宋", "仿宋", "新宋体", "宋体";
	font-size: 30px;
	padding-bottom: 30px;
	padding-top:20px;
}
.sub{
	color:white;
	background: url(/img/search.jpg) no-repeat fixed center;
	}
	.box{
		color:white;}
		.STYLE1 {color: white;}
.STYLE2 {
	font-family: "黑体";
	font-size: 14px;
	color: white;
}
.STYLE4 {font-family: "黑体"; font-weight: bold; 
color: white;}
-->
</style>
<link rel="stylesheet" type="text/css" href="css/banquan.css" />
<title>详情页面显示</title>
</head>
<body>
<div align="center">
<h1>汽车详情</h1>
<table width="800" border="1" align="center" bordercolor="white">
        <% 

String id=request.getParameter("test");


String sql="select * from car where id='"+id+"'";
SQLBean.OpenConn();
ResultSet rs=SQLBean.executeQuery(sql);
while(rs.next()){
	%>
        <tr>
          <td width="201"><span class="STYLE4">车辆名称：</span></td>
          <td colspan="2"><div align="center" class="STYLE4"><%=rs.getString("carname")%></div></td>
        </tr>
        <tr>
          <td><span class="STYLE4">品牌名称：</span></td>
          <td colspan="2"><div align="center" class="STYLE4"><%=rs.getString("brand")%></div></td>
        </tr>
        <tr>
          <td height="47"><span class="STYLE4">车辆类型：</span></td>
          <td colspan="2"><div align="center" class="STYLE4"><%=rs.getString("type")%></div></td>
          </tr>
        <tr>
          <td height="47"><span class="STYLE4">价格：</span></td>
          <td colspan="2"><div align="center">
          <form action="adminupdate.jsp?id=<%=rs.getString("id")%>&amount=<%=rs.getString("amount")%>"  method="post">
           <input type="text" name="price" value="<%=rs.getString("price")%>">
            <input type="submit" class="sub" name="submit" value="修改">
		 </form>
          </div></td>
        </tr>
        <tr>
          <td height="47"><span class="STYLE4">颜色：</span></td>
          <td colspan="2"><div align="center" class="STYLE4"><%=rs.getString("color")%></div></td>
        </tr>
       <tr>
          <td height="47"><span class="STYLE4">库存：</span></td>
          <td colspan="2"><div align="center">
          <form action="adminupdate.jsp?id=<%=rs.getString("id")%>&price=<%=rs.getString("price")%>"  method="post">
           <input type="text" name="amount" value="<%=rs.getString("amount")%>">
            <input type="submit" class="sub" name="submit" value="修改">
		  </form>
         </div></td>
        </tr>
       <tr>
          <td colspan="3"><div align="right">
          <a href="admindelete.jsp?id=<%=rs.getString("id")%>" class="STYLE1">删除</a></div></td>
        </tr>
        
          
           
            <%}
				%>
            <%rs.close();
				SQLBean.closeStmt();
				SQLBean.closeConn();
				%>
         
      </table>    
</div>
<p align="center"><a href="adminshow.jsp" class="STYLE1">返回上一页</a></p>
      <p align="center">&nbsp;</p>
<div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 5px;"></div>
<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
</div> 
</body>
  


</html> 