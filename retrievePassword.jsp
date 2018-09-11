<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" errorPage="" %> 
<%@ page import="bean.User" %> 
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>找回密码</title>
    <script type="text/javascript">
    <!--
      function checkusername()
      {
        if ( document.getElementById("username").value == "" )
        {
          alert("用户名不能为空！");
          return false;
        }
      }
      function checkanswer()
      {
        if ( document.getElementById("answer").value == "" )
        {
          alert("答案不能为空！");
          return false;
        }
      }
    //-->
    </script>
    <style>
	body {
	background: url(img/logback.jpg);
}
.STYLE1 {color: white;}
	h1{
                color:white;
		font-size:30px;
		font-family:"华文仿宋", "华文宋体", "华文中宋", "仿宋", "新宋体", "宋体";
		text-align:center;
		padding-top:100px;
		padding-bottom:30px;
	}
	.box{
		text-align:center;
	padding-bottom:20px;
color:white;
	}
	</style>
      <link rel="stylesheet" type="text/css" href="css/banquan.css" />
  </head>
  <body>
    <h1>找回密码</h1>
    <div class="box">
<%
    int state= 0;
    String param = request.getParameter("state");
    if(param != null)
      state = Integer.parseInt(param);
    switch(state){
      case 0:
        {    %>
          <p style="color:white;">请输入您的用户名</p>
          <form id="form1" name="form1" method="post" action="retrievePassword.jsp" onSubmit="return checkusername()">
            <p>
              <input type="text" name="username" id="username">
            </p>
            <input type="hidden" name="state" id="state" value="1" />
            <p>
              <input type="submit" name="submit1" id="submit1" value="提交">
              <input type="reset" name="reset1" id="reset1" value="重置">
            </p>
          </form>
<%
          break;
        }
      case 1: 
        { 
         String username = request.getParameter("username"); 
         try
         {
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=cars","sa","123456"); 
           Statement stmt = con.createStatement(); 
           String sql = "select * from dbo.users where username='" + username + "'"; 
           ResultSet rs =  stmt.executeQuery(sql);
           if (rs.next())
           {
             User user = new User(); 
             user.setUsername(rs.getString("username")); 
             user.setPassword(rs.getString("password")); 
             user.setQuestion(rs.getString("question")); 
             user.setAnswer(rs.getString("answer")); 
             session.setAttribute("user",user);
          %> 
             <form id="form2" name="form2" method="post" action="retrievePassword.jsp"  onsubmit="return checkanswer()">
               <p style="color:white;"><%=user.getUsername() %>您好！您注册时预留的问题是：<%=user.getQuestion() %></p>
               <p>
                 <label for="answer">请填写您预留的答案：</label>
                 <input type="text" name="answer" id="answer">
               </p>
               <input type="hidden" name="state" id="state" value="2" />
               <p>
                 <input type="submit" name="submit2" id="submit2" value="提交">
                 <input type="reset" name="reset2" id="reset2" value="重置">
               </p>
             </form>
<%
           } 
           else
           { 
             session.invalidate();//使session无效
             state = 0;//回到初始状态
             out.print("<p>朋友：您输入的用户名不存在！您再想想？</p>");
             out.print("<p><a href=\"retrievePassword.jsp\">重新开始</a></p>"); 
           } 
           rs.close();
           stmt.close();
           con.close();
         }
         catch(SQLException e)
         {
           out.print(""+e);
         }
         break;
       }
     case 2:
       { 
         String answer = request.getParameter("answer");
         User user = (User)session.getAttribute("user"); 
         if ( user.getAnswer().equals(answer) ) 
         { 
           out.print("<p><a href=\"rePassword.jsp\">修改密码</a></p>");
         }
         else
         { 
           session.invalidate();
           state = 0; 
           out.print("<p>朋友：您的回答错误，不能取回密码。</p>");
           out.print("<p><a href=\"retrievePassword.jsp\">重新开始</a></p>"); 
         }
         break;
       }
    }   
%> 
</div> 
    <p style="text-align:center"><a href="index.jsp" class="STYLE1">返回首页</a></p>
    <div style="width: auto;border: 0.5px solid whitesmoke; margin-top:200px;"></div>
<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
</div>
  </body>
</html>
