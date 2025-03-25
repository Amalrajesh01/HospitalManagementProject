package com.hma.packages.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hma.packages.service.AuthenticationService;
import com.hma.packages.services.impl.AuthenticationServiceImpl;

@WebServlet("/signup")
public class SignupController extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) {
		AuthenticationService service = new AuthenticationServiceImpl();
		service.signUp(req, resp);
	}
}
