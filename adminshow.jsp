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
	padding-bottom: 30px;
	padding-top:40px;
}
#Layer1 {
	position:absolute;
	width:44px;
	height:20px;
	z-index:1;
	left: 1003px;
	top: 226px;
}
.sub{
	color:white;
	background: url(/img/search.jpg) no-repeat fixed center;
	}
.STYLE1 {color:white;}
.STYLE4 {font-family: "黑体"; font-weight: bold; color:white;}
-->
</style>
</head>

<body>
<h1>车辆信息管理</h1>
<div align="center">
  <table width="1200" height="600" align="center">
      <form action="adminsearch.jsp"  method="post">
        <div align="center">
          <hr>
        </div>
      </form>
        <table width="600" height="100" align="center">
          <tr align="center">
            <td width="250"><span class="STYLE4">车辆名称</span></td>
            <td width="250"><span class="STYLE4">品牌名称</span></td>
            <td width="250"><span class="STYLE4">车辆类型</span></td>
            <td width="200"><span class="STYLE4">价格</span></td>
            <td width="200"><span class="STYLE4">颜色</span></td>
            <td width="200"><span class="STYLE4">库存</span></td>
            <td width="200"></td>
          </tr>
          <%
     SQLBean.OpenConn();

     int intPageSize;
     int intRowCount;
     int intPageCount;
     int intPage;
     int i;
     intPageSize=2;
     String strPage;
     strPage=request.getParameter("page");
  if(strPage==null){
  intPage=1;
    }
     else{
      intPage=Integer.parseInt(strPage);
      if(intPage<1)
      intPage=1;
      }
      String sql="select * from car";
      ResultSet rs=SQLBean.executeQuery(sql);
      rs.last();
      intRowCount=rs.getRow();
      intPageCount=(intRowCount+intPageSize-1)/intPageSize;
      if(intPage>intPageCount)
         intPage=intPageCount;
          if(intPageCount>0){
         rs.absolute((intPage-1)*intPageSize+1);
         i=0;
         String xb;
         int j;
         while(i<intPageSize&&!rs.isAfterLast()){
     %>
          <tr>
            <td><div align="center" style="color:white"><%=rs.getString("carname")%></div></td>
            <td><div align="center" style="color:white"><%=rs.getString("brand")%></div></td>
            <td><div align="center" style="color:white"><%=rs.getString("type")%></div></td>
            <td><div align="center" style="color:white"><%=rs.getString("price")%></div></td>
            <td><div align="center" style="color:white"><%=rs.getString("color")%></div></td>
            <td><div align="center" style="color:white"><%=rs.getString("amount")%></div></td>
           
               
            <td><a href="adminmessage.jsp?test=<%=rs.getString("id")%>" class="STYLE1">查看详情</a></td>
          </tr>
          <%
                rs.next();
                i++;
                }
                }
                %>
        </table>
      <p style="text-align:center; color:white;">第<%=intPage%>页&nbsp;&nbsp;&nbsp;共<%=intPageCount%>页&nbsp;&nbsp;&nbsp;
        <%
 if(intPage>1){
 %>
        <a href="adminshow.jsp?page=<%=intPage-1%>" class="STYLE1">上一页</a>
        <%}
 
 
 if(intPage<intPageCount){
 %>
        <a href="adminshow.jsp?page=<%=intPage+1%>" class="STYLE1">下一页</a>&nbsp;&nbsp;&nbsp;
        <%}%>
        <%rs.close();
				SQLBean.closeStmt();
				SQLBean.closeConn();
				%>
</p>
      <p align="center">&nbsp;</p></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</div>
 <p style="text-align:center; font-size:16px;"><a href="adminadd.jsp" class="STYLE1" >增加</a> <a href="index.jsp"  class="STYLE1">返回主页</a></p>
<div style="width: auto;border: 0.5px solid whitesmoke; margin-top: 80px;"></div>
<div class="footer">
		    <p></p>
			<p >版权信息</p>
			<p >Copyright © 2018 Adobe Systems Incorporated. All rights reserved.</p>
</div> 
</body>

</html>

