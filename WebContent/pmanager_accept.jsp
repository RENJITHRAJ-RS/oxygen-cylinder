<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="databaseconnection.databasecon"%>
<%@ page  import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%

String unid1=request.getParameter("unid");

String email=request.getParameter("email");
String nn="provided";
String message1="Your Profile Accepted Successfully";
String host="", user="", pass="";

host ="smtp.gmail.com"; //"smtp.gmail.com";

user ="vigneshp.surya@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails

pass ="Surya@16"; //Your gmail password

String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

String to =email; // out going email id


String from ="cloudauthenticate@gmail.com"; //Email id of the recipient
String subject="Production Manager Acceptance Information";
//String subject ="welcome";

String messageText =message1;


//session.setAttribute("emailid",emailid);
boolean sessionDebug = true;

Properties props = System.getProperties();
props.put("mail.host", host);
props.put("mail.transport.protocol.", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getDefaultInstance(props, null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setContent(messageText, "text/html"); // use setText if you want to send text
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);
try {
transport.sendMessage(msg, msg.getAllRecipients());%>

<%}
catch (Exception err) {

out.println("message not successfully sended"); // assume it’s a fail
} 
transport.close();

try
{
String pstatus="Accept";
Statement st2 = null;
ResultSet rs2=null;


Connection conn=databasecon.getconnection();
String sql="update manager set status='"+pstatus+"' where id='"+unid1+"'";
PreparedStatement ps=conn.prepareStatement(sql);
int aa=ps.executeUpdate();
if(aa>0)
{
%>
<script>
alert("Acceptance Details Successfully Send to Email");
window.location="pmanager_details.jsp";
</script>
<% 
}
else
{%>
	<script>
	alert("Error");
	window.location="pmanager_details.jsp";
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