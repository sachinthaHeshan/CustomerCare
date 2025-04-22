package com.customercare.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.customercare.dao.UserDAO;
import com.customercare.model.User;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
			response.sendRedirect("home.jsp");
		} else {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");

			out.println("<script type='text/javascript'>");
			out.println("alert('Your username or password is incorrect');");
			out.println("location='login'");
			out.println("</script>");
		}

	}

}
