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

        Feedback feedback = new Feedback();
        feedback.setName(request.getParameter("name"));
        feedback.setEmail(request.getParameter("email"));
        feedback.setRating(Integer.parseInt(request.getParameter("rating")));
        feedback.setComments(request.getParameter("comments"));

        FeedbackDAO dao = new FeedbackDAO();
        boolean isInserted = dao.insertFeedback(feedback);

        if (isInserted) {
            response.sendRedirect("feedback/message.jsp?status=success&action=Insert");
        } else {
            response.sendRedirect("feedback/message.jsp?status=error&action=Insert");
        }
    }
}
