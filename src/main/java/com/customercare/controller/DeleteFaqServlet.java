package com.customercare.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customercare.dao.FaqDAO;

import java.io.IOException;

@WebServlet("/deleteFaq")
public class DeleteFaqServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            new FaqDAO().deleteFaq(id);
            response.sendRedirect("listFaqs");
        } catch (Exception e) {
            request.setAttribute("error", "Failed to delete FAQ: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
