<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="SQLBean" class="bean.SQLBean" scope="page"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"; charset="utf-8">
<title>管理员登录</title>
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<script type="text/javascript">
    <!--
      function check()
      {
        if ( document.getElementById("username").value == "" )
        {
          alert("用户名不能为空！");
          return false;
        }
        if ( document.getElementById("password").value == "" )
        {
          alert("密码不能为空！");
          return false;
        } }
    //-->
    </script>
<style type="text/css">
body {
	background:url(img/logback.jpg);
}
#Layer1 {position:absolute;
	width:54px;
	height:22px;
	z-index:1;
	left: 997px;
	top: 224px;
}
#Layer2 {
	position:absolute;
	width:182px;
	height:49px;
	z-index:2;
	left: 580px;
	top: 114px;
}
.STYLE1 {font-size: 36px}
.STYLE2 {color: white;}
body,td,th {
	color: #FFFFFF;
}
-->
</style></head>

<body>
<h1 align="center"> 管理员登录</h1>
<div class="box">
    <form id="form1" action="admincheck.jsp"  name="form1" method="post" onSubmit="return check()">
      <div align="center">
        <table width="25%" height="30" border="0" align="center">
          <tr>
            <th scope="col"><div align="left">
              <p>请填写登录信息：</p>
            </div></th>
          </tr>
          <tr>
            <td><label for="textfield">登录账号:</label>
                <input type="text" name="adminname" id="adminname"></td>
          </tr>
          <tr>
            <td><label for="textfield2">登录密码:</label>
                <input type="password" name="adminpassword" id="adminpassword"></td>
          </tr>
        </table>
        <p>
          <input type="reset" name="reset" id="reset" value="取消">
          <input type="submit" name="submit" id="submit" value="登录">
        </p>
       
      </div>
    </form>
      <p style="text-align:center"><a href="index.jsp" class="STYLE2">返回主页</a></p>
</div>
<div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 100px;"></div>
<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
</div> 
</body>
</html>