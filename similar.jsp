<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>相似商品</title>
</head>
<style>
body {
	background: url(img/logback.jpg);
}
h3{
	text-align: center;
	color: #BBBBBB;
	font-family: "华文仿宋", "华文宋体", "华文中宋", "仿宋", "新宋体", "宋体";
	font-size: 30px;
	padding-bottom: 30px;
	padding-top:20px;
}
h1{text-align: center;
	color: #BBBBBB;
	font-family: "华文仿宋", "华文宋体", "华文中宋", "仿宋", "新宋体", "宋体";
	font-size: 30px;
	padding-top:20px;
	padding-bottom:10px;}
	
.STYLE1 {
	color: #CBCBCB;
}
	.box{
		text-align:center;
		color:white;}
		.box tr td{
			overflow:hidden}
			.box tr td img{
				cursor:pointer;
				transition:all 0.6s;}
				.box tr td img:hover{
					transform:scale(1.05,1.05);}
					a{
						text-decoration:none;
						font-family:"黑体";}
</style>
<link rel="stylesheet" type="text/css" href="css/banquan.css" />
<body>
<jsp:useBean id="SQLBean" class="bean.SQLBean" scope="page" />
<%
ResultSet oldrs = null;
ResultSet rs = null;

//分页
int PageSize = 5;
int Page = 1;
int totalPage = 1;
int totalrecord = 0;
SQLBean.OpenConn();
String id=request.getParameter("id");
String search=request.getParameter("search");
String oldquery="select * from car where id='"+id+"'"; 
//oldrs=SQLBean.executeFenye(oldfenye);
oldrs=SQLBean.executeQuery(oldquery);
String car="";
String pp="";
String type="";
String price="";
String color="";
String pic="";
while(oldrs.next())
{car=oldrs.getString("carname");
pp=oldrs.getString("brand");
type=oldrs.getString("type");
price=oldrs.getString("price");
color=oldrs.getString("color");
pic=oldrs.getString("pic");}
oldrs.close();

%>
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
                <h1 align="center">搜索商品</h3>
                <div class="box">
<table width="800" height="124"  border="0" align="center">
<tr>
<td><img src="<%=pic%>.jpg" width="150" height="80" /></td>
<td><%=car%></td>
<td><%=pp%></td>
<td><%=type%></td>
<td><%=price%></td>
<td><%=color%></td>
<td>&nbsp;</td>
</tr>
</table>
<div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 5px; padding-top:10px;"></div>
<h3 align="center">相似产品</h3>
<table width="800" height="200" border="0.5" align="center">
<tr><td>车辆名称</td>
<td>车辆品牌</td>
<td>车辆类型</td>
<td>车辆价格</td>
<td>车辆颜色</td>
</tr>
<%
String newquery="select * from car where id != "+id+" and ( carname like '%"+car+"%' or type like '%"+type+"%' or brand like '%"+pp+"%') order by price";

oldrs=SQLBean.executeQuery(newquery);
if(oldrs!=null)
while(oldrs.next())
{%>
<tr>
<td><a href="show.jsp?search=<%=request.getParameter("search")%>&id=<%=id%>" style="color:white;"><%=oldrs.getString("carname")%> </a></td>
<td><%=oldrs.getString("brand")%></td>
<td><%=oldrs.getString("type")%></td>
<td><%=oldrs.getString("price")%></td>
<td><%=oldrs.getString("color")%></td>

</tr>
<%
}
else
	out.print("没有相似商品");
%>

</table>

</div>
<p align="center" style="padding-bottom:20px; padding-top:30px;"><a href="test.jsp?search=<%=request.getParameter("search")%>&id=<%=request.getParameter("id")%>" class="STYLE1">返回上一页</a></p>
<div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 5px;"></div>
<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright ? 2018 Adobe Systems Incorporated. All rights reserved.</p>
</div> 
</body>
</html>