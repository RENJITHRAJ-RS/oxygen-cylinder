<%@ page language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>

<html>
<head>
<title>Internet Service Provider</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
 String a=request.getParameter("uname");
 String b=request.getParameter("password");
 System.out.println(a);
 System.out.println(b);
// String c="admin@gmail.com";
// String d="admin";
 if((a.equals("admin"))&& (b.equals("admin")))
 {

	response.sendRedirect("adminhome.jsp");
 }
 else{
	 %>
	 <script>alert("Incorrect username and password");
	 window.location="admin.jsp";
	 </script>
	 <% 
 
 }
%>
</body>
</html>


