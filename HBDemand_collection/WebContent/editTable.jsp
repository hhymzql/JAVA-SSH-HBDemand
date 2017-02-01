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
        String NO = (String)session.getAttribute("NO");
		String submit = request.getParameter("submit");
		String submit1 = request.getParameter("submit1");
		String username = (String)session.getAttribute("username_c");
		String ID = (String)session.getAttribute("ID");
		String gov = request.getParameter("gov");
		String areaplace = request.getParameter("area");
		String Tecname_mg = request.getParameter("Tecname_mg");
		String cmadName = request.getParameter("cmadName");
		String minyear = request.getParameter("minyear");
		String maxyear = request.getParameter("maxyear");
		
		String Comand_mg1 = request.getParameter("Comand_mg1");
		String Comand_mg2 = request.getParameter("Comand_mg2");
		String Comand_mg3 = request.getParameter("Comand_mg3");
		
		String keyword1 = request.getParameter("keyword1");
		String keyword2 = request.getParameter("keyword2");
		String keyword3 = request.getParameter("keyword3");
		String keyword4 = request.getParameter("keyword4");
		String keyword5 = request.getParameter("keyword5");
		String nimoney = request.getParameter("nimoney");
		
		String cmadModel = request.getParameter("cmadModel");
		String corrComp = request.getParameter("corrComp");
		
		//基础研究属性
		String subjectKind = request.getParameter("subjectKind");
		String sec = request.getParameter("sec");
		String thi = request.getParameter("thi");
		String fst = "";
		if(thi==null)
		{
			fst = sec;
		}
		else
		{
			fst = thi;
		}
	
		//非基础研究属性
		String areaKind = (request.getParameter("areaKind1")+request.getParameter("areaKind2")+request.getParameter("areaKind3")+request.getParameter("areaKind4")+request.getParameter("areaKind5")
						+request.getParameter("areaKind6")+request.getParameter("areaKind7")+request.getParameter("areaKind8")+request.getParameter("areaKind9")+request.getParameter("areaKind10")).replaceAll("null", "");
		String sec_h = request.getParameter("sec_h");
		String thi_h = request.getParameter("thi_h");
		String useKind = "";
		if(thi_h==null)
		{
			useKind = sec_h;
		}
		else
		{
			useKind = thi_h;
		}
		
		if (submit1 != null && !submit1.equals("")&&ID != null && !ID.equals("")
				&&username != null && !username.equals(""))
		{
			int TJstate=1;
			String sql1="update tb_Comand set gov ='"+gov+"',areaplace ='"+areaplace+"',Tecname_mg ='"+Tecname_mg+"',cmadName ='"
		+cmadName+"',minyear ="+minyear+",maxyear ="+maxyear+",Comand_mg1 ='"+Comand_mg1+"',Comand_mg2 ='"+Comand_mg2+"',Comand_mg3 ='"
			+Comand_mg3+"',keyword1 ='"+keyword1+"',keyword2 ='"+keyword2+"',keyword3 ='"+keyword3+"',keyword4 ='"+keyword4+"',keyword5 ='"
		+keyword5+"',nimoney ='"+nimoney+"',areaKind ='"+areaKind+"',useKind ='"+useKind+"',xuekeKind ='"+fst+"',cmadModel ='"+cmadModel+"',corrComp ='"
			+corrComp+"',TJstate="+TJstate+"";
			
			int i = db.executeUpdate(sql1);
			if(i==1){
				out.println("<script language='javaScript'> alert('修改成功!');top.location.href='index_user.jsp';</script>");
			}else {
				out.println("<script language='javaScript'> alert('修改失败!');top.location.href='index_user.jsp';</script>");
				response.setHeader("refresh", "1;url=fillin.jsp");
			} 
			db.close();
		 }
		if (submit != null && !submit.equals("")&&ID != null && !ID.equals("")
				&&username != null && !username.equals(""))
		{
			String sql1="delete from tb_Comand where NO='"+NO+"')";
			int i = db.executeUpdate(sql1);
			if(i==1){
				out.println("<script language='javaScript'> alert('删除成功!');top.location.href='index_user.jsp';</script>");
			}else {
				out.println("<script language='javaScript'> alert('删除失败!');top.location.href='index_user.jsp';</script>");
				response.setHeader("refresh", "1;url=fillin.jsp");
			} 
			db.close();
		 }
	%>
</body>
</html>