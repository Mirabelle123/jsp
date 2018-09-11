<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"	+ request.getServerName() + ":" + request.getServerPort()	+ path + "/";
	String username=request.getParameter("userName");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8" />
		<title>主页</title>
		<style>
			*{
				margin:0px;
				padding:0px;
			}
			li{
				list-style: none;
			}
			bb{
				color:white;
				}
			a{
				text-decoration: none;
			}
			body{
				background: black;	
				}

			.b-box{
				color: white;
			}
			.enter ul li{
				float: right;
				padding: 5px 10px;
				padding-right: 20px;
				color: white;
			}
			.enter ul li a{
				color: #fff;
				font-size: 18px;
				font-family:"仿宋";
				line-height: 50px;
				display: block;
				text-align: center;
			}
			.enter a:hover{
				color: gainsboro;
			}
			.img{
				position:relative;
				padding:0;
				color: white;
				text-align:center;
			}
			.search{
				position:relative;
				margin:0px;
				padding-top:180px;
				}
			.nav{
				width:700px;
				overflow: hidden;							
			}
			.nav ul li{
				float:left;
				margin-left: 1px;
				padding: 5px 10px;

			}
			.nav ul li a{
				color: #fff;
				font-size: 25px;
				font-family:"仿宋";
				line-height: 50px;

			}
			.nav a:hover{
				color: gray;
			}
			.nav ul ul{
				display: none;
			}
			.nav li li{
				float: none;
			}
			.nav ul li:hover ul{
				display: block;
				position: absolute;				
			}

		</style>
        <link rel="stylesheet" type="text/css" href="css/banquan.css" />
	</head>
	<body>
		<div class="enter">
			<ul>
				
               <li><bb><c:choose>
		<c:when test="${not empty sessionScope.user}">
    			欢迎你：<%=session.getAttribute("user").toString()%>
                <div id="Layer1"><a href="zhuxiao.jsp">注销</a></div>
	  </c:when>
		
        <c:otherwise>
        	<li><a href="register.html">注册</a></li>
        <li><a href="login.jsp">你还没有登录，请先登录</a></li>
        <li><a href="adminlogin.jsp">管理员登录</a></li>
        		
      </c:otherwise>
      </c:choose></bb></li>
         </ul>
		</div>
		<div class="nav">
			<ul>
				<li><a href="index.jsp">首页</a></li>
				<li><a href="all.html">全部车型</a></li>
				<li><a href="index.jsp">互动中心</a></li>	
				<li><a href="#">售后服务</a></li>	
				<li><a href="#">新闻中心</a>
					<ul>
						<li><a href="#">每日热点</a></li>
						<li><a href="#">行业资讯</a></li>
						<li><a href="#">最新动态</a></li>						
					</ul>
				</li>					
				<li><a href="#">关于我们</a></li>			
			</ul>
		</div>
        <div class="img">
<form action="test.jsp" method="get">
		<div class="search">
		   <lable for="search"> 查找： </lable> 
		   <input id="search" name="search" type="text"/>
		   <button id="search" style="color:white;background: url(/img/search.jpg) no-repeat fixed center;">搜索</button>
		</div></form>
			<img src="img/timg.jpg"/>
		</div>
		
	<div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 28px;"></div>	
	<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
	  </div>
	</body>
</html>