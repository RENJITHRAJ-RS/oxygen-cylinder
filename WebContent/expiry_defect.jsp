<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Calendar"%>
    <%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String expiring_date=(String)session.getAttribute("expiring_date");
String pid=(String)session.getAttribute("pid");
java.util.Date now = new java.util.Date();
String date=now.toString();
 String DATE_FORMAT = "dd-MM-yyyy";
 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
 String strDateNew = sdf.format(now) ;
 SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
 Date date1 = sdf1.parse(strDateNew);
 Date date2 = sdf1.parse(expiring_date);

 if(date2.after(date1))
 {
	 
	 try
	 {
	 String pstatus1="nodefect";
	 


	 Connection conn1=databasecon.getconnection();
	 String sql1="update upload_cylinder set expiry_defect='"+pstatus1+"' where id='"+pid+"'";
	 PreparedStatement ps1=conn1.prepareStatement(sql1);
	 int bb=ps1.executeUpdate();
	 if(bb>0)
	 {
	 %>
	 <script>
	 alert("No Expiring date Defect In Product");
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
	 try
	 {
	 String pstatus="defect";
	 Statement st2 = null;
	 ResultSet rs2=null;


	 Connection conn=databasecon.getconnection();
	 String sql="update upload_cylinder set expiry_defect='"+pstatus+"' where id='"+pid+"'";
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
%>

</body>
</html>