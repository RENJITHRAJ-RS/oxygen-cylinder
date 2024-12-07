<%@page import="com.itextpdf.text.Font.FontFamily"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.IOException"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="java.io.File"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="java.util.Date"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ecop</title>
</head>
<body>
<%
String a=request.getParameter("pname");
System.out.println("a==============="+a);
String b=request.getParameter("quantity");
System.out.println("b==============="+b); 
String b1=request.getParameter("amount");
String c=request.getParameter("date");



Document document = new Document();
try
{

	  SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy h-m-s");
	   Date date = new Date();
	   ServletContext context = getServletContext();
	   String dirName =context.getRealPath("\\payslip");
	 System.out.println("dirname"+dirName);
	 String fname="\\"+a+".pdf";
	 session.setAttribute("fname", fname);
	 String test=dirName+"\\"+a+".pdf";
	 session.setAttribute("test", test);
	  PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(test));
	  document.open();
	  float fntSize, lineSpacing;
	  fntSize = 15.0f;
	  lineSpacing = 40f;
	  Paragraph p = new Paragraph(new Phrase(lineSpacing,"PAY SLIP",FontFactory.getFont(FontFactory.COURIER, fntSize)));
	  p.setAlignment(Element.ALIGN_CENTER);
	    p.setLeading(0, 1);
	    document.add(p);
	    document.add(Chunk.NEWLINE);
	  PdfPTable table = new PdfPTable(2);
	  table.setWidthPercentage(80);
	 
      table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
     table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
     table.getDefaultCell().setFixedHeight(70);
     table.addCell("Product Parts Name");
     table.addCell(a);
     table.addCell(new Phrase(new Chunk("Quantity")));
     table.addCell(b);
     table.addCell(new Phrase(new Chunk("Amount")));
     table.addCell(b1);
     table.addCell(new Phrase(new Chunk("Date")));
     table.addCell(c);
    
   
      
  document.add(table); 
  
     document.close();
     response.sendRedirect("email1.jsp");
     %>
    

<%   
} catch (DocumentException e1)
{
  e1.printStackTrace();
} catch (FileNotFoundException e1)
{
  e1.printStackTrace();
}
%>
</body>
</html>