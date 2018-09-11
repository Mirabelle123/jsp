<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" errorPage="" %> 
<% 
  String username = request.getParameter("username"); 
  String password = request.getParameter("password1");
  String question = request.getParameter("question"); 
  String answer = request.getParameter("answer");
%>
<html>
  <head>
    <title>处理用户注册信息</title>
  </head>
    <style>
	body {
	background: url(img/logback.jpg);
}
.STYLE1 {color: white;}
	h1{
		font-size:30px;
		font-family:"华文仿宋", "华文宋体", "华文中宋", "仿宋", "新宋体", "宋体";
		text-align:center;
		padding-top:100px;
		padding-bottom:30px;
	}
	.box{
		text-align:center;
	padding-bottom:20px;
	}
	</style>
      <link rel="stylesheet" type="text/css" href="css/banquan.css" />
  <body>
    <h1>处理用户注册信息</h1>
    <div class="box">
<%  
  try
  {
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=cars","sa","123456"); 
    Statement stmt = con.createStatement(); 
    String sql = "select * from dbo.users where username='" + username + "'"; 
    ResultSet rs =  stmt.executeQuery(sql); 
    if (rs.next())
    {        out.print("<p>对不起！您用的用户名已经存在。请另取其他名。<//p>"); 
        out.print("<p><a href=\"register.html\">返回注册页面<//a><//p>"); 
    } 
    else
    {      sql = "insert into dbo.users (username, password, question, answer) values('"+ username + "','" + password + "','" + question + "','" + answer +"')";
      int updateNumber = stmt.executeUpdate(sql);//返回所更新的记录条数
      out.print("<p>" + username + "：谢谢您！您已经成功注册。欢迎您随时登录。<//p>");
    } 
    rs.close();
    stmt.close();
    con.close();
  }
  catch(SQLException e)
  {
    out.print(""+e);
  } 
%>  
</div>
    <p style="text-align:center"><a href="../cars/index.jsp" class="STYLE1">返回首页</a></p>
     <div style="width: auto;border: 0.5px solid whitesmoke; margin-top:200px;"></div>
<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
</div>
  </body>
</html>
