<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@ page import="java.sql.*,java.util.*,java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>提交审核</title>
</head>
<body>
<jsp:useBean id="db" class="pkg.connection" scope="page" />
<%
		request.setCharacterEncoding("UTF-8");
	    String submit = request.getParameter("submit");
	    String submit2 = request.getParameter("submit2");
	    String fpbm = request.getParameter("fpbm");
	    String NO = (String)session.getAttribute("NO").toString();
	    String shyj = request.getParameter("yj");
	    
	    if(submit != null && !submit.equals(""))
	    {
	    	ResultSet rs = db.executeQuery("update tb_Comand set SHstate=1,XSstate = 1,fpbm='"+fpbm+"' where NO = '" + NO + "'");
	    	out.println("<script language='javaScript'> alert('该项审核通过!');top.location.href='../index_xssh.jsp';</script>");
	    }
	    if(submit2 != null && !submit2.equals(""))
	    {
	    	ResultSet rs = db.executeQuery("update tb_Comand set SHstate=1,XSstate = 0,shyj='"+shyj+"' where NO = '" + NO + "'");
	    	out.println("<script language='javaScript'> alert('该项审核未通过!');top.location.href='../index_xssh.jsp';</script>");
	    }
	%>
</body>
</html>