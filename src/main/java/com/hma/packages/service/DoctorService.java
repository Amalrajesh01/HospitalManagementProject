package com.hma.packages.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface DoctorService {
	public void makeDoctorAvailable(HttpServletRequest req, HttpServletResponse res);

	public void makeDoctorUnAvailable(HttpServletRequest req, HttpServletResponse res);
}
