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
String pressure1=(String)session.getAttribute("pressure1"); 
int pressure11=Integer.parseInt(pressure1);
String pid=(String)session.getAttribute("pid");
System.out.println("unid1===="+pid);

 if(pressure11<=600)
 {
	 System.out.println("ifworking");
	 try
	 {
	 String pstatus="defect";
	 Statement st2 = null;
	 ResultSet rs2=null;


	 Connection conn=databasecon.getconnection();
	 String sql="update upload_cylinder set pressure_defect='"+pstatus+"' where id='"+pid+"'";
	 PreparedStatement ps=conn.prepareStatement(sql);
	 int aa=ps.executeUpdate();
	 if(aa>0)
	 {
	 %>
	 <script>
	 alert("Product in defect");
	 window.location="productionmanager_home.jsp";
	 </script>
	 <% 
	 }
	 else
	 {%>
	 	<script>
	 	alert("Error");
	 	window.location="productionmanager_home.jsp";
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
	 System.out.println("elseworking");
	 try
	 {
	 String pstatus1="nodefect";
	 


	 Connection conn1=databasecon.getconnection();
	 String sql1="update upload_cylinder set pressure_defect='"+pstatus1+"' where id='"+pid+"'";
	 PreparedStatement ps1=conn1.prepareStatement(sql1);
	 int bb=ps1.executeUpdate();
	 if(bb>0)
	 {
	 %>
	 <script>
	 alert("No Pressure Defect In Product");
	 window.location="productionmanager_home.jsp";
	 </script>
	 <% 
	 }
	 else
	 {%>
	 	<script>
	 	alert("Error");
	 	window.location="productionmanager_home.jsp";
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