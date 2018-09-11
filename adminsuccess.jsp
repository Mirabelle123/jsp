<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.sql.*" import="java.util.*" import="java.text.*" import="java.util.Date"%>
<jsp:useBean id="SQLBean" class="bean.SQLBean" scope="page"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"; charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<style type="text/css">
body {
	background:url(img/logback.jpg);
}
#Layer1 {	position:absolute;
	width:54px;
	height:22px;
	z-index:1;
	left: 997px;
	top: 224px;
}
.STYLE2 {color: white; }
.STYLE3 {font-family: "黑体"; color:white;}
.STYLE4 {font-family: "黑体"}
-->
</style></head>
<body>
<table width="1000" height="555" border="0" align="center">
  <tr>
    <td height="294"><p align="center">
      <% 
int ceshi=0;
String carname=request.getParameter("carname");
String brand=request.getParameter("brand");
String type=request.getParameter("type");
String price=request.getParameter("price");
String color=request.getParameter("color");
String amount=request.getParameter("amount");

SQLBean.OpenConn();

String sql="select * from car";
ResultSet rs=SQLBean.executeQuery(sql);

while(rs.next()){
if(carname.equals(rs.getString("carname"))){
         ceshi++;}
	}
	rs.close();
	SQLBean.closeStmt();
	SQLBean.closeConn();
				

if(ceshi!=0){
	
	%>
    </p>
      <p align="center" class="STYLE4">该类型车辆已存在，请重新填写</p>
      <p align="center"><a href="adminadd.jsp" class="STYLE2">返回车辆库存界面</a></p>
      <div align="center">
        <%}else {

SQLBean.OpenConn();
String sql1="insert into car (carname,brand,type,price,color,amount) values('"+ carname + "','" + brand + "','" + type + "','" + price + "','" + color + "','" + amount + "')";
SQLBean.executeUpdate(sql1);
	
%>
      </div>
      <P align="center" class="STYLE3">添加成功啦！</P>
      <p align="center"><a href="adminshow.jsp" class="STYLE2">返回车辆库存列表</a></p>
      <div align="center">
        <%}%>
    </div></td>
  </tr>
</table>
<p>&nbsp;</p>
<div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 5px;"></div>
<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
</div> 
</body>
</html> 