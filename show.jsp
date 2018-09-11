<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="SQLBean" class="bean.SQLBean" scope="page"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<script type="text/javascript">
    <!--
      function check()
      {
       
         if(confirm("您是否允许授权账号进行支付？")){
			window.location.href='pay.jsp?search=<%=request.getParameter("search")%>&id=<%=request.getParameter("id")%>';
			
			 }
			 else{
				 alert("支付失败！");}
        }
    </script>
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
		.STYLE1 {
	color: #A6A6A6;
}
.STYLE2 {
	font-family: "黑体";
	font-size: 14px;
	color: white;
}
.STYLE4 {font-family: "黑体"; font-weight: bold; 
color: white;}
a{
						text-decoration:none;
						font-family:"黑体";}
-->
</style>
<link rel="stylesheet" type="text/css" href="css/banquan.css" />
<title>详情页面显示</title>
</head>
<body>
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
                <h1>汽车详情</h1>
<table width="800" border="0" align="center" bordercolor="white">
        <% 

String id=request.getParameter("id");


String sql="select * from car where id='"+id+"'";
SQLBean.OpenConn();
ResultSet rs=SQLBean.executeQuery(sql);
while(rs.next()){
	%>
        <tr>
          <td width="201" rowspan="7"><span class="STYLE4"><img src="<%=rs.getString("pic")%>.jpg" alt="images" width="400" height="300" /></span></td>
          <td colspan="2"><div align="center" class="STYLE4"></div></td>
        </tr>
        <tr>
          <td colspan="2"><div align="center" class="STYLE4">车辆名称：<%=rs.getString("carname")%></div></td>
        </tr>
        <tr>
          <td colspan="2"><div align="center" class="STYLE4">车辆品牌：<%=rs.getString("brand")%></div></td>
        </tr>
        <tr>
          <td height="47" colspan="2"><div align="center" class="STYLE4">车辆类型：<%=rs.getString("type")%></div></td>
          </tr>
        <tr>
          <td height="47" colspan="2"><div align="center" class="STYLE4">车辆价格：<%=rs.getString("price")%></div></td>
      
        </tr>
        <tr>
          <td height="47" colspan="2"><div align="center" class="STYLE4">车辆颜色：<%=rs.getString("color")%></div></td>
        </tr>
       <tr>
          <td height="47" colspan="2"><div align="center" class="STYLE4">车辆数量：<%=rs.getString("amount")%></div></td>
         
        </tr>
        <tr>
          <td colspan="3"><div align="center">
    
          <input type="button" value="支付" onClick="check()" style="margin:15px; padding:5px 10px; font-size:15px; font-family:'黑体'" ></form>
          </div></td>
        </tr>
        
          
           
            <%}
				%>
            <%rs.close();
				SQLBean.closeStmt();
				SQLBean.closeConn();
				%>
         
      </table>    
</div>
<p align="center" style="padding-bottom:20px; padding-top:20px;"><a href="test.jsp?search=<%=request.getParameter("search")%>" class="STYLE1">返回上一页</a></p>
      <p align="center">&nbsp;</p>
<div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 5px;"></div>
<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
</div> 
</body>
  


</html> 