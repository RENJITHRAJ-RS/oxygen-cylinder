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
 String pid=request.getParameter("pid");
 try
	 {
	 String pstatus="defect";
	 Statement st2 = null;
	 ResultSet rs2=null;

	 String purchase_status="Purchased Success";
	 String omanager_status="Accept";
	 String owner_status="payment success";
	 Connection conn=databasecon.getconnection();
	 String sql="select * from parts_purchase where id='"+pid+"' and pmanager_status='"+omanager_status+"' and owner_status='"+owner_status+"' and purchase_status='"+purchase_status+"'";
	 PreparedStatement ps=conn.prepareStatement(sql);
	 ResultSet rs=ps.executeQuery();
	 if(rs.next())
	 { 
	 
	 %>
	 <script>
	 alert("Office Manager Send Product Successfully");
	 window.location="purchase_status.jsp";
	 </script>
	 <% 
	 }
	 else
	 {%>
	 	<script>
	 	alert("Still Not Accept the Request");
	 	window.location="purchase_status.jsp";
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