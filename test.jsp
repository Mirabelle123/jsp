<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript">
    <!--
      function check()
      {
        if ( document.getElementById("search").value == "" )
        {
          alert("搜索值不能为空！");
          return false;
        
		}}

    </script>
</head>
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
a{
						text-decoration:none;
						font-family:"黑体";}
h1{
	text-align: center;
	color: #BBBBBB;
	font-family: "华文仿宋", "华文宋体", "华文中宋", "仿宋", "新宋体", "宋体";
	font-size: 30px;
	padding-bottom: 30px;
	padding-top:20px;
}
#sea{
	color:white;
	background: url(/img/search.jpg) no-repeat fixed center;
	}
	.box{
		color:white;}
		.STYLE1 {
	color: #CBCBCB;
}
.STYLE2 {
	font-family: "黑体";
	font-size: 14px;
	color: white;
}
.STYLE4 {font-family: "黑体"; font-weight: bold; 
color: white;}
.search{
	text-align:center;
	padding-bottom:20px;}
	.box{
		text-align:center;
		padding-left:200px;}
		.box tr td{
			overflow:hidden}
			.box tr td img{
				cursor:pointer;
				transition:all 0.6s;}
				.box tr td img:hover{
					transform:scale(1.05,1.05);}
-->
</style>
<link rel="stylesheet" type="text/css" href="css/banquan.css" />
<body>
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
                <h1>车辆搜索结果</h1>
<form action="test.jsp" method="get" onsubmit="return check()">
		<div class="search">
		   <input id="search" name="search" type="text"/>
		   <button id="sea">搜索</button>
		</div></form>
<jsp:useBean id="SQLBean" class="bean.SQLBean" scope="page"/>

<%
ResultSet rs = null;

//分页
int PageSize = 5;
int Page = 1;
int totalPage = 1;
int totalrecord = 0;
SQLBean.OpenConn();
String myquery="select * from car where carname like '%"+request.getParameter("search")+"%'";
rs=SQLBean.executeQuery(myquery);
if (rs.next()){   
	rs.last();   
	totalrecord   =   rs.getRow();//得到记录集的总记录数（总行数）；   
	rs.first();   
}  
 if(totalrecord==0)
{%>
      
		 
          <P style="color:white" align="center">搜索跑偏了哟~</P>
          <P style="color:white" align="center">请您重新输入~</a></P>

		  <%}
		  else{
  
if(totalrecord<=5&totalrecord>0)   
	PageSize=5;
if(totalrecord % PageSize ==0)// 如果是当前页码的整数倍
	totalPage = totalrecord / PageSize; 
else  // 如果最后还空余一页
	totalPage = (int) Math.floor( totalrecord / PageSize ) + 1; 
if(totalPage == 0) totalPage = 1;
if(request.getParameter("Page")==null || request.getParameter("Page").equals(""))
	Page = 1;
else
	try {
		Page = Integer.parseInt(request.getParameter("Page"));
	}
	catch(java.lang.NumberFormatException e){
		// 捕获用户从浏览器地址拦直接输入Page=sdfsdfsdf所造成的异常
		Page = 1;
	}
if(Page < 1)  Page = 1;
if(Page > totalPage) Page = totalPage;
rs.absolute((Page-1) * PageSize + 1);%>

<hr />
<div class="box">
<table width="800" height="340" border="0">

<%for(int iPage=1; iPage<=PageSize; iPage++)
{
	String id=rs.getString("carname");%>
<tr>
<td><img src="<%=rs.getString("pic")%>.jpg" width="150" height="80" /></td>
<td><%=id%></td>
<td><%=rs.getString("brand")%></td>
<td><%=rs.getString("type")%></td>
<td><%=rs.getString("price")%></td>
<td><%=rs.getString("color")%></td>
<td><a href="show.jsp?search=<%=request.getParameter("search")%>&id=<%=rs.getString("id")%>" class="STYLE1">查看详情</a></td>

<td><a href="similar.jsp?search=<%=request.getParameter("search")%>&id=<%=rs.getString("id")%>"  class="STYLE1">相似产品</a></td>
</tr>
<%if(!rs.next()) break;
}
%>
</table>
<FORM Action="test.jsp？" Method="GET">
<% 
   if(Page != 1) {
      out.print("   <A HREF=test.jsp?search="+request.getParameter("search")+"&Page=1\">第一页</A>");
      out.print("   <A HREF=test.jsp?search="+request.getParameter("search")+"&Page=" + (Page-1) + ">上一页</A>");
   }
   if(Page != totalPage) {
      out.print("   <A HREF=test.jsp?search="+request.getParameter("search")+"&Page=" + (Page+1) + ">下一页</A>");
   out.print("   <A HREF=test.jsp?search="+request.getParameter("search")+"&Page=" + totalPage + ">最后一页</A>");
   }
%>
<p>&nbsp;</p>
<BR>输入页数：<input TYPE="TEXT" Name="Page" SIZE="3"> 
页数:<font COLOR="Red"><%=Page%>/<%=totalPage%></font> 
</FORM>
</div>
<%}%>
<p>&nbsp;</p>
<p align="center"><a href="index.jsp" class="STYLE1">返回主页</a></p>
      <p align="center">&nbsp;</p>
<div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 5px;"></div>
<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright ? 2018 Adobe Systems Incorporated. All rights reserved.</p>
</div> 
</body>
</html>