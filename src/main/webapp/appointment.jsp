<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav>
<a href="dashboard.html">Dashboard</a>
<a href="login.html">Logout</a>
</nav>
	<form action="bookAppointment" method="POST">

		<div>
			<label>department</label> <input name="department">
		</div>
		<div>
			<label>patientId</label> <input type="number" name="patientId">
		</div>
		<div>
			<label>payment</label> <input type="number" name="payment">
		</div>
		<div>
			<label>Date</label> <input type="datetime-local" name="dateTime">
		</div>
		<div>
		<label>Choose Doctor</label>
			<select name="doctor">
				<%
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");

					Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "root");
					//	prepare the query
					PreparedStatement statement = connection
					.prepareStatement("select doctorId,name from doctor  where availability = true");

					//	Execute the query
					ResultSet resultSet = statement.executeQuery();

					while (resultSet.next()) {
						int id = resultSet.getInt("doctorId");
						String name = resultSet.getString("name");
				%>
				<option value="<%=id%>"><%=name%></option>
				<% 
				}
				// close the connection
				connection.close();
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</select>
		</div>
		<button type="submit">Submit</button>
	</form>


</body>
</html>