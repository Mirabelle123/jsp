<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="SQLBean" class="bean.SQLBean" scope="page"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"	+ request.getServerName() + ":" + request.getServerPort()	+ path + "/";
%>

<html>
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
#sub{
	color:white;
	background: url(/img/search.jpg) no-repeat fixed center;
	}
	.box{
		color:white;}
-->
</style>
<link rel="stylesheet" type="text/css" href="css/banquan.css" />
<title>登录验证</title>
</head>
<body>
<table width="1000" height="458" align="center">
                  <tr>
                    <td height="202"></td>
                  </tr>
                  <tr>
                    <td height="195"><table height="50" align="center">
                     <div class="box" align="center"> 
					
                    <script type="text/javascript">  
 
   function different(){  
        alert("请输入正确的验证码");  
        location.href = "login.jsp";  
    }  
</script>  
               <% String username=request.getParameter("username");
   String password=request.getParameter("password");
String sql="select * from users";
 
 String rand = session.getAttribute("code").toString();  
String input = request.getParameter("checkcode");  

SQLBean.OpenConn();
ResultSet rs=SQLBean.executeQuery(sql);
int check=0;
while(rs.next()){
if(username.equals(rs.getString("username"))&&password.equals(rs.getString("password"))){
check=1;}
 }
		if(check==1){
			
        if(rand.equals(input)){  
            out.print("<script language='javascript'>same();</script>");  
			%>
			  
              <P >登录成功</p >
              <p><form action="<%=path%>/login" method="post">
				<input type="hidden" name="userName" value=<%=username%>><br>
				<input type="hidden" name="password" value=<%=password%>><br> 
				<input	type="submit" value="确定">
		 </form></p >
			
			<%
			
			 
        }else{  
            out.print("<script language='javascript'>different();</script>");  
        }  
 
	
	}
	else
	{out.print("您的账号或密码不正确！");%>
                     <p><a href="login.jsp">请重新登录</ a></p >
                      <%}
	%></div>
                      <%rs.close();
				SQLBean.closeStmt();
				SQLBean.closeConn();
				%>     
                    
                    
                    
                    </table></td>
                  </tr>
                </table>
          <div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 28px;"></div>
     <div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
	  </div>
</body>
</html> 