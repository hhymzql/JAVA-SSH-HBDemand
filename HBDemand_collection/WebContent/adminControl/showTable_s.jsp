<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@ page import="java.sql.*,java.util.*,java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>审核中</title>
<script language="javascript">
function gbcount(message,total,used,remain) //限制文本域字数
{
	var max;
	max = total.value;
	if (message.value.length > max)
	{
		message.value = message.value.substring(0,max);
		used.value = max;
		remain.value = 0;
		alert("留言不能超过 200 个字!"); 
    } 
    else {
    	used.value = message.value.length;
    	remain.value = max - used.value;
    	} 
} 
function star()
{
	if (document.getElementById("yj").value == "") {
		window.alert("请填写审核意见！");		
		document.getElementById("yj").focus();
		return false;
	}	
}
</script>
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
<form action="shenhe_xs.jsp" method="post" name="collectform" onsubmit = "return star();">
<jsp:useBean id="db" class="pkg.connection" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
	    String NO = request.getParameter("NO");
	    session.setAttribute("NO", NO);
		ResultSet rs1 = db.executeQuery("select * from tb_Comand where NO = '" + NO + "'");
		rs1.next();
	%>
<table border="1" align="center" cellpadding="4" cellspacing="0">
  <tr>
    <td width="148">机构全称</td>
    <td width="235"><%=rs1.getString(1)%></td>
    <td width="148">组织机构代码</td>
    <td width="235"><%=rs1.getString(3)%></td>
  </tr>
  <tr>
    <td >归口管理部门 </td>
    <td><%=rs1.getString(4)%></td>
    <td>所在地域</td>
    <td><%=rs1.getString(5)%></td>
  </tr>
  <tr>
    <td>机构简介<i class="red">*</i></td>
    <td colspan="3"><%=rs1.getString(6)%></td>
  </tr>
  <tr>
    <td>技术需求名称<i class="red">*</i> </td>
    <td><%=rs1.getString(7)%></td> 
	<td>需求年限 </td> 
	<td><%=rs1.getString(8)%>-<%=rs1.getString(9)%></td>
  </tr>
  <tr>
	<td colspan="4">需求概述(共3方面 限1500字)<i class="red">*</i>
  </tr>
  <tr>
    <td>1.主要问题</td>
	<td colspan="3"><%=rs1.getString(10)%></td>
  </tr>
  <tr>
	<td>2.技术关键 </td>
	<td colspan="3"><%=rs1.getString(11)%></td>
  </tr>
  <tr>
    <td>3.预期目标</td>
    <td colspan="3"><%=rs1.getString(12)%></td>
  </tr>
  <tr>
    <td>关键字 <i class="red">*</i>（不得少于一个,不得多于五个）</td>
    <td colspan="3"><%=rs1.getString(13)+" "%><%=rs1.getString(14)+" "%><%=rs1.getString(15)+" "%>
    <%=rs1.getString(16)+" "%><%=rs1.getString(17)+" "%></td>
  </tr>
  <tr>
    <td>拟投入自有资金</td>
    <td colspan="3"><%=rs1.getString(18)%>万元</td>
  </tr>
  <tr>
    <td>技术需求解决方式  <i class="red">*</i></td>
	<td><%=rs1.getString(22)%></td>
    <td>合作意向单位</td>
    <td><%=rs1.getString(23)%></td>
  </tr>
  <tr>
    <td>科技活动类型<i class="red">*</i></td>
    <td colspan="3"><%=rs1.getString(3)%></td>
  </tr>
  <tr>
    <td>学科分类<i class="red">*</i></td>
	<td colspan="3"><%=rs1.getString(21)%></td>
  </tr>
  <tr>
    <td>需求技术所属领域  <i class="red">*</i></td>
    <td colspan="3"><%=rs1.getString(20)%></td>
  </tr>
  <tr>
    <td>需求技术应用行业<i class="red">*</i> </td>
	<td colspan="4"><%=rs1.getString(19)%></td>
  </tr>
  <tr>
  	<td >所属管理部门<i class="red">*</i> </td>
    <td colspan="3"><select name="fpbm">  
			    <% 
		    	    ResultSet rs=db.executeQuery("select BMname from tb_FPdepartment");
					while(rs.next()){
    			%>
			    <option> <%=rs.getString("BMname") %><% }%>></option>
        </select></td>
  </tr>
  <tr>
    <td>审核意见<i class="red">*</i> </td>
	<td colspan="4" >
		<textarea name="yj" id="yj" placeholder="（请填写审核意见）" onKeyDown="gbcount(yj,total2,used2,remain2);" 
            onKeyUp="gbcount(yj,total2,used2,remain2);"  style="height:80px; width:450px"></textarea>
        <p>最多字数：<input disabled maxLength="4" name="total2" size="3" value="200" class="inputtext"> 
               已用字数： <input disabled maxLength="4" name="used2" size="3" value="0" class="inputtext"> 
               剩余字数： <input disabled maxLength="4" name="remain2" size="3" value="200" class="inputtext"></p>
	</td>
  </tr>
  <tr align="center">
  <td colspan="4"><input type="submit" name="submit" value="同意" style="margin-top:20px; margin-right:70px;color:#cc3300 ">
			<input type="submit" name="submit2" value="不同意" style="margin-top:20px; margin-right:70px;color:#cc3300"></td>
  </tr>
</table>
</form>
</body>
</html>