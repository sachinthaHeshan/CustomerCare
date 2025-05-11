<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.customercare.model.Faq" %>
<%@ page import="com.customercare.dao.FaqDAO" %>
<%@ page import="java.util.List" %>
<%@ include file="../auth/auth.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Submitted FAQs</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/faq.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

    <div class="main-container">
		<%@ include file="../layout/side-bar.jsp"%>
		<div class="main-content">
			<%@ include file="../layout/header.jsp"%>
            <div class="container">

    <h2><i class="fas fa-question-circle"></i> Frequently Asked Questions</h2>

    <% 
        List<Faq> faqs = (List<Faq>) request.getAttribute("faqs");
        System.out.println("FAQs attribute from request: " + faqs);
        
        if (faqs == null) {
            System.out.println("FAQs attribute was null, trying to get FAQs directly from database");
            try {
                FaqDAO faqDAO = new FaqDAO();
                faqs = faqDAO.getAllFaqs();
                System.out.println("1Retrieved " + (faqs != null ? faqs.size() : "null") + " FAQs directly from database");
            } catch (Exception e) {
                System.out.println("Error getting FAQs from database: " + e.getMessage());
                e.printStackTrace();
            }
        }
    %>

    <div class="actions">
        <a href="${pageContext.request.contextPath}/faq?action=new" class="btn-new">
            <i class="fas fa-plus"></i> Add New FAQ
        </a>
        <div class="faq-count">
            <% if (faqs != null) { %>
                <i class="fas fa-list"></i> Showing <%= faqs.size() %> FAQ entries
            <% } %>
        </div>
    </div>

    <% 
        if (faqs != null && !faqs.isEmpty()) {
            System.out.println("Number of FAQs to display: " + faqs.size());
            for (Faq f : faqs) {
                System.out.println("Rendering FAQ: " + f.getId() + " - " + f.getQuestion());
    %>
                <div class="faq-item">
                    <div class="customer-info">
                        <i class="fas fa-user-circle" style="margin-right: 8px; color: #03a9f4;"></i>
                        <strong><%= f.getCustomerName() %></strong> 
                        (<%= f.getEmail() %>)
                    </div>
                    <div class="question">"<%= f.getQuestion() %>"</div>
                    <div class="category"><i class="fas fa-tag" style="margin-right: 5px;"></i> <%= f.getCategory() %></div>
                    
                    <% if (f.getAnswer() != null && !f.getAnswer().isEmpty()) { %>
                        <div class="answer">
                            <div style="font-weight: 500; margin-bottom: 8px; color: #333;">
                                <i class="fas fa-comment-dots" style="margin-right: 5px; color: #03a9f4;"></i> Answer:
                            </div>
                            <%= f.getAnswer() %>
                        </div>
                    <% } else { %>
                        <div class="answer no-answer">
                            <i class="fas fa-clock" style="margin-right: 5px;"></i> Not answered yet.
                        </div>
                    <% } %>
                    
                    <div class="faq-actions">
                        <a href="${pageContext.request.contextPath}/faq?action=edit&id=<%= f.getId() %>" class="edit-btn">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <a href="#" onclick="deleteFaq('<%= f.getId() %>'); return false;" class="delete-btn">
                            <i class="fas fa-trash"></i> Delete
                        </a>
                    </div>
                </div>
                    <%
                            }
                        } else {
                            System.out.println("No FAQs available to display");
                    %>
                            <div class="empty-state">
                                <i class="fas fa-inbox" style="font-size: 48px; color: #ddd; margin-bottom: 20px;"></i>
                                <p>No FAQs available at this time.</p>
                                <a href="${pageContext.request.contextPath}/faq?action=new" class="btn-new">
                                    <i class="fas fa-plus"></i> Create First FAQ
                                </a>
                                <p class="debug-info">Debug info: <%= faqs == null ? "FAQs attribute is null" : "FAQs list is empty" %></p>
                            </div>
                    <%
                        }
                    %>
    </div>  
    </div>
    </div>

    <script>
    function deleteFaq(id) {
        if (confirm('Are you sure you want to delete this FAQ?')) {
            fetch('${pageContext.request.contextPath}/faq?id=' + id, {
                method: 'DELETE'
            })
            .then(response => {
                if (response.ok) {
                    window.location.reload();
                } else {
                    alert('Failed to delete FAQ');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Error occurred during deletion');
            });
        }
    }
    </script>
</body>
</html>
