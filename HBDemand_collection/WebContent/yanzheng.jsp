<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录中</title>
</head>
<body>
<jsp:useBean id="db" class="pkg.connection" scope="page" />
	<%
		session.setAttribute("username", null);
		request.setCharacterEncoding("UTF-8");

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String YanZheng = request.getParameter("YanZheng");
		String rand = (String)session.getAttribute("rand");
		
		if(username.equals(""))
		{
			out.println("<script language='javaScript'> alert('用户名不能为空！');</script>");
			response.setHeader("refresh", "1;url=login.jsp");
		}
		
		else if(password.equals(""))
		{
			out.println("<script language='javaScript'> alert('密码不能为空！');</script>");
			response.setHeader("refresh", "1;url=login.jsp");
		}
		
		else if(YanZheng.equals(""))
		{
			out.println("<script language='javaScript'> alert('验证码不能为空！');</script>");
			response.setHeader("refresh", "1;url=login.jsp");
		}
		
		else if(!YanZheng.equals(rand))
		{
			out.println("<script language='javaScript'> alert('验证码输入错误！');</script>");
			response.setHeader("refresh", "1;url=login.jsp");
		}
		
		else {

		if (password != null && !password.equals("")
				&&username != null && !username.equals("")&&YanZheng != null && !YanZheng.equals(""))
		{
			String sql="select count(*) num1 from  tb_user where userName='"+username+"'and"+" password='"+password+"'";
			ResultSet rs=db.executeQuery(sql);
			
			int num=0;
			while(rs.next()){
				num=rs.getInt("num1");
			}
			if(num!=0){
				response.setHeader("refresh", "1;url=index_user.jsp");
				session.setAttribute("username_c", username);
			} else{
				int num1=0;
				String sql1="select count(*) num2 from sys_user where username='"+username+"'and"+" password='"+password+"'";
				ResultSet rs1=db.executeQuery(sql1);
				String department="";
				String fpbm="";
				
				while(rs1.next()){
					num1=rs1.getInt("num2");
				}
				if(num1==0){
					out.println("<script language='javaScript'> alert('登录失败,用户名或密码错误！请改正或注册');</script>");
					response.setHeader("refresh", "1;url=login.jsp");
				}
				else{
					String sql2="select * from sys_user where username='"+username+"'and"+" password='"+password+"'";
					ResultSet rs2=db.executeQuery(sql2);
					rs2.next();
					department=rs2.getString(6);
					fpbm=rs2.getString(7);
					
					if(department.indexOf("D")!=-1){
						response.setHeader("refresh", "1;url=index_xssh.jsp");
						session.setAttribute("username_c", username);
					}
					else{
						response.setHeader("refresh", "1;url=index_jssh.jsp");
						session.setAttribute("username_c", username);
						session.setAttribute("fpbm", fpbm);
					}
				}
			}
			rs.close();
			db.close();	
		}
		}
	%>
</body>
</html>