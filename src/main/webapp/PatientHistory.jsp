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
			<th>Patient Name</th>
			<th>Age</th>
			
			<th>Appointment date and time</th>
			<th>Doctor</th>
			<th>Department </th>
				<th>Payment</th>
			<th>Status </th>
		
		</tr>

		<tr>


			<%
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");

				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "root");
				//	prepare the query
				PreparedStatement statement = connection.prepareStatement("SELECT p.patientId, p.name AS patient_name, p.age, p.mobile, a.dateAndTime, d.name AS doctor_name, d.department, a.payment, a.status FROM appointment a JOIN patient p ON a.patientId = p.patientId JOIN doctor d ON a.doctorId = d.doctorId WHERE p.patientId = ?");

				
				statement.setString(1, request.getParameter("id"));
				//	Execute the query
				ResultSet resultSet = statement.executeQuery();

				while (resultSet.next()) {
					int id = resultSet.getInt("patientId");
					String name = resultSet.getString("patient_name");
					int age = resultSet.getInt("age");
				
					String dateAndTime = resultSet.getString("dateAndTime");
					String doctor = resultSet.getString("doctor_name");
					String department = resultSet.getString("department");
					int payment = resultSet.getInt("payment");
					String status = resultSet.getString("status");
			%>
			<td><%=id%></td>
			<td><%=name%></td>
			<td><%=age%></td>
			<td><%=dateAndTime%></td>
			<td><%=doctor%></td>
			<td><%=department%></td>
			<td><%=payment %></td>
				<td><%=status %></td>
	
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