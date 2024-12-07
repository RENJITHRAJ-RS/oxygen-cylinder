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

String fname=(String)session.getAttribute("fname");
	System.out.println("fname===="+fname);
	String dirname=(String)session.getAttribute("test");
	System.out.println("dirname===="+dirname);
String message1="Your Profile Accepted Successfully";
String host="", user="", pass="";

host ="smtp.gmail.com"; //"smtp.gmail.com";

user ="userpoisoion@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails

pass ="Poision123@"; //Your gmail password

String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

String to ="userpoision@gmail.com"; // out going email id


String from ="vigneshp.surya@gmail.com"; //Email id of the recipient
String subject="Payslip";
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
MimeBodyPart messageBodyPart = new MimeBodyPart();

Multipart multipart = new MimeMultipart();

String file = dirname;
String fileName = fname;
DataSource source = new FileDataSource(file);
messageBodyPart.setDataHandler(new DataHandler(source));
messageBodyPart.setFileName(fileName);
multipart.addBodyPart(messageBodyPart);

msg.setContent(multipart);
 // use setText if you want to send text
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);
try {
transport.sendMessage(msg, msg.getAllRecipients());%>
<script>
alert("Payslip Send To Email");
window.location="generate_payslip.jsp";

</script>
<%}
catch (Exception err) {

out.println("message not successfully sended"); // assume it’s a fail
} 
transport.close();


%>
</body>
</html>