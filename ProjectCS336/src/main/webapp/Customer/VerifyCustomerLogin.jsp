<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Getting inputted username and password
		String user = request.getParameter("username");
		String password = request.getParameter("password");

		String checkQuery = "SELECT * FROM CustomerUser WHERE c_usr='" + user + "' AND c_pass='" + password + "'";

		ResultSet rs = stmt.executeQuery(checkQuery);

		//If user enters wrong username and password
		if (!rs.next()) {
			out.println("Invalid Password/Username<br>");
			out.println("<a href=\"CustomerLoginPage.jsp\"> [Go Back To Login]</a>");
			
		} else {
			response.sendRedirect("CustomerAccount.jsp");
		}
		
		con.close();
		stmt.close();
		rs.close();

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>

</body>
</html>