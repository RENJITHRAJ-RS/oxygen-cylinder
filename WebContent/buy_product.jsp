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
	 Connection conn=databasecon.getconnection();
	 String sql="update parts_purchase set purchase_status='"+purchase_status+"' where id='"+pid+"'";
	 PreparedStatement ps=conn.prepareStatement(sql);
	 int aa=ps.executeUpdate();
	 if(aa>0)
	 {
	 %>
	 <script>
	 alert("Product Purchased Successfully");
	 window.location="owner_response.jsp";
	 </script>
	 <% 
	 }
	 else
	 {%>
	 	<script>
	 	alert("Error");
	 	window.location="owner_response.jsp";
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