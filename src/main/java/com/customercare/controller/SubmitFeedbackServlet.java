package com.customercare.controller;

import com.customercare.dao.FeedbackDAO;
import com.customercare.model.Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/SubmitFeedback")
public class SubmitFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String ratingStr = request.getParameter("rating");
        String comments = request.getParameter("comments");

        System.out.println("Inserting: " + name + ", " + email + ", " + ratingStr + ", " + comments);

        int rating = 0;
        try {
            rating = Integer.parseInt(ratingStr);
        } catch (NumberFormatException e) {
            System.out.println("Invalid rating value: " + ratingStr);
        }

        Feedback feedback = new Feedback();
        feedback.setName(name);
        feedback.setEmail(email);
        feedback.setRating(rating);
        feedback.setComments(comments);

        FeedbackDAO dao = new FeedbackDAO();
        boolean isInserted = dao.insertFeedback(feedback);

        if (isInserted) {
            response.sendRedirect("feedback/message.jsp?status=success&action=Insert");
        } else {
            response.sendRedirect("feedback/message.jsp?status=error&action=Insert");
        }
    }
}
