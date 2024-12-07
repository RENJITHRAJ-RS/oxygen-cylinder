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
try
{
	String a=request.getParameter("parts_name");
	String b=request.getParameter("quantity");
	
	String pmanager_status="pending";
	String owner_status="pending";
	String purchase_status="pending";
	
	Connection conn=databasecon.getconnection();
	String sql="insert into parts_purchase(parts_name,quantity,pmanager_status,owner_status,purchase_status) values(?,?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, a);
	ps.setString(2, b);
	ps.setString(3, pmanager_status);
	ps.setString(4, owner_status);
	ps.setString(5, purchase_status);
	int aa=ps.executeUpdate();
	if(aa>0)
	{
	%>
	<script>
	alert("Request Send To Production Manager");
	window.location="purchase_parts.jsp";
	</script>
	<% 
	}
	else
	{%>
		<script>
		alert(" Error");
		window.location="purchase_parts.jsp";
		</script>
<% 	}

}
catch(Exception ex)
{
	ex.printStackTrace();
}
%>
</body>
</html>