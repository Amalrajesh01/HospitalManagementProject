package com.hma.packages.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ProfileService {

	public void createDoctorProfile(HttpServletRequest req, HttpServletResponse res);
	public void createPatientProfile(HttpServletRequest req, HttpServletResponse res);
}
