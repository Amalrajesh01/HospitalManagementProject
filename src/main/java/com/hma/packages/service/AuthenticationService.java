package com.hma.packages.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AuthenticationService {

	public void signUp(HttpServletRequest req, HttpServletResponse res);

	public void login(HttpServletRequest req, HttpServletResponse res);
}
