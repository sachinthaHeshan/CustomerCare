<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.customercare.model.Feedback" %>
<%
    Feedback f = (Feedback) request.getAttribute("feedback");
%>
<%@ include file="../auth/auth.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Feedback</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/feedback.css">
    <link
    rel="stylesheet"
    href="${pageContext.request.contextPath}/styles/main.css"
  />
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
  />
    <script>
        function validateForm() {
            const comments = document.getElementById("comments").value.trim();

            if (comments.length < 10) {
                alert("Comments must be at least 10 characters long.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="main-container">
        <%@ include file="../layout/side-bar.jsp"%>
        <div class="main-content">
          <%@ include file="../layout/header.jsp"%>
    <div class="container">
        <h2>Edit Your Feedback</h2>
        
        <form class="feedback-form" action="<%= request.getContextPath() %>/EditFeedback" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="id" value="<%= f.getId() %>" />
            
            <div class="form-group">
                <label for="rating">Rating:</label>
                <select class="form-control rating-select" id="rating" name="rating" required>
                    <option value="1" <%= (f.getRating() == 1) ? "selected" : "" %>>1 - Very Poor</option>
                    <option value="2" <%= (f.getRating() == 2) ? "selected" : "" %>>2 - Poor</option>
                    <option value="3" <%= (f.getRating() == 3) ? "selected" : "" %>>3 - Average</option>
                    <option value="4" <%= (f.getRating() == 4) ? "selected" : "" %>>4 - Good</option>
                    <option value="5" <%= (f.getRating() == 5) ? "selected" : "" %>>5 - Excellent</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="comments">Comments:</label>
                <textarea class="form-control" id="comments" name="comments" rows="5" required minlength="10"><%= f.getComments() %></textarea>
            </div>
            
            <div class="form-actions">
                <a href="javascript:history.back()" class="btn btn-secondary">Cancel</a>
                <input type="submit" class="btn btn-block" value="Update Feedback">
            </div>
        </form>
    </div>
    </div>  
    </div>
</body>
</html>