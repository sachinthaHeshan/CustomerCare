package com.customercare.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customercare.service.FaqService;
import com.customercare.model.Faq;

@WebServlet("/public-faq")
public class PublicFaqServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FaqService faqService;
    
    @Override
    public void init() throws ServletException {
        System.out.println("PublicFaqServlet initialized");
        faqService = new FaqService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("PublicFaqServlet doGet called");
        
        try {
            // Load all FAQs
            System.out.println("Loading all FAQs for public view");
            List<Faq> faqs = faqService.getAllFaqs();
            System.out.println("Loaded " + (faqs != null ? faqs.size() : "null") + " FAQs for public view");
            
            request.setAttribute("faqs", faqs);
            
            // Forward to public JSP
            System.out.println("Forwarding to /public/faqPublic.jsp");
            request.getRequestDispatcher("/public/faqPublic.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("Error in PublicFaqServlet doGet: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Error loading FAQs: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
} 