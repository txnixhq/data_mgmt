<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>Account Login</h3>

	<form method="POST" action="VerifyCustomerLogin.jsp">
		<table>
			<tr>
				<td>Username:</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="text" name="password"></td>
			</tr>
		</table>
		<a href="NewCustomerAcc.jsp">[Create An Account]</a>
		<br><br>
		<input type="submit" value="submit">
	</form>
	<br>

</body>
</html>