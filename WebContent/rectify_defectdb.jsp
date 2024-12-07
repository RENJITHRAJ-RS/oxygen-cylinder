<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="databaseconnection.databasecon"%>
<%@ page  import="java.sql.*,java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String pid=(String)session.getAttribute("pid");
String temp1=request.getParameter("temperature");
String pressure=request.getParameter("pressure");
String gas_capacity=request.getParameter("gas_capacity");
String expiring_date=request.getParameter("expiring_date");
String refilling_date=request.getParameter("refilling_date");
try
{
String pstatus="Accept";
Statement st2 = null;
ResultSet rs2=null;


Connection conn=databasecon.getconnection();
String sql="update upload_cylinder set temperature='"+temp1+"',pressure='"+pressure+"',gas_capacity='"+gas_capacity+"',expiring_date='"+expiring_date+"',refilling_date='"+refilling_date+"'where id='"+pid+"'";
PreparedStatement ps=conn.prepareStatement(sql);
int aa=ps.executeUpdate();
if(aa>0)
{
 response.sendRedirect("rectify_defect1.jsp");
}
else
{
	response.sendRedirect("eview_pmanagersolution.jsp.jsp");
}
}

catch(Exception ex)
{
ex.printStackTrace();
}
%>
</body>
</html>