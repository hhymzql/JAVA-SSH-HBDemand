<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改用户信息</title>
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
	<%
		request.setCharacterEncoding("UTF-8");
	    String username = (String)session.getAttribute("username_c");
		ResultSet rs = db.executeQuery("select * from tb_user where userName = '" + username + "'");
		rs.next();
	%>
	<form action="updateuser.jsp" method="post">
	<div align="left" style="margin-top:50px">修改用户信息</div>
		<table class="STYLE2" align="center" style="margin-top:20px;margin-bottom:50px">
			<tr>
				<th width="30%">用户名：</th>
				<td width="70%"><input name="username" type="text" 
				value="<%=rs.getString(1)%>"></td>
			</tr>
			<tr>
				<th width="30%">登录密码：</th>
				<td width="70%"><input name="password" type="text" 
				value="<%=rs.getString(2)%>"></td>
			</tr>
			<tr>
				<th width="30%">通讯地址：</th>
				<td width="70%"><input name="postalAdds" type="text"
				value="<%=rs.getString(4)%>"></td>
			</tr>
			<tr>
				<th width="30%">公司网址：</th>
				<td width="70%"><input name="webAdds" type="text"
				value="<%=rs.getString(5)%>"></td>
			</tr>
			<tr>
				<th width="30%">法人代表：</th>
				<td width="70%"><input name="lawPeople" type="text"
				value="<%=rs.getString(6)%>"></td>
			</tr>
			<tr>
				<th width="30%">联系人姓名：</th>
				<td width="70%"><input name="contacts" type="text"
				value="<%=rs.getString(7)%>"></td>
			</tr>
			<tr>
				<th width="30%">电子邮箱：</th>
				<td width="70%"><input name="email" type="text"
				value="<%=rs.getString(8)%>"></td>
			</tr>
			<tr>
				<th width="30%">邮政编码：</th>
				<td width="70%"><input name="postNum" type="text"
				value="<%=rs.getString(9)%>"></td>
			</tr>
			<tr>
				<th width="30%">手机号码：</th>
				<td width="70%"><input name="cellphone" type="text"
				value="<%=rs.getString(10)%>"></td>
			</tr>
			<tr>
				<th width="30%">座机号码：</th>
				<td width="70%"><input name="telephone" type="text"
				value="<%=rs.getString(11)%>"></td>
			</tr>
			<tr>
				<th width="30%">传真号码：</th>
				<td width="70%"><input name="faxAds" type="text"
				value="<%=rs.getString(12)%>"></td>
			</tr>
			<tr>
				<th>机构属性：<%=rs.getString(13) %></th>
				<td><input type="radio" name="InstSx" value="企业"/>企业 &nbsp;
                <input type="radio" name="InstSx" value="高等院校" />高等院校 &nbsp;
                <input type="radio" name="InstSx" value="高等院校" />研究机构 &nbsp;
                <input type="radio" name="InstSx" value="高等院校" />其他 &nbsp;</td>
			</tr>
			<tr>
				<th colspan="2"><input type="hidden" name="username" style="margin-right: 40px"value="<%=username%>">
					<input type="submit" value="修改" style="margin-right: 40px"> <input type="reset"
					value="重置"></th>
			</tr>
		</table>
	</form>
</body>
</html>