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
		<a href="dashboard.html">Dashboard</a> <a href="login.html">Logout</a>
	</nav>
	<h1>All doctors</h1>


	<table border="1">
		<tr>
			<th>Doctor id</th>
			<th>Name</th>
			<th>Age</th>
			<th>Mobile</th>
			<th>Department</th>
			<th>Availability</th>
		</tr>

		<tr>


			<%
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");

				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "root");
				//	prepare the query
				PreparedStatement statement = connection.prepareStatement("select * from doctor");

				//	Execute the query
				ResultSet resultSet = statement.executeQuery();

				while (resultSet.next()) {
					int id = resultSet.getInt("doctorId");
					String name = resultSet.getString("name");
					int age = resultSet.getInt("age");
					long mobile = resultSet.getLong("mobile");
					String department = resultSet.getString("department");
					boolean availability = resultSet.getBoolean("availability");
			%>
			<td><%=id%></td>
			<td><%=name%></td>
			<td><%=age%></td>
			<td><%=mobile%></td>




			<td><%=department%></td>

			<td>
				<%
				if (!availability) {
				%>
				<form action="makeDoctorAvailable" method="POST">
					<input type="hidden" name="id" value="<%=id%>">
					<button type="submit">Mark as Available</button>
				</form> <%
 } else {
 %> <%
 }
 %> <%
 if (availability) {
 %>
				<form action="makeDoctorUnAvailable" method="POST">
					<input type="hidden" name="id" value="<%=id%>">
					<button type="submit">Mark as UnAvailable</button>
				</form> <%
 } else {
 %> <%
 }
 %>
			</td>


		</tr>
		<%
		}

		// close the connection
		connection.close();
		} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		%>



	</table>




</body>
</html>