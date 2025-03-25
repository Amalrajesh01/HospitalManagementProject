package com.hma.packages.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AppointmentService {
	public void bookAppointment(HttpServletRequest req, HttpServletResponse res);
}
