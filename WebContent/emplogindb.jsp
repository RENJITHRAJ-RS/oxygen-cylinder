
<html>
<body>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>
<%
      
	 
        String uname=request.getParameter("uname");
         System.out.println("uname="+uname);
        String pword=request.getParameter("password");
        System.out.println("password="+pword);
		String status1="Accept";
		
         
	    try{
			
	     Connection con = databasecon.getconnection();
         PreparedStatement ps=con.prepareStatement("select *  from employee where uname='"+uname+"' and password='"+pword+"' and status='"+status1+"'");
	     ResultSet rs=ps.executeQuery();
		 if(rs.next())
		 { 
		
		 
		 String n=rs.getString("id");
		 session.setAttribute("eid",n);
		 String p=rs.getString("uname");
		 session.setAttribute("ename",p);
		 System.out.println("username"+p);
		 // String m=rs.getString("email");
		// session.setAttribute("bb",email);
		// System.out.println("email id"+bb);
		 String email1=rs.getString("email");
		 session.setAttribute("email1",email1);
		   
	     response.sendRedirect("employee_home.jsp");
		
		 }
		 else
		 {%>
		 <script>alert(" Still admin not accept your request(or) incorrect username and password");
		 window.location="index.html";
		 </script>
	<%
		 }
		

	}
	catch(Exception e2){
		out.println(e2.getMessage());
	}
	
	
%>
</body>
</html>