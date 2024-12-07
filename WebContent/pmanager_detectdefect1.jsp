<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
  String temp1=(String)session.getAttribute("temp1");
int temp11=Integer.parseInt(temp1);
String pressure1=(String)session.getAttribute("pressure1"); 
int pressure11=Integer.parseInt(pressure1);
String gas_capacity=(String)session.getAttribute("gas_capacity");
int capacity=Integer.parseInt(gas_capacity);
String expiring_date=(String)session.getAttribute("expiring_date");
String refilling_date=(String)session.getAttribute("refilling_date");
  String pcategory1=request.getParameter("pcategory");
  String pid=(String)session.getAttribute("pid");
  if(pcategory1.equals("temperature"))
  {
	 response.sendRedirect("tempdefect.jsp");
  }
  else if(pcategory1.equals("pressure"))
  {
	  response.sendRedirect("pressure_defect.jsp");
  }
  else if(pcategory1.equals("capacity"))
  {
	  response.sendRedirect("capacity.jsp");
  }
  else if(pcategory1.equals("expiring_date"))
  {
	  response.sendRedirect("expiry_defect.jsp");
  }
  else
  {
	  response.sendRedirect("refilling_defect.jsp");
  }
  
%>
</body>
</html>