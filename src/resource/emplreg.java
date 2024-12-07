package resource;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import databaseconnection.databasecon;
/**
 * Servlet implementation class emplreg
 */
@WebServlet("/emplreg")
public class emplreg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		PreparedStatement st2 = null;
		ResultSet rs2=null;
		try
		{
			String a=request.getParameter("fullname");
			System.out.println(a);
			String b=request.getParameter("email");
			String c=request.getParameter("phone");
			String location=request.getParameter("location");
			String d=request.getParameter("uname");
			String e=request.getParameter("password");
			String status="pending";
			
			
			Connection conn=databasecon.getconnection();
			String qry="insert into employee(fullname,email,phone,location,uname,password,status) values('"+a+"','"+b+"','"+c+"','"+location+"','"+d+"','"+e+"','"+status+"')";
			int ps =databasecon.getconnection().prepareStatement(qry).executeUpdate();			
			/*ps.setString(1, a);
			ps.setString(2, b);
			ps.setString(3, c);
			ps.setString(4, location);
			ps.setString(5, d);
			ps.setString(6, e);
			ps.setString(7, status);
			int aa=ps.executeUpdate();*/
			if(ps>0)
			{
				out.print("<html><body><script>alert('Register Successfully');</script></body></html>");
				
				RequestDispatcher rs = request.getRequestDispatcher("index.html");
				rs.include(request, response); 
			}
			else
			{
				out.print("<html><body><script>alert('Register UnSuccessfully');</script></body></html>");
				
				RequestDispatcher rs = request.getRequestDispatcher("logreg.jsp");
				rs.include(request, response); 
			}
		
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}

}
