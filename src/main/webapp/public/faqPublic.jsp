<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.customercare.model.Faq" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Frequently Asked Questions - PulseCare</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/faq.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f6f8fa;
        }
        .container {
            width: 95%;
            margin: 0 auto;
        }
        .header {
            background-color: #f8f8f8;
            padding: 30px 0;
            border-bottom: 1px solid #ddd;
        }
        .header .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h1 {
            display: inline-block;
            font-size: 24px;
            color: #333;
            margin: 0;
        }
        .header h1 span {
            color: #007bff;
        }
        nav ul {
            list-style: none;
            display: flex;
            align-items: center;
            margin: 0;
            padding: 0;
        }
        nav ul li {
            margin-left: 20px;
        }
        nav ul li a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }
        nav ul li a.login {
            color: #007bff;
        }
        nav ul li a.register {
            background-color: #007bff;
            color: #fff;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .faq-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .faq-item {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 20px;
            margin-bottom: 20px;
        }
        .question {
            font-size: 18px;
            font-weight: 600;
            margin: 15px 0;
            color: #333;
        }
        .answer {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 6px;
            margin-top: 15px;
        }
        .no-answer {
            color: #888;
            font-style: italic;
        }
        .customer-info {
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .category {
            display: inline-block;
            background-color: #e3f2fd;
            color: #0277bd;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            margin-top: 5px;
        }
        .empty-state {
            text-align: center;
            padding: 40px;
            background-color: #f9f9f9;
            border-radius: 8px;
            margin-top: 20px;
        }
        footer {
            background-color: #f8f8f8;
            padding: 20px 0;
            text-align: center;
            border-top: 1px solid #ddd;
        }
        footer p {
            color: #666;
            margin: 0;
        }
    </style>
</head>
<body>
    <header class="header">
      <div class="container">
        <h1>Pulse<span>Care</span></h1>
        <nav>
          <ul>
            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/public-faq">FAQ</a></li>
            <li><a href="#">Contact Us</a></li>
            <li><a href="${pageContext.request.contextPath}/login" class="login">Login</a></li>
            <li><a href="${pageContext.request.contextPath}/register" class="register">Register</a></li>
          </ul>
        </nav>
      </div>
    </header>

    <div class="faq-container">
        <h2><i class="fas fa-question-circle"></i> Frequently Asked Questions</h2>
        <p>Find answers to commonly asked questions about our services.</p>

        <% 
            List<Faq> faqs = (List<Faq>) request.getAttribute("faqs");
            if (faqs != null && !faqs.isEmpty()) {
                for (Faq f : faqs) {
        %>
                <div class="faq-item">
                    <div class="customer-info">
                        <i class="fas fa-user-circle" style="margin-right: 8px; color: #03a9f4;"></i>
                        <strong><%= f.getCustomerName() %></strong> 
                        (<%= f.getEmail() %>)
                    </div>
                    <div class="question"><%= f.getQuestion() %></div>
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