package com.customercare.controller;

import com.customercare.dao.FeedbackDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/DeleteFeedback")
public class DeleteFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(DeleteFeedbackServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            logger.info("DeleteFeedbackServlet - Attempting to delete feedback with ID: " + id);

            FeedbackDAO dao = new FeedbackDAO();
            boolean isDeleted = dao.deleteFeedback(id);

            if (isDeleted) {
                logger.info("Feedback deleted successfully for ID: " + id);
                response.sendRedirect("feedback/message.jsp?status=success&action=Delete");
            } else {
                logger.warning("Failed to delete feedback for ID: " + id);
                response.sendRedirect("feedback/message.jsp?status=error&action=Delete");
            }

        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid ID format in DeleteFeedbackServlet", e);
            response.sendRedirect("feedback/message.jsp?status=error&action=InvalidID");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Exception occurred in DeleteFeedbackServlet", e);
            response.sendRedirect("feedback/message.jsp?status=error&action=Exception");
        }
    }
}
