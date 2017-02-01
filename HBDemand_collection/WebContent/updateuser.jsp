<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="db" class="pkg.connection" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
	    String username = (String)session.getAttribute("username_c").toString();
		String username_u = request.getParameter("username");
		String password = request.getParameter("password");
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
		String sql = "update tb_user set userName = '" +username_u + "',password ='"
		       + password +  "',postalAdds ='" + postalAdds + "',webAdds ='"
				       + webAdds +  "',lawPeople ='"
						       + lawPeople +  "',contacts ='"
								       + contacts +  "',email ='"
										       + email +  "',postNum ='"
												       + postNum +  "',cellphone ='"
														       + cellphone +  "',telephone ='"
																       + telephone +  "',faxAds ='"
																		       + faxAds +  "',InstSx ='"
																				       + InstSx +  "'"+" where userName ='" + username +"'";
		int i = db.executeUpdate(sql);
		if (i == 1) {
			out.println("<script language='javaScript'> alert('修改成功，点击确定后自动跳到主页。');</script>");
			response.setHeader("refresh", "1;url=temp/open.jsp");
		}else{
			out.println("<script language='javaScript'> alert('修改失败，点击确定后自动跳到主页。');</script>");
			response.setHeader("refresh", "1;url=temp/open.jsp");
		}
		db.close();
	%>
</body>
</html>