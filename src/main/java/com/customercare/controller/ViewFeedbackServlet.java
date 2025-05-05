package com.customercare.controller;

import com.customercare.dao.FeedbackDAO;
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FeedbackDAO dao = new FeedbackDAO();
        HttpSession session = request.getSession(false);
        User sessionUser = (session != null) ? (User) session.getAttribute("user") : null;

        String filter = request.getParameter("filter");
        List<Feedback> feedbackList;

        if ("mine".equalsIgnoreCase(filter) && sessionUser != null) {
            logger.info("ViewFeedbackServlet - Fetching feedback for user ID: " + sessionUser.getId());
            feedbackList = dao.getFeedbackByUserId(sessionUser.getId());
        } else {
            logger.info("ViewFeedbackServlet - Fetching all feedback entries");
            feedbackList = dao.getAllFeedback();
        }

        logger.info("Fetched " + (feedbackList != null ? feedbackList.size() : 0) + " feedback entries");

        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("/feedback/viewFeedback.jsp").forward(request, response);
    }
}
