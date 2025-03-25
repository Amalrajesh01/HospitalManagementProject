package com.hma.packages.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hma.packages.service.DoctorService;
import com.hma.packages.services.impl.DoctorServiceImpl;

@WebServlet("/makeDoctorUnAvailable")
public class DoctorUnavailableServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
		DoctorService service = new DoctorServiceImpl();
		service.makeDoctorUnAvailable(req, resp);
	}
}
