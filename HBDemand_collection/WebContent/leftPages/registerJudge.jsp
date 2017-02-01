<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>注册中</title>
</head>
<body>
<jsp:useBean id="db" class="pkg.connection" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
		String submit = request.getParameter("submit");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String surepsw = request.getParameter("surepsw");
		String ID = request.getParameter("ID");
		String postalAdds = request.getParameter("postalAdds");
		String webAdds = request.getParameter("webAdds");
		String lawPeople = request.getParameter("lawPeople");
		String contacts = request.getParameter("contacts");
		String email = request.getParameter("email");
		String postNum = request.getParameter("postNum");
		String cellphone = request.getParameter("cellphone");
		String telephone = request.getParameter("telephone");
		String faxAds = request.getParameter("faxAds");
		String InstSx = request.getParameter("InstSx");
		
		session.setAttribute("username_c", userName);
		if (submit != null && !submit.equals("")&&password != null && !password.equals("")
				&&userName != null && !userName.equals("")&&surepsw != null && !surepsw.equals(""))
		{
			int num=0;
			String sql="select count(*) num from  tb_user where userName='"+userName+"'";
			ResultSet rs=db.executeQuery(sql);
			while(rs.next())
			{
				num=rs.getInt("num");
			} 
			if(num!=0)
			{
				out.println("<script language='javaScript'> alert('此用户已存在，请重新填写用户名！');</script>");
				response.setHeader("refresh", "1;url=register.jsp");
			}
			else
			{
				String sql1="insert into tb_user(userName,password,ID,postalAdds,webAdds,lawPeople,contacts,email,postNum,telephone,cellphone,faxAds,InstSx) values('" + 
			userName + "','" + password  + "','"+ ID +"','"+ postalAdds +"','"+ webAdds +"','"+ lawPeople +"','"+ contacts +"','"+ email +"','"+ postNum +"','" + telephone  + "','" + cellphone  + "','" + faxAds  + "','" + InstSx  + "')";
				int i = db.executeUpdate(sql1);
				if(i==1){
					out.println("<script language='javaScript'> alert('注册成功，请登录');top.location.href='../login.jsp';</script>");
					session.setAttribute("username", userName);
				}else {
					out.println("<script language='javaScript'> alert('注册失败!');</script>");
					response.setHeader("refresh", "1;url=zhuce.jsp");
				} 
				db.close();
			}
		}
	%>
</body>
</html>