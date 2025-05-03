package com.customercare.controller;

import com.customercare.dao.FeedbackDAO;
import com.customercare.model.Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateFeedback")
public class UpdateFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Feedback feedback = new Feedback();
        feedback.setId(Integer.parseInt(request.getParameter("id")));
        feedback.setName(request.getParameter("name"));
        feedback.setEmail(request.getParameter("email"));
        feedback.setRating(Integer.parseInt(request.getParameter("rating")));
        feedback.setComments(request.getParameter("comments"));

        FeedbackDAO dao = new FeedbackDAO();
        boolean isUpdated = dao.updateFeedback(feedback);

        if (isUpdated) {
            response.sendRedirect("feedback/message.jsp?status=success&action=Update");
        } else {
            response.sendRedirect("feedback/message.jsp?status=error&action=Update");
        }
    }
}
