<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #ffebe6;
        color: #800000;
        margin: 0;
        padding: 0;
    }
    nav {
        background-color: #b30000;
        padding: 15px;
        text-align: center;
    }
    nav a {
        color: white;
        text-decoration: none;
        font-size: 18px;
        margin: 0 15px;
    }
    h1 {
        text-align: center;
        margin-top: 20px;
    }
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: white;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
        border: 1px solid #b30000;
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: #b30000;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #ffe6e6;
    }
    button {
        background-color: #b30000;
        color: white;
        border: none;
        padding: 8px 12px;
        cursor: pointer;
        border-radius: 5px;
    }
    button:hover {
        background-color: #800000;
    }
</style>
</head>
<body>
    <nav>
        <a href="dashboard.html">Dashboard</a>
        <a href="login.html">Logout</a>
    </nav>
    <h1>All Patients</h1>
    <table>
        <tr>
            <th>Patient ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Mobile</th>
            <th>Address</th>
            <th>Gender</th>
            <th>Profile Created</th>
            <th>Action</th>
        </tr>
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "root");
            PreparedStatement statement = connection.prepareStatement("select * from patient");
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
        <tr>
            <td><%=id%></td>
            <td><%=name%></td>
            <td><%=age%></td>
            <td><%=mobile%></td>
            <td><%=address%></td>
            <td><%=gender%></td>
            <td><%=profileCreated %></td>
            <td>
                <form action="PatientHistory.jsp">
                    <input type="hidden" name="id" value="<%=id%>">
                    <button type="submit">View History</button>
                </form>
            </td>
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
