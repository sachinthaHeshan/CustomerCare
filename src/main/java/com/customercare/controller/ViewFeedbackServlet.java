package com.customercare.controller;

import com.customercare.dao.FeedbackDAO;
import com.customercare.model.Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/ViewFeedback")
public class ViewFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ViewFeedbackServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        logger.info("ViewFeedbackServlet - Fetching all feedback entries");

        FeedbackDAO dao = new FeedbackDAO();
        List<Feedback> feedbackList = dao.getAllFeedback();

        logger.info("Fetched " + (feedbackList != null ? feedbackList.size() : 0) + " feedback entries");

        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("/feedback/viewFeedback.jsp").forward(request, response);
    }
}
