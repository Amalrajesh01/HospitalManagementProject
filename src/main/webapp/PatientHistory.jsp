<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Doctors</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #2b0000;
        color: #fff;
        margin: 0;
        padding: 20px;
    }
    nav {
        background-color: #a50000;
        padding: 10px;
        text-align: center;
    }
    nav a {
        color: white;
        text-decoration: none;
        margin: 0 15px;
        font-weight: bold;
    }
    h1 {
        text-align: center;
        color: #ffcccc;
    }
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #660000;
        color: #fff;
    }
    th, td {
        border: 1px solid #ff6666;
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: #990000;
    }
    tr:nth-child(even) {
        background-color: #800000;
    }
</style>
</head>
<body>
    <nav>
        <a href="dashboard.html">Dashboard</a>
        <a href="login.html">Logout</a>
    </nav>
    <h1>All Doctors</h1>
    <table>
        <tr>
            <th>Patient ID</th>
            <th>Patient Name</th>
            <th>Age</th>
            <th>Appointment Date & Time</th>
            <th>Doctor</th>
            <th>Department</th>
            <th>Payment</th>
            <th>Status</th>
        </tr>
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "root");
            PreparedStatement statement = connection.prepareStatement(
                "SELECT p.patientId, p.name AS patient_name, p.age, a.dateAndTime, d.name AS doctor_name, d.department, a.payment, a.status " +
                "FROM appointment a JOIN patient p ON a.patientId = p.patientId " +
                "JOIN doctor d ON a.doctorId = d.doctorId WHERE p.patientId = ?"
            );
            statement.setString(1, request.getParameter("id"));
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
        %>
        <tr>
            <td><%= resultSet.getInt("patientId") %></td>
            <td><%= resultSet.getString("patient_name") %></td>
            <td><%= resultSet.getInt("age") %></td>
            <td><%= resultSet.getString("dateAndTime") %></td>
            <td><%= resultSet.getString("doctor_name") %></td>
            <td><%= resultSet.getString("department") %></td>
            <td><%= resultSet.getInt("payment") %></td>
            <td><%= resultSet.getString("status") %></td>
        </tr>
        <%
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </table>
</body>
</html>