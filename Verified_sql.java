

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Verified_sql")
public class Verified_sql extends HttpServlet {

	   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String a=request.getParameter("n5");
		String b=request.getParameter("n6");
		if(a!=null && b!=null)
		{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/signin_out","root","");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from in_out where Email='"+a+"' and Password='"+b+"'");
			if(rs.next())
			{
				response.sendRedirect("Welcome.jsp");
			}
			else
			{
				PrintWriter out=response .getWriter();
				out.println("insert success");
			}
		}
		catch(Exception e)
		{
		System.out.println(e);	
		}
		}
	}
}