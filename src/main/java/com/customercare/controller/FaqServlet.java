package com.customercare.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customercare.dao.FaqDAO;
import com.customercare.model.Faq;

import java.io.IOException;

@WebServlet("/faq")
public class FaqServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    public void init() throws ServletException {
        System.out.println("FaqServlet initialized");
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if user is logged in
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        System.out.println("FaqServlet doGet called with action: " + action);
        
        try {
            if (action == null || action.equals("list")) {
                
                System.out.println("Loading all FAQs");
                FaqDAO faqDAO = new FaqDAO();
                List<Faq> faqs = faqDAO.getAllFaqs();
                System.out.println("Loaded " + (faqs != null ? faqs.size() : "null") + " FAQs");
                
                
                request.setAttribute("faqs", faqs);
                
               
                Object attrCheck = request.getAttribute("faqs");
                System.out.println("Attribute check - faqs: " + (attrCheck != null ? "set correctly" : "null!"));
                
                
                System.out.println("Forwarding to /faq/faqList.jsp");
                request.getRequestDispatcher("/faq/faqList.jsp").forward(request, response);
            } else if (action.equals("edit")) {
                
                int id = Integer.parseInt(request.getParameter("id"));
                System.out.println("Editing FAQ with ID: " + id);
                Faq faq = new FaqDAO().getFaqById(id);
                request.setAttribute("faq", faq);
                request.getRequestDispatcher("/faq/editFaq.jsp").forward(request, response);
            } else if (action.equals("new")) {
               
                
                System.out.println("Creating new FAQ");
                request.getRequestDispatcher("/faq/faqForm.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.err.println("Error in FaqServlet doGet: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Error processing FAQ request: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        String action = request.getParameter("action");
        
        try {
            if (action == null || action.equals("add")) {
               
                Faq faq = new Faq();
                faq.setCustomerName(request.getParameter("customerName"));
                faq.setEmail(request.getParameter("email"));
                faq.setQuestion(request.getParameter("question"));
                faq.setCategory(request.getParameter("category"));
                faq.setAnswer(request.getParameter("answer"));
                
                new FaqDAO().insertFaq(faq);
                
                
                response.sendRedirect(request.getContextPath() + "/faq");
            } else if (action.equals("update")) {
                // Update existing FAQ
                Faq faq = new Faq();
                faq.setId(Integer.parseInt(request.getParameter("id")));
                faq.setCustomerName(request.getParameter("customerName"));
                faq.setEmail(request.getParameter("email"));
                faq.setQuestion(request.getParameter("question"));
                faq.setCategory(request.getParameter("category"));
                faq.setAnswer(request.getParameter("answer"));
                
                new FaqDAO().updateFaq(faq);
                
                // Redirect to list view
                response.sendRedirect(request.getContextPath() + "/faq");
            }
        } catch (Exception e) {
            System.err.println("Error in FaqServlet doPost: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Error processing FAQ form: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
    
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        if (request.getSession().getAttribute("user") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("Login required");
            return;
        }
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            new FaqDAO().deleteFaq(id);
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (Exception e) {
            System.err.println("Error in FaqServlet doDelete: " + e.getMessage());
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
} 