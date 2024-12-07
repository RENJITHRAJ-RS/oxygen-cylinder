<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.util.Calendar"%>
    <%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
 <%@page import="databaseconnection.databasecon"%>
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String pid=request.getParameter("pid1");
String temp1=request.getParameter("temperature");
int temp11=Integer.parseInt(temp1);
String pressure=request.getParameter("pressure");
int pressure1=Integer.parseInt(pressure);
String gas_capacity=request.getParameter("gas_capacity");
int capacity=Integer.parseInt(gas_capacity);
String expiring_date=request.getParameter("expiring_date");
java.util.Date now = new java.util.Date();
String date=now.toString();
 String DATE_FORMAT = "dd-MM-yyyy";
 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
 String strDateNew = sdf.format(now) ;
 SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
 Date date1 = sdf1.parse(strDateNew);
 Date date2 = sdf1.parse(expiring_date);
String refilling_date=request.getParameter("refilling_date");
Date date3 = sdf1.parse(refilling_date);
if(temp11>80 && pressure1>600 && capacity<10 && date2.after(date1)&& date3.after(date1) )
{
	
	try
{
String defect1="nodefect";
Statement st2 = null;
ResultSet rs2=null;

Connection conn=databasecon.getconnection();
String sql="update upload_cylinder set defect_result='"+defect1+"',temp_defect='"+defect1+"',pressure_defect='"+defect1+"',capacity_defect='"+defect1+"',expiry_defect='"+defect1+"',refilling_defect='"+defect1+"' where id='"+pid+"'";
PreparedStatement ps=conn.prepareStatement(sql);
int aa=ps.executeUpdate();
if(aa>0)
{
  response.sendRedirect("rectify_nodefect.jsp");
}
else
{%>
<script>
alert("Error");
window.location="eview_pmanagersolution.jsp";
</script>
<% 	
}
}

catch(Exception ex)
{
ex.printStackTrace();
}

	
}
else
{
	try
	{
	String defect2="product_in_defect";
	
	Connection conn2=databasecon.getconnection();
	String sql2="update upload_cylinder set defect_result='"+defect2+"' where id='"+pid+"'";
	PreparedStatement ps2=conn2.prepareStatement(sql2);
	int bb=ps2.executeUpdate();
	if(bb>0)
	{
	    response.sendRedirect("rectify_defect.jsp");
	
	}
	else
	{%>
		<script>
		alert("Error");
		window.location="view_cylinder.jsp";
		</script>
	<% 	
	}
	}

	catch(Exception ex)
	{
	ex.printStackTrace();
	}
}
%>
</body>
</html>