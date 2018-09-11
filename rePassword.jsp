<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="SQLBean" class="bean.SQLBean" scope="page"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
<style>
body{
	background: url(img/logback.jpg);
}
.box{
	text-align:center;
	padding-bottom:200px;
color:white;}
	h1{
		font-size:30px;
		font-family:"华文仿宋", "华文宋体", "华文中宋", "仿宋", "新宋体", "宋体";
		text-align:center;
		padding-top:100px;
		padding-bottom:30px;
color:white;
		}
		#submit{
			color:white;
	background: url(/img/search.jpg) no-repeat fixed center;}
	#reset{
		color:white;
	background: url(/img/search.jpg) no-repeat fixed center;}
</style>
 <link rel="stylesheet" type="text/css" href="css/banquan.css" />
   <script type="text/javascript">
    <!--
 function check()
      {
        if ( document.getElementById("username").value == "" )
        {
          alert("用户名不能为空！");
          return false;
        }
        if ( document.getElementById("password1").value == "" )
        {
          alert("密码不能为空！");
          return false;
        }
        if ( document.getElementById("password2").value == "" )
        {
          alert("确认密码不能为空！");
          return false;
        }
        if ( document.getElementById("password1").value != document.getElementById("password2").value )
        {
          alert("两次密码输入不一致！请重新输入。");
          return false;
        }
		}
		//-->
		</script>
        </head>
<body>
<h1>修改密码</h1>
<div class="box">
<form action="rePassword.jsp" method="post" name="form1" id="form1" onSubmit="return check()">
      <p>
        <label for="username" style="color:white;">用　　户　　名：</label>
        <input type="text" name="username" id="username">
      </p>
      <p>
        <label for="password1" style="color:white;">密　　　　　码：</label>
        <input type="password" name="password1" id="password1">
      </p>
      <p>
        <label for="password2" style="color:white;">确　认　密　码：</label>
        <input type="password" name="password2" id="password2">
      </p>
       <p>
      　　　<input type="submit" name="submit" id="submit" value="提交">
  　　　　　<input type="reset" name="reset" id="reset" value="重置">
      </p>
      </form>
 <%
        String username = request.getParameter("username");
        String password = request.getParameter("password1");
        SQLBean.OpenConn();
        ResultSet rs=null;
        String sql="update users set password='"+password+"' where username='"+username+"'";
        SQLBean.executeUpdate(sql);
        if(password!=null){
       
      out.print("<script>alert('您还没有登录，请登录...'); window.location='login.jsp' </script>");
        }
        %>   
      </div>  
      <div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 5px;"></div>
<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
 </div>
</body>  
  
</html>
