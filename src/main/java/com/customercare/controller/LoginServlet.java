package com.customercare.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.customercare.service.UserService;
import com.customercare.model.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());
	private UserService userService;

	@Override
	public void init() {
		userService = new UserService();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		
		if ("register".equals(action)) {
			handleRegistration(request, response);
		} else {
			handleLogin(request, response);
		}
	}
	
	private void handleLogin(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = userService.authenticate(email, password);

		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			logger.info("Login successful for: " + email);
			response.sendRedirect("dashboard");
		} else {
			logger.warning("Login failed for: " + email);
			response.sendRedirect("auth/login.jsp?error=true");
		}
	}
	
	private void handleRegistration(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		// Validate input
		if (name == null || name.trim().isEmpty() || 
			email == null || email.trim().isEmpty() || 
			password == null || password.trim().isEmpty()) {
			response.sendRedirect("auth/register.jsp?error=All+fields+are+required");
			return;
		}
		
		// Validate password match
		if (!password.equals(confirmPassword)) {
			response.sendRedirect("auth/register.jsp?error=Passwords+do+not+match");
			return;
		}
		
		// Check if email already exists
		if (userService.isEmailExists(email)) {
			response.sendRedirect("auth/register.jsp?error=Email+already+exists");
			return;
		}
		
		// Register the user
		boolean success = userService.register(name, email, password);
		
		if (success) {
			logger.info("Registration successful for: " + email);
			response.sendRedirect("auth/login.jsp");
		} else {
			logger.warning("Registration failed for: " + email);
			response.sendRedirect("auth/register.jsp?error=Registration+failed.+Please+try+again.");
		}
	}
}
