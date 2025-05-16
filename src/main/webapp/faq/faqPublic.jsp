<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.customercare.model.Faq" %>
<%@ page import="com.customercare.dao.FaqDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Frequently Asked Questions</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/faq.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <header class="header">
      <div class="container">
        <h1>Pulse<span>Care</span></h1>
        <nav>
          <ul>
            <li><a href="${pageContext.request.contextPath}/faq">FAQ</a></li>
            <li><a href="#">Contact Us</a></li>
            <li><a href="${pageContext.request.contextPath}/login" class="login">Login</a></li>
            <li><a href="${pageContext.request.contextPath}/register" class="register">Register</a></li>
          </ul>
        </nav>
      </div>
    </header>

    <div class="container" style="padding: 20px; max-width: 1200px; margin: 0 auto;">
        <h2><i class="fas fa-question-circle"></i> Frequently Asked Questions</h2>

        <% 
            List<Faq> faqs = (List<Faq>) request.getAttribute("faqs");
            System.out.println("FAQs attribute from request: " + faqs);
            
            if (faqs == null) {
                System.out.println("FAQs attribute was null, trying to get FAQs directly from database");
                try {
                    FaqDAO faqDAO = new FaqDAO();
                    faqs = faqDAO.getAllFaqs();
                    System.out.println("Retrieved " + (faqs != null ? faqs.size() : "null") + " FAQs directly from database");
                } catch (Exception e) {
                    System.out.println("Error getting FAQs from database: " + e.getMessage());
                    e.printStackTrace();
                }
            }
        %>

        <div class="faq-count">
            <% if (faqs != null) { %>
                <i class="fas fa-list"></i> Showing <%= faqs.size() %> FAQ entries
            <% } %>
        </div>

        <% 
            if (faqs != null && !faqs.isEmpty()) {
                for (Faq f : faqs) {
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
                </div>
        <%
                }
            } else {
        %>
                <div class="empty-state">
                    <i class="fas fa-inbox" style="font-size: 48px; color: #ddd; margin-bottom: 20px;"></i>
                    <p>No FAQs available at this time.</p>
                </div>
        <%
            }
        %>
    </div>
    
    <footer>
      <div class="container">
        <p>&copy; 2023 PulseCare. All rights reserved.</p>
      </div>
    </footer>
</body>
</html> 