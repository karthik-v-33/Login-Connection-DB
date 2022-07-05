

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
@WebServlet("/Login_Connector_sql")
public class Login_Connector_sql extends HttpServlet {

   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		String a=request.getParameter("n1");
		String b=request.getParameter("n2");
		String c=request.getParameter("n3");
		if(a!=null && b!=null && c!=null)
		{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/signin_out","root","");
			Statement st=con.createStatement();
			st.executeUpdate("insert into in_out values('"+a+"','"+b+"','"+c+"')");
			
		}
		catch(Exception e)
		{
		System.out.println(e);	
		}

		}
	}

}
