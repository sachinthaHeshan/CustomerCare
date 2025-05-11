<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.customercare.model.Faq" %>
<%@ include file="../auth/auth.jsp"%>
<%
    Faq faq = (Faq) request.getAttribute("faq");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit FAQ</title>
    <!-- Global styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
    <!-- Page-specific styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/edit-faq.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
    <div class="main-container">
        <%@ include file="../layout/side-bar.jsp"%>
        <div class="main-content">
            <%@ include file="../layout/header.jsp"%>
            <div class="edit-faq-container">
                <h2 class="edit-faq-title">Edit FAQ</h2>
                <form class="edit-faq-form" action="${pageContext.request.contextPath}/faq?action=update" method="post">
                    <input type="hidden" name="id" value="<%= faq.getId() %>">
                    
                    <label for="customerName">Name:</label>
                    <input type="text" id="customerName" name="customerName" value="<%= faq.getCustomerName() %>" required>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= faq.getEmail() %>" required>

                    <label for="question">Question:</label>
                    <textarea id="question" name="question" required><%= faq.getQuestion() %></textarea>

                    <label for="category">Category:</label>
                    <select id="category" name="category">
                        <option value="Billing" <%= "Billing".equals(faq.getCategory()) ? "selected" : "" %>>Billing</option>
                        <option value="Technical" <%= "Technical".equals(faq.getCategory()) ? "selected" : "" %>>Technical</option>
                        <option value="General" <%= "General".equals(faq.getCategory()) ? "selected" : "" %>>General</option>
                    </select>

                    <label for="answer">Answer:</label>
                    <textarea id="answer" name="answer"><%= faq.getAnswer() %></textarea>

                    <div class="btn-container">
                        <input type="submit" value="Update" class="btn-update">
                        <a href="${pageContext.request.contextPath}/faq" class="btn-cancel">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
