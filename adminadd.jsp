<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page  import="java.util.*" import="java.text.*" import="java.util.Date"%>
<jsp:useBean id="SQLBean" class="bean.SQLBean" scope="page"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"; charset="utf-8">
<title>后台车辆管理</title>
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<style type="text/css">
body {
	background:url(img/logback.jpg);
}
h1{
	text-align: center;
	color: #BBBBBB;
	font-family: "华文仿宋", "华文宋体", "华文中宋", "仿宋", "新宋体", "宋体";
	font-size: 36px;
	padding-bottom: 10px;
	padding-top:20px;
}
#Layer1 {
	position:absolute;
	width:44px;
	height:20px;
	z-index:1;
	left: 1003px;
	top: 226px;
}.sub{
	color:white;
	background: url(/img/search.jpg) no-repeat fixed center;
	}
.STYLE2 {color:white;}
.STYLE5 {font-family: "黑体"; font-weight: bold; color:white;}
-->
</style>
</head>
<body>
<h1>增加车辆信息</h1>
<div class="box">
<form action="adminsuccess.jsp"  method="post">
  <table width="1000" height="397" align="center">
    <tr>
      <td height="391"><table width="338" align="center">
        <tr  height="20">
          <td height="40"  colspan="2"><span class="STYLE5">车辆名称：</span>
            <input type="text" name="carname"></td>
        </tr>
        <tr>
          <td height="31" colspan="2"><span class="STYLE5">品牌名称：</span>
            <input type="text" name="brand"></td>
        </tr>
        <tr>
          <td height="36" colspan="2"><span class="STYLE5">车辆类型：</span>
            <input type="text" name="type"></td>
        </tr>
        <tr>
          <td height="31" colspan="2"><span class="STYLE5"> 价 &nbsp;&nbsp;格 ：  </span>
            <input type="text" name="price"></td>
        </tr>
        <tr>
          <td height="42" colspan="2"><span class="STYLE5">颜  &nbsp;&nbsp;色 ： </span>
            <input type="text" name="color"></td>
        </tr>
        <tr>
          <td colspan="2"><span class="STYLE5">库 &nbsp;&nbsp;存 ：  </span>
            <input type="text" name="amount"></td>
        </tr>
        <tr>
          <td height="87" colspan="2"><div align="center">
            <input type="submit" class="sub" name="submit" value="提交">
            <input type="reset" name="reset" class="sub" value="取消">
          </div></td>
        </tr>
      </table>
      <p align="center"><a href="adminshow.jsp" class="STYLE2">返回上一页</a></p>
      <p align="center">&nbsp;</p></td>
    </tr>
  </table>
  <p align="center"><a href="adminsuccess.jsp"></a></p>
</form>
</div>
      <div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 5px;"></div>
<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
</div> 
</body>
</html> 