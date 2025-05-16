package com.customercare.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customercare.service.FaqService;
import com.customercare.model.Faq;

import java.io.IOException;

@WebServlet("/updateFaq")
public class UpdateFaqServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FaqService faqService;
    
    @Override
    public void init() throws ServletException {
        faqService = new FaqService();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Faq faq = new Faq();
            faq.setId(Integer.parseInt(request.getParameter("id")));
            faq.setCustomerName(request.getParameter("customerName"));
            faq.setEmail(request.getParameter("email"));
            faq.setQuestion(request.getParameter("question"));
            faq.setCategory(request.getParameter("category"));
            faq.setAnswer(request.getParameter("answer"));

            faqService.updateFaq(faq);
            response.sendRedirect("listFaqs");// or reload via AddFaqServlet if needed
        } catch (Exception e) {
            request.setAttribute("error", "Failed to update FAQ: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
