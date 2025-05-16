package com.customercare.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.customercare.model.Inquiry;
import com.customercare.model.User;
import com.customercare.service.InquiryDAO;

@WebServlet("/InquiryServlet")
public class InquiryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private InquiryDAO inquiryDAO;
    
    public InquiryServlet() {
        super();
        inquiryDAO = new InquiryDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "LIST"; 
        }
        
        switch (action) {
            case "LIST":
                listInquiries(request, response);
                break;
            case "VIEW":
                viewInquiry(request, response);
                break;
            case "NEW":
                showNewForm(request, response);
                break;
            default:
                listInquiries(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost method called");

        String action = request.getParameter("action");
        
        switch (action) {
            case "CREATE":
                createInquiry(request, response);
                break;
            case "UPDATE":
                updateInquiry(request, response);
                break;
            default:
                doGet(request, response);
                break;
        }
    }
    
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
         
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
            return;
        }
        
        int inquiryId = Integer.parseInt(request.getParameter("id"));
        
        boolean success = inquiryDAO.deleteInquiry(inquiryId);
        
        if (success) {
            request.setAttribute("successMessage", "Inquiry deleted successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to delete inquiry. Please try again.");
        }
        
        response.sendRedirect(request.getContextPath() + "/InquiryServlet?action=LIST");
    }
    
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/inquiry/create-inquiry.jsp");
        dispatcher.forward(request, response);
    }
    
    private void createInquiry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
            return;
        }
        
        String category = request.getParameter("category");
        String subject = request.getParameter("subject");
        String description = request.getParameter("description");
        String contactMethod = request.getParameter("contactMethod");
        
        Inquiry inquiry = new Inquiry(user.getId(), category, subject, description, contactMethod);
        
        boolean success = inquiryDAO.createInquiry(inquiry);
        
        if (success) {
            request.setAttribute("successMessage", "Inquiry submitted successfully!");
            response.sendRedirect(request.getContextPath() + "/InquiryServlet?action=LIST");
        } else {
            request.setAttribute("errorMessage", "Failed to submit inquiry. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/inquiry/create-inquiry.jsp");
            dispatcher.forward(request, response);
        }
    }
    
    private void listInquiries(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
            return;
        }
        
        List<Inquiry> inquiries;
        
        // Admin and support can see all inquiries
        if ("admin".equals(user.getType()) || "support".equals(user.getType())) {
            inquiries = inquiryDAO.getAllInquiries();
        } else {
            // Customers can only see their own inquiries
            inquiries = inquiryDAO.getInquiriesByUserId(user.getId());
        }
        
        request.setAttribute("inquiries", inquiries);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/inquiry/list-inquiries.jsp");
        dispatcher.forward(request, response);
    }
    
    private void viewInquiry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
            return;
        }
        
        int inquiryId = Integer.parseInt(request.getParameter("id"));
        Inquiry inquiry = inquiryDAO.getInquiryById(inquiryId);
        
        // Check if user is authorized to view this inquiry
        boolean authorized = "admin".equals(user.getType()) || 
                            "support".equals(user.getType()) || 
                            (inquiry != null && inquiry.getUserId() == user.getId());
        
        if (!authorized) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
            return;
        }
        
        request.setAttribute("inquiry", inquiry);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/inquiry/view-inquiry.jsp");
        dispatcher.forward(request, response);
    }
  
    private void deleteInquiry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Keeping for backward compatibility
        doDelete(request, response);
    }
    
    private void updateInquiry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
            return;
        }
        
        int inquiryId = Integer.parseInt(request.getParameter("id"));
        Inquiry currentInquiry = inquiryDAO.getInquiryById(inquiryId);
        
        // Check if user is authorized to edit this inquiry
        boolean authorized = "admin".equals(user.getType()) || 
                            "support".equals(user.getType()) || 
                            (currentInquiry != null && currentInquiry.getUserId() == user.getId());
        
        if (!authorized) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
            return;
        }
        
        String category = request.getParameter("category");
        String subject = request.getParameter("subject");
        String description = request.getParameter("description");
        String contactMethod = request.getParameter("contactMethod");
        
        // Create Inquiry object with updated values, but keep original user ID and created timestamp
        Inquiry updatedInquiry = new Inquiry(
            inquiryId,
            currentInquiry.getUserId(),
            category,
            subject,
            description, 
            contactMethod,
            currentInquiry.getCreatedAt()
        );
        
        boolean success = inquiryDAO.updateInquiry(updatedInquiry);
        
        if (success) {
            request.setAttribute("successMessage", "Inquiry updated successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to update inquiry. Please try again.");
        }
        
        // Redirect back to the view page
        response.sendRedirect(request.getContextPath() + "/InquiryServlet?action=VIEW&id=" + inquiryId);
    }
} 