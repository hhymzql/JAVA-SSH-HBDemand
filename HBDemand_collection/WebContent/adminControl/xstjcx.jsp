<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>未形式审核</title>
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
<div align="center" style="margin-top:50px;margin-bottom:50px">形式审核的征集表信息</div>
	<table>
		<tr>
		  <p>---------------------------------------------------------------选择检索条件--------------------------------------------------------------</p>
		</tr>
		<tr>
		  <td>按研究类型查询：<select name="fenlei" id="fenlei">
      			<option value="基础研究">基础研究</option>
      			<option value="应用研究">应用研究</option>
      			<option value="试验发展">试验发展</option>
      			<option value="究发展与成果应用">研究发展与成果应用</option>
      			<option value="技术推广与科技服务">技术推广与科技服务</option>
      			<option value="生产性活动">生产性活动</option>
    		</select></td>
    		<td>按归口管理部门查询：<select name="gov">  
			    <% 
		    	    ResultSet rs1=db.executeQuery("select govname from govKind");
					while(rs1.next()){
    			%>
			    <option> <%=rs1.getString("govname") %><% }%>></option>
        	</select></td>
        	<td>按所在地域查询：<select name="area">
      			<% 
		    	    ResultSet rs2=db.executeQuery("select areaname from areaKind");
					while(rs2.next()){
    			%>
      			<option> <%=rs2.getString("areaname") %>
        		<% }%></option>
    		</select></td>
		</tr>
		</table>
		<table class="STYLE2" border="1" align="center" cellpadding="4" cellspacing="0" style="margin-top:20px;margin-bottom:50px">
			<tr>
				<th>需求编号</th>
				<th>需求名称</th>
				<th>关键字</th>
				<th>审核状态</th>
				<th>操作</th>
			</tr>
	<%!
	public static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";  
    public static final String USER = "sa";  
    public static final String PASS = "sasa";  
    public static final String URL = "jdbc:sqlserver://localhost:1433; DatabaseName=DemandConnection";  
    public static final int PAGESIZE = 5;  
    int pageCount;  
    int curPage = 1;  
%>  
<% 
try{
    //一页放5个 
    Class.forName(DRIVER);  
    Connection con = DriverManager.getConnection(URL,USER,PASS);  
    String sql = "select NO,cmadName,keyword1,keyword2,SHstate from tb_Comand";
    PreparedStatement stat = con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);  
    ResultSet rs = stat.executeQuery();  
    rs.last();  
 
    int size = rs.getRow();  
    pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  
    String tmp = request.getParameter("curPage");  
    if(tmp==null){  
    	tmp="1";  
    }  
    curPage = Integer.parseInt(tmp);  
    if(curPage>=pageCount)
    	curPage = pageCount;  
      
    boolean flag=rs.absolute((curPage-1)*PAGESIZE+1);
    int count = 0;  
    do{  
        if(count>=PAGESIZE)
         	break; 
        String no = rs.getString(1);  
        String name = rs.getString(2);  
        String keyw = rs.getString(3);  
        String keyw1 = rs.getString(4); 
        String shs = rs.getString(5);
        if(shs.equals("1"))
        	shs="已审核";
        else
        	shs="未审核";
        count++; 
        
    	out.print("<tr><td>"+no+"</td><td>"+name+"</td><td>"+keyw+" "+keyw1
    	+"</td><td>"+shs+"</td><td><a href='../showTable.jsp?NO="+no
    	+"'>查看</a></td></tr>"); 
	}while(rs.next());
    	db.close();
}
catch(Exception e)
{}
%>  
</table>
<p align="center">
<a href = "xstjcx.jsp?curPage=1" >首页</a>  
<a href = "xstjcx.jsp?curPage=<%=curPage-1%>" >上一页</a>  
<a href = "xstjcx.jsp?curPage=<%=curPage+1%>" >下一页</a>  
<a href = "xstjcx.jsp?curPage=<%=pageCount%>" >尾页</a>  
第<%=curPage%>页/共<%=pageCount%>页
</p>
</body>
</html>