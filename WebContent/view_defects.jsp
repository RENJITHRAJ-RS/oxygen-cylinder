<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    <%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
        <%@page import="java.util.Calendar"%>
    <%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>


<%
    
   
    String unid=request.getParameter("unid");
    session.setAttribute("unid",unid);
    String temperature=request.getParameter("temperature");
    String pressure=request.getParameter("pressure");
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
    
     int temperature1=Integer.parseInt(temperature);
    
      
     int pressure1=Integer.parseInt(pressure);
     
    if(temperature1>80 && pressure1>600 && capacity<10 && date2.after(date1)&& date3.after(date1))
    {
    	
    	response.sendRedirect("nodefection1.jsp");
    }
    else
    {
    	response.sendRedirect("deffectsend_pmanager1.jsp");
    }
    
    %>
