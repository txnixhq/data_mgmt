<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>New Customer Account</h3>

	<form method="POST" action="CreateCustomerAcc.jsp">
		<table>
			<tr>
				<td>New Username:</td>
				<td><input type="text" name="username" required></td>
			</tr>
			<tr>
				<td>New Password:</td>
				<td><input type="text" name="password" required></td>
			</tr>
		</table>
		<a href="CustomerLoginPage.jsp"> [Go Back To Login Page]</a>
		<br> <br>
		<input type="submit" value="submit">
	</form>
	<br>

</body>
</html>