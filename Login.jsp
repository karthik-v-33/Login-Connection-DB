<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign_up</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://kit.fontawesome.com/919b33c3bd.js" crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-danger navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" href="#" style="font-size:55px; text-decoration:none;">Sign Up</a>
      </li>
    </ul>
  </div>
</nav>
<fieldset>
	<div class="container-fluid">
	<b><legend style="font-size:30px; text-align: center;  text-transform: uppercase;"> Create a new account </legend></b>
	</div>
	</fieldset>
<form action="Login_Connector_sql" method="post" style="font-size:20px; text-align: center;">
	Username:  <input type="text" placeholder="Enter your Name" name="n1"><br><br>
	Email - ID:  <input type="email" placeholder="Enter your Email-ID" name="n2"><br><br>
	Password:  <input type="password" placeholder="Enter your Password" name="n3">
	Confirm-Password:  <input type="password" placeholder="Confirm-Password" name="n4"><br><br>
	<input type="submit" value="SignUp" style="background-color:green; color:white;">
	</form><br><br><br><br><br><br>

<nav class="navbar navbar-expand-sm bg-danger navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" href="#" style="font-size:55px; text-decoration:none;">Sign In</a>
      </li>
    </ul>
  </div>
</nav>	
<fieldset>
	<div class="container-fluid">
	<b><legend style="font-size:30px; text-align: center;  text-transform: uppercase;"> Welcome</legend></b>
	</div>
	</fieldset>
	<form action="Login_Connector_sql" method="post" style="font-size:20px; text-align: center;">
	Email - ID:  <input type="email" placeholder="Enter your Email-ID" name="n5"><br><br>
	Password:  <input type="password" placeholder="Enter your Password" name="n6"><br><br>
	<input type="submit" value="Login" style="background-color:green; color:white;">
	</form>
<% 
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
				out.println("insert success");
			}
		}
		catch(Exception e)
		{
		System.out.println(e);	
		}

		}
		%>
</body>
</html>
