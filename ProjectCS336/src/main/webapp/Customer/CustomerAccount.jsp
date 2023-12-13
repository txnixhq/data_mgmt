<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="POST" action="CustomerLoginPage.jsp"
		style="text-align: right;">
		<input type="submit" value="Sign Out">
	</form>
	
	<h2>Welcome, <% out.println(session.getAttribute("userid")); %>!</h2>
	
	<form method="POST" action="ShowFlights.jsp">
		
			<input type="radio" name="fType" value="O" checked> One-Way
			<input type="radio" name="fType" value="R"> Round-Trip
			<input type="checkbox" name="isFlex" value="F"> Flexible (+/- 3 Days)
			
			<br> <br>
			Filter List: <select name="filter" size=1>
				<option value="none"> None </option>
				<option value="price"> Price </option>
				<option value="stops"> Number of Stops </option>
				<option value="airline"> Airline </option>
				<option value="departureDate"> Departure Date </option>
				<option value="returnDate"> Return Date </option>
				
			</select>
			
			Sort: <select name="sort" size=1>
				<option value="none"> None </option>
				<option value="price"> Price </option>
				<option value="departureDate"> Departure Date </option>
				<option value="returnDate"> Return Date </option>
				<option value="duration"> Duration of Flight </option>
				
			</select>
			
			<br><br>
			<input type="text" name="departure_airport" placeholder="From?"> 
			<input type="text" name="arrival_airport" placeholder="To?"> 
			Departure Date: <input type="date" name="departure_date"> 
			Return Date: <input type="date" name="return_date"> 
			
			
			<br><br>
			<input type="submit" value="Search Flights">
			
	
	</form>
	
	
	

</body>
</html>