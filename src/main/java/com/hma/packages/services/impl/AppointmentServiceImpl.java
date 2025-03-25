package com.hma.packages.services.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hma.packages.service.AppointmentService;

public class AppointmentServiceImpl implements AppointmentService {

	@Override
	public void bookAppointment(HttpServletRequest req, HttpServletResponse res) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "root");
//			prepare the query
			PreparedStatement statement = connection
.prepareStatement("insert into appointment (dateAndTime, department, doctorId,patientId,payment,status) values (?,?,?,?,?,'booked')");

			statement.setString(1, req.getParameter("dateTime"));
			statement.setString(2, req.getParameter("department"));
			statement.setString(3, req.getParameter("doctor"));
			statement.setString(4, req.getParameter("patientId"));
			statement.setString(5, req.getParameter("payment"));
//			Execute the query
			int noOfRowsAffected = statement.executeUpdate();

			if (noOfRowsAffected >= 1) {
				res.sendRedirect("dashboard.html");
			} else {
				System.err.println("something went wrong");
			}
			// close the connection
			connection.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
