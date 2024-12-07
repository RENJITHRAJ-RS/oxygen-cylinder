
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
String unid1=(String)session.getAttribute("unid");
%>

 <% 
	try
{
String defect1="product_in_defect";
Statement st2 = null;
ResultSet rs2=null;

Connection conn=databasecon.getconnection();
String sql="update upload_cylinder set defect_result='"+defect1+"' where id='"+unid1+"'";
PreparedStatement ps=conn.prepareStatement(sql);
int aa=ps.executeUpdate();
if(aa>0)
{
%>
<script>
alert("Request Send To Production Manager");
window.location="deffectsend_pmanager.jsp";
</script>
<% 
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
%>
				
	