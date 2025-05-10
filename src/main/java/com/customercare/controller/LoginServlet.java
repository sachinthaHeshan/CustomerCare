package com.customercare.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.customercare.dao.UserDAO;
import com.customercare.model.User;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());
	private UserDAO userDAO;

	@Override
	public void init() {
		userDAO = new UserDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = userDAO.authenticate(email, password);

		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			logger.info("Login successful for: " + email);
			response.sendRedirect("dashboard");
		} else {
			logger.warning("Login failed for: " + email);
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.println("<script type='text/javascript'>");
			out.println("alert('Your username or password is incorrect');");
			out.println("location='login'");
			out.println("</script>");
		}
	}
}
