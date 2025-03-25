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
			<th>Patient id</th>
			<th>Name</th>
			<th>Age</th>
			<th>Mobile</th>
			<th>Address</th>
			<th>gender</th>
			<th>Profile created </th>
		</tr>

		<tr>


			<%
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");

				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "root");
				//	prepare the query
				PreparedStatement statement = connection.prepareStatement("select * from patient");

				//	Execute the query
				ResultSet resultSet = statement.executeQuery();

				while (resultSet.next()) {
					int id = resultSet.getInt("patientId");
					String name = resultSet.getString("name");
					int age = resultSet.getInt("age");
					long mobile = resultSet.getLong("mobile");
					String address = resultSet.getString("address");
					String gender = resultSet.getString("gender");
					String profileCreated = resultSet.getString("time_Stamp");
			%>
			<td><%=id%></td>
			<td><%=name%></td>
			<td><%=age%></td>
			<td><%=mobile%></td>
			<td><%=address%></td>
			<td><%=gender%></td>
			<td><%=profileCreated %></td>
			<td>
			<form action="PatientHistory.jsp" >
					<input type="hidden" name="id" value="<%=id%>">
					<button type="submit">Patient history</button>
				</form> 
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