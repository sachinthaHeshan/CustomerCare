package com.customercare.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.logging.Logger;
 
public class FeedbackMessageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(FeedbackMessageServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String status = request.getParameter("status");
        String action = request.getParameter("action");
        
        logger.info("FeedbackMessageServlet - Processing message: Status=" + status + ", Action=" + action);
        
        request.getRequestDispatcher("/feedback/message.jsp").forward(request, response);
    }
} 