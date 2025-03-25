package com.hma.packages.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hma.packages.service.ProfileService;
import com.hma.packages.services.impl.ProfileServiceImpl;

@WebServlet("/createDoctorProfile")
public class DoctorProfileController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProfileService service = new ProfileServiceImpl();
		service.createDoctorProfile(req, resp);
	}
}
