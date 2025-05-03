package com.customercare.controller;

import com.customercare.dao.FeedbackDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteFeedback")
public class DeleteFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        FeedbackDAO dao = new FeedbackDAO();
        boolean isDeleted = dao.deleteFeedback(id);

        if (isDeleted) {
            response.sendRedirect("feedback/message.jsp?status=success&action=Delete");
        } else {
            response.sendRedirect("feedback/message.jsp?status=error&action=Delete");
        }
    }
}
