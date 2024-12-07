<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>


<%
String email1=(String)session.getAttribute("email1"); 
		String oxygen_type=null,temperature=null,pressure=null,tube_material=null,cylinder_type=null,gas_type=null,gas_capacity=null,image=null,expiring_date=null,refilling_date=null;
		Statement st = null;
		ResultSet rs1=null;
		int iid=0,count=0;
		
	
		ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Gallery");
		String paramname=null;
		String file=null;

		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
 
		File file1 = null;
			
		
		try {
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				
				if(paramname.equalsIgnoreCase("oxygen_type"))
				{
					oxygen_type=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("temperature"))
				{
					temperature=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("pressure"))
				{
					pressure=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("tube_material"))
				{
					tube_material=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("cylinder_type"))
				{
					cylinder_type=multi.getParameter(paramname);
				}
				
				if(paramname.equalsIgnoreCase("gas_type"))
				{
					gas_type=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("gas_capacity"))
				{
					gas_capacity=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("expiring_date"))
				{
					expiring_date=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("refilling_date"))
				{
					refilling_date=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("image"))
				{
					image=multi.getParameter(paramname);
				}
				
				
				}
					
			int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			f = 1;
			image = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Gallery\\"+image);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
	        FileInputStream fs1 = null;
            //name=dirName+"\\Gallery\\"+image;
			
			
			
	 
			
			
			Connection con=databasecon.getconnection();

			PreparedStatement ps=con.prepareStatement("INSERT INTO upload_cylinder(oxygen_type,temperature,pressure,tube_material,cylinder_type,gas_type,gas_capacity,expiring_date,refilling_date,image,emp_email) VALUES(?,?,?,?,?,?,?,?,?,?,?)");
				
               	ps.setString(1,oxygen_type);
				ps.setString(2,temperature);
				ps.setString(3,pressure);	
       			ps.setString(4,tube_material);
       			ps.setString(5,cylinder_type);  
       			ps.setString(6,gas_type);
			    ps.setString(7,gas_capacity);
			    ps.setString(8,expiring_date);
			    ps.setString(9,refilling_date);
			    ps.setString(10,image);
			    ps.setString(11,email1);
			   				
				
       if(f == 0)
			ps.setObject(10,null);
		else if(f == 1)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(10,fs1,fs1.available());
		}	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{%>
			<script>
			alert("Upload successfully");
			window.location="employee_home.jsp";
				</script>
			<% }
			else
			{
				%>
				<script>
				alert("Upload error");
				window.location="employee_home.jsp";
					</script>
		<% 	}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
			
 %>

	
 
