package com.customercare.controller;

import com.customercare.dao.FeedbackDAO;
import com.customercare.model.Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/EditFeedback")
public class EditFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(EditFeedbackServlet.class.getName());

    // Load feedback data into form (editFeedback.jsp)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            logger.info("EditFeedbackServlet - doGet() called with id: " + id);

            FeedbackDAO dao = new FeedbackDAO();
            Feedback feedback = dao.getFeedbackById(id);

            if (feedback != null) {
                logger.info("Feedback found for id " + id);
                request.setAttribute("feedback", feedback);
                request.getRequestDispatcher("/feedback/editFeedback.jsp").forward(request, response);
            } else {
                logger.warning("No feedback found for id " + id);
                response.sendRedirect("feedback/message.jsp?status=error&action=EditNotFound");
            }
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid ID format in doGet()", e);
            response.sendRedirect("feedback/message.jsp?status=error&action=InvalidID");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Exception in doGet()", e);
            response.sendRedirect("feedback/message.jsp?status=error&action=Exception");
        }
    }

    // Handle form submission to update feedback
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Feedback feedback = new Feedback();
            feedback.setId(Integer.parseInt(request.getParameter("id")));
            feedback.setName(request.getParameter("name"));
            feedback.setEmail(request.getParameter("email"));
            feedback.setRating(Integer.parseInt(request.getParameter("rating")));
            feedback.setComments(request.getParameter("comments"));

            logger.info("Updating feedback with ID: " + feedback.getId());

            FeedbackDAO dao = new FeedbackDAO();
            boolean isUpdated = dao.updateFeedback(feedback);

            if (isUpdated) {
                logger.info("Feedback updated successfully for ID: " + feedback.getId());
                response.sendRedirect("feedback/message.jsp?status=success&action=Update");
            } else {
                logger.warning("Failed to update feedback for ID: " + feedback.getId());
                response.sendRedirect("feedback/message.jsp?status=error&action=Update");
            }
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid data format in doPost()", e);
            response.sendRedirect("feedback/message.jsp?status=error&action=InvalidData");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Exception in doPost()", e);
            response.sendRedirect("feedback/message.jsp?status=error&action=Exception");
        }
    }
}
