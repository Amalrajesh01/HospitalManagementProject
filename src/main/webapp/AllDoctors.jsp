<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctors List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        nav {
            background-color: #e60000;
            padding: 10px;
            text-align: center;
        }

        nav a {
            color: white;
            margin: 0 20px;
            text-decoration: none;
            font-size: 18px;
        }

        nav a:hover {
            text-decoration: underline;
        }

        h1 {
            text-align: center;
            color: #e60000;
            margin-top: 30px;
        }

        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: white;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #e60000;
            color: white;
        }

        button {
            background-color: #e60000;
            color: white;
            padding: 8px 20px;
            border: none;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #cc0000;
        }

        footer {
            background-color: #e60000;
            color: white;
            text-align: center;
            padding: 15px;
            position: fixed;
            bottom: 0;
            width: 100%;
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
            <th>Doctor ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Mobile</th>
            <th>Department</th>
            <th>Availability</th>
        </tr>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "root");
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM doctor");
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    int id = resultSet.getInt("doctorId");
                    String name = resultSet.getString("name");
                    int age = resultSet.getInt("age");
                    long mobile = resultSet.getLong("mobile");
                    String department = resultSet.getString("department");
                    boolean availability = resultSet.getBoolean("availability");
        %>
        
        <tr>
            <td><%= id %></td>
            <td><%= name %></td>
            <td><%= age %></td>
            <td><%= mobile %></td>
            <td><%= department %></td>
            <td>
                <%
                    if (!availability) {
                %>
                        <form action="makeDoctorAvailable" method="POST">
                            <input type="hidden" name="id" value="<%= id %>">
                            <button type="submit">Mark as Available</button>
                        </form>
                <%
                    } else {
                %>
                        <form action="makeDoctorUnAvailable" method="POST">
                            <input type="hidden" name="id" value="<%= id %>">
                            <button type="submit">Mark as Unavailable</button>
                        </form>
                <%
                    }
                %>
            </td>
        </tr>

        <%
                }

                // Close the connection
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>

    <footer>© 2025 Hospital Management App | All rights reserved</footer>

</body>
</html>
