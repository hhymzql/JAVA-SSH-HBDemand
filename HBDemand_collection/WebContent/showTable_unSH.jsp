<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>未审核的征集表</title>
</head>
<style type="text/css">
<!--
 .STYLE1 {
	font-family: "楷体";
	font-size: 18px;
	color: #666666;
	font-weight: bold;
}
 .STYLE2 {
	font-family: "楷体";
	font-size: 16px;
	color: #000000;
}
-->
</style>
<body>
<jsp:useBean id="db" class="pkg.connection" scope="page" />
	<div align="left" style="margin-top:50px">未审核的征集表信息</div>
		<table class="STYLE2" border="1" align="center" cellpadding="4" cellspacing="0" style="margin-top:20px;margin-bottom:50px">
			<tr>
				<th>需求编号</th>
				<th>需求名称</th>
				<th>关键字</th>
				<th>审核状态</th>
				<th>操作</th>
			</tr>
	<%
		request.setCharacterEncoding("UTF-8");
	    String username = (String)session.getAttribute("username_c");
	    int SHstate=0;
	    int TJstate=1;
		ResultSet rs = db.executeQuery("select * from tb_Comand where SHstate = '" + SHstate + "'and TJstate ="+TJstate+" and userName='"+username+"'");
		rs.next();
		String SHstate1="未审核";
		
		while(rs.next()){
	    	out.println("<tr><td>"+rs.getString(2)+"</td><td>"+rs.getString(7)
	    	+"</td><td>"+rs.getString(13)+rs.getString(14)+rs.getString(15)+rs.getString(16)+rs.getString(17)
	    	+"</td><td>"+SHstate1+"</td><td><a href='showTable.jsp?NO="+rs.getString(2)
	    	+"'>查看</a></td></tr>");
	    }
	    rs.close();
	    db.close();
	%>
	</table>
</body>
</html>