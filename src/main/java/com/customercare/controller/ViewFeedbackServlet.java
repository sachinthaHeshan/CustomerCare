package com.customercare.controller;

import com.customercare.service.FeedbackService;
import com.customercare.model.Feedback;
import com.customercare.model.User;

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
    private FeedbackService feedbackService;
    
    @Override
    public void init() throws ServletException {
        feedbackService = new FeedbackService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User sessionUser = (session != null) ? (User) session.getAttribute("user") : null;

        String filter = request.getParameter("filter");
        List<Feedback> feedbackList;

        if ("mine".equalsIgnoreCase(filter) && sessionUser != null) {
            logger.info("ViewFeedbackServlet - Fetching feedback for user ID: " + sessionUser.getId());
            feedbackList = feedbackService.getFeedbackByUserId(sessionUser.getId());
        } else {
            logger.info("ViewFeedbackServlet - Fetching all feedback entries");
            feedbackList = feedbackService.getAllFeedback();
        }

        logger.info("Fetched " + (feedbackList != null ? feedbackList.size() : 0) + " feedback entries");

        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("/feedback/viewFeedback.jsp").forward(request, response);
    }
}
