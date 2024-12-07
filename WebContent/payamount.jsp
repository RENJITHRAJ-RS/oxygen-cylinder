<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
String unid=(String)session.getAttribute("unid");
 String amount=request.getParameter("amount");
String date=request.getParameter("date");
String status="payment success";
try
	 {
	 
	 Statement st2 = null;
	 ResultSet rs2=null;


	 Connection conn=databasecon.getconnection();
	 String sql="update parts_purchase set amount='"+amount+"',owner_status='"+status+"',date='"+date+"' where id='"+unid+"'";
	 PreparedStatement ps=conn.prepareStatement(sql);
	 int aa=ps.executeUpdate();
	 if(aa>0)
	 {
	 %>
	 <script>
	 alert("Payment Success Payslip Send To Email");
	 window.location="ownerhome.jsp";
	 </script>
	 <% 
	 }
	 else
	 {%>
	 	<script>
	 	alert("Error");
	 	window.location="ownerhome.jsp";
	 	</script>
	 <% 	
	 }
	 }

	 catch(Exception ex)
	 {
	 ex.printStackTrace();
	 }
%>
</body>
</html>