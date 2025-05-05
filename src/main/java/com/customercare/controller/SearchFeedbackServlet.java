package com.customercare.controller;

import com.customercare.dao.FeedbackDAO;
import com.customercare.model.Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/SearchFeedback")
public class SearchFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(SearchFeedbackServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("query");
        logger.info("SearchFeedbackServlet - Query received: " + query);

        FeedbackDAO dao = new FeedbackDAO();
        List<Feedback> searchResults = dao.searchFeedback(query);

        request.setAttribute("feedbackList", searchResults);
        request.getRequestDispatcher("/feedback/viewFeedback.jsp").forward(request, response);
    }
}
