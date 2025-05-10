<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.customercare.model.Feedback" %>
<%
    Feedback f = (Feedback) request.getAttribute("feedback");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Feedback</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/feedback.css">
    <script>
        function validateForm() {
            const name = document.getElementById("name").value.trim();
            const comments = document.getElementById("comments").value.trim();

            if (name.length < 3) {
                alert("Name must be at least 3 characters long.");
                return false;
            }

            if (comments.length < 10) {
                alert("Comments must be at least 10 characters long.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Edit Your Feedback</h2>
        
        <form class="feedback-form" action="<%= request.getContextPath() %>/EditFeedback" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="id" value="<%= f.getId() %>" />
            
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="<%= f.getName() %>" required minlength="3">
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= f.getEmail() %>" required>
            </div>
            
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
</body>
</html>