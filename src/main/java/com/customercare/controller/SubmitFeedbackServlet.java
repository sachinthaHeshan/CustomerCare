package com.customercare.controller;

import com.customercare.dao.FeedbackDAO;
import com.customercare.model.Feedback;
import com.customercare.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/SubmitFeedback")
public class SubmitFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(SubmitFeedbackServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            logger.warning("Unauthenticated user tried to submit feedback.");
            response.sendRedirect("login");
            return;
        }

        String ratingStr = request.getParameter("rating");
        String comments = request.getParameter("comments");

        logger.info("SubmitFeedbackServlet - Submitting feedback: user ID: " + user.getId() + ", rating: " + ratingStr + ", comments: " + comments);

        // Simple validation
        if (ratingStr == null || comments == null || comments.trim().length() < 10) {
            logger.warning("Validation failed - Invalid input");
            response.sendRedirect("feedbackMessage?status=error&action=Validation");
            return;
        }

        int rating;
        try {
            rating = Integer.parseInt(ratingStr);
            if (rating < 1 || rating > 5) {
                throw new NumberFormatException("Rating out of range.");
            }
        } catch (NumberFormatException e) {
            logger.warning("Invalid rating value: " + ratingStr);
            response.sendRedirect("feedbackMessage?status=error&action=Validation");
            return;
        }

        Feedback feedback = new Feedback();
        feedback.setRating(rating);
        feedback.setComments(comments.trim());
        feedback.setCreatedUserId(user.getId());

        FeedbackDAO dao = new FeedbackDAO();
        boolean isInserted = dao.insertFeedback(feedback);

        if (isInserted) {
            logger.info("Feedback successfully inserted for user ID: " + user.getId());
            response.sendRedirect("feedbackMessage?status=success&action=Insert");
        } else {
            logger.warning("Failed to insert feedback for user ID: " + user.getId());
            response.sendRedirect("feedbackMessage?status=error&action=Insert");
        }
    }
}
