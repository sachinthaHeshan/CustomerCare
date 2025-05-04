package com.customercare.controller;

import com.customercare.dao.FeedbackDAO;
import com.customercare.model.Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewFeedback")
public class ViewFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	System.out.println("Inside serverlets()");

        FeedbackDAO dao = new FeedbackDAO();
		List<Feedback> feedbackList = dao.getAllFeedback();

        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("/feedback/viewFeedback.jsp").forward(request, response);
    }
}
