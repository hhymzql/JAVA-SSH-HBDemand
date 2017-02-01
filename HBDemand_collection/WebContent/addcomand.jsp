<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@ page import="java.sql.*,java.util.*,java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>需求征集表</title>
</head>
<body>
<jsp:useBean id="db" class="pkg.connection" scope="page" />
	<% 
		request.setCharacterEncoding("UTF-8");
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
		//生成随机字母+日期+随机数的编号
		String NO="";
		String a ="ABCDEFGHJKLMNPQRSTUVWXYZ";
		
		Random rand = new Random();//生成随机数
		Calendar calCurrent = Calendar.getInstance(); 
        int intDay = calCurrent.get(Calendar.DAY_OF_MONTH);  
        int intMonth = calCurrent.get(Calendar.MONTH) + 1;    
        int intYear = calCurrent.get(Calendar.YEAR);
        
        int random = rand.nextInt(9000)+1000;  
		NO+=a.charAt(rand.nextInt(a.length()));
		NO+=intYear;
		NO+=intMonth;
		NO+=intDay;
		NO+=random;		
		
		if (submit != null && !submit.equals("")&&ID != null && !ID.equals("")
				&&username != null && !username.equals(""))
		{
			int num=0;
			String sql="select count(*) num from tb_Comand where cmadName='"+cmadName+"'and userName='"+username+"'";
			ResultSet rs=db.executeQuery(sql);
			while(rs.next())
			{
				num=rs.getInt("num");
			} 
			if(num!=0){
				out.println("<script language='javaScript'> alert('此需求已经填报！请选择不同的技术需求');</script>");
				response.setHeader("refresh", "1;url=fillin.jsp");
			}
			else{
				int TJstate=1;
				String sql1="insert into tb_Comand(NO,ID,userName,gov,areaplace,Tecname_mg,cmadName,minyear,maxyear,Comand_mg1,Comand_mg2,Comand_mg3,keyword1,keyword2,keyword3,keyword4,keyword5,nimoney,areaKind,useKind,xuekeKind,cmadModel,corrComp,TJstate) values('"
			+NO + "','" + ID  + "','" + username  + "','"+ gov +"','"+ areaplace +"','" + Tecname_mg  + "','"+ cmadName +"','" + minyear  + "','" + maxyear  + "','" +Comand_mg1+ "','" +Comand_mg2+ "','" +Comand_mg3+ "','" +keyword1+ "','" +keyword2+ "','" +keyword3+ "','" 
				+keyword4+ "','" +keyword5+ "','" +nimoney+ "','"+ areaKind +"','"+ useKind +"','"+ fst +"','"+ cmadModel +"','"+ corrComp +"',"+TJstate+")";
				int i = db.executeUpdate(sql1);
					if(i==1){
						out.println("<script language='javaScript'> alert('提交成功!');top.location.href='index_user.jsp';</script>");
					}else {
						out.println("<script language='javaScript'> alert('提交失败!');</script>");
						response.setHeader("refresh", "1;url=fillin.jsp");
				    } 
				    db.close();
				}
		 }
		if (submit1 != null && !submit1.equals("")&&ID != null && !ID.equals("")
				&&username != null && !username.equals(""))
		{
			int num=0;
			String sql="select count(*) num from tb_Comand where cmadName='"+cmadName+"'and userName='"+username+"'";
			ResultSet rs=db.executeQuery(sql);
			while(rs.next())
			{
				num=rs.getInt("num");
			} 
			if(num!=0){
				out.println("<script language='javaScript'> alert('此需求已经填报！请选择不同的技术需求');</script>");
				response.setHeader("refresh", "1;url=fillin.jsp");
			}
			else{
				int TJstate=0;
				String sql1="insert into tb_Comand(NO,ID,userName,gov,areaplace,Tecname_mg,cmadName,minyear,maxyear,Comand_mg1,Comand_mg2,Comand_mg3,keyword1,keyword2,keyword3,keyword4,keyword5,nimoney,areaKind,useKind,xuekeKind,cmadModel,corrComp,TJstate,SHstate,BSstate) values('"
			+NO + "','" + ID  + "','" + username  + "','"+ gov +"','"+ areaplace +"','" + Tecname_mg  + "','"+ cmadName +"','" + minyear  + "','" + maxyear  + "','" +Comand_mg1+ "','" +Comand_mg2+ "','" +Comand_mg3+ "','" +keyword1+ "','" +keyword2+ "','" +keyword3+ "','" 
				+keyword4+ "','" +keyword5+ "','" +nimoney+ "','"+ areaKind +"','"+ useKind +"','"+ fst +"','"+ cmadModel +"','"+ corrComp +"',"+TJstate+","+TJstate+","+TJstate+")";
				int i = db.executeUpdate(sql1);
					if(i==1){
						out.println("<script language='javaScript'> alert('保存成功!');top.location.href='index_user.jsp';</script>");
					}else {
						out.println("<script language='javaScript'> alert('保存失败!');</script>");
						response.setHeader("refresh", "1;url=fillin.jsp");
				    } 
				    db.close();
				}
		 }
	%>
</body>
</html>