<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="SQLBean" class="bean.SQLBean" scope="page"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"; charset="utf-8">
<title>登录</title>
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
        } 
        if ( document.getElementById("cheeckcode").value == "" )
        {
          alert("验证码不能为空！");
          return false;
        }}
    //-->
 
    function refresh() {  
        //IE存在缓存,需要new Date()实现更换路径的作用  
        document.getElementById("image").src="image.jsp?"+new Date();  
    }  

    </script>
    <link rel="stylesheet" type="text/css" href="css/banquan.css" />
<style type="text/css">
<!--
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
#Layer2 {
	position:absolute;
	width:182px;
	height:49px;
	z-index:2;
	left: 580px;
	top: 114px;
}
.STYLE1 {font-size: 36px}
.STYLE2 {
	color: #FFFFFF;
}
body,td,th {
	color: #FFFFFF;
}
.login{
	background:url(img/login.jpg);
	margin-top: 10px;
	margin-right: 400px;
	margin-left: 400px;
	margin-bottom: 20px;
	padding: 10px;
}
h1{
	font-size:28px;
	font-family:"仿宋";
	font-color:#A7ABAA;
	padding-top:80px;
	margin-botttom:50px;
	}
-->
</style>
</head>
<body>
<h1 align="center">请填写登录信息</h1>
    <form id="form1" action="check.jsp"  name="form1" method="post" onSubmit="return check()">
      <div class="login" align="center">
        <table width="25%" height="30" border="0" align="center">
          <tr>
            <td><label for="textfield">登录账号:</label>
                <input type="text" name="username" id="username"></td>
          </tr>
          <tr>
            <td><label for="textfield2">登录密码:</label>
                <input type="password" name="password" id="password"></td>
          </tr>
<td height="67"><span>
      <label for="code" style="width:64px;height:32px;display:inline-block;line-height:32px;"> 验证码:</label>
      <input name="checkcode" type="text"   id="checkcode" style="width:80px"/>
      <img id="image" border="0"  onclick="refresh()" src="image.jsp" title="点击更换图片"> 
</span></td></tr><br/>
        </table>
        <p>
          <input type="reset" name="reset" id="reset" value="取消">
          <input type="submit" name="submit" id="submit" value="登录">
        </p>  
      </div>
    </form>
     <p>&nbsp;</p>
     <p  style="text-align:center"><a href="retrievePassword.jsp" class="STYLE2">忘记密码 </a></p>
        <p  style="text-align:center"><a href="index.jsp" class="STYLE2">返回主页</a></p>
        <p>&nbsp;</p>
<div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 5px;"></div>
<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
</div>
</body>
</html>