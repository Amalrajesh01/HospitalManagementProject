<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffe6e6;
            color: #333;
            padding: 20px;
            text-align: center;
        }

        nav {
            background-color: #b30000;
            padding: 15px;
            text-align: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 18px;
            font-weight: bold;
        }

        nav a:hover {
            text-decoration: underline;
        }

        form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
            max-width: 400px;
            margin: auto;
            text-align: left;
        }

        div {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            color: #b30000;
            display: block;
            margin-bottom: 5px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            border: 1px solid #b30000;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            background-color: #b30000;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
        }

        button:hover {
            background-color: #990000;
        }

        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
        }

        th, td {
            border: 1px solid #b30000;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #b30000;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #ffe6e6;
        }

        tr:hover {
            background-color: #ffcccc;
        }
    </style>
</head>
<body>

<nav>
    <a href="dashboard.html">Dashboard</a>
    <a href="login.html">Logout</a>
</nav>

<form action="bookAppointment" method="POST">

    <div>
        <label>Department</label>
        <input name="department" required>
    </div>

    <div>
        <label>Patient ID</label>
        <input type="number" name="patientId" required>
    </div>

    <div>
        <label>Payment</label>
        <input type="number" name="payment" required>
    </div>

    <div>
        <label>Date</label>
        <input type="datetime-local" name="dateTime" required>
    </div>

    <div>
        <label>Choose Doctor</label>
        <select name="doctor" required>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "root");
                    PreparedStatement statement = connection.prepareStatement("SELECT doctorId, name FROM doctor WHERE availability = true");

                    ResultSet resultSet = statement.executeQuery();

                    while (resultSet.next()) {
                        int id = resultSet.getInt("doctorId");
                        String name = resultSet.getString("name");
            %>
            <option value="<%= id %>"><%= name %></option>
            <%
                    }
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
