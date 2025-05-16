package com.customercare.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customercare.service.FaqService;
import com.customercare.model.Faq;

import java.io.IOException;

@WebServlet("/editFaq")
public class EditFaqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FaqService faqService;
	
	@Override
    public void init() throws ServletException {
        faqService = new FaqService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Faq faq = faqService.getFaqById(id);
            request.setAttribute("faq", faq);
            request.getRequestDispatcher("editFaq.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Failed to load FAQ for editing: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
