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
</head>
<body>
    <h2>Edit Your Feedback</h2>
    <form action="../UpdateFeedback" method="post">
        <input type="hidden" name="id" value="<%= f.getId() %>" />
        Name: <input type="text" name="name" value="<%= f.getName() %>" required><br><br>
        Email: <input type="email" name="email" value="<%= f.getEmail() %>" required><br><br>
        Rating:
        <select name="rating" required>
            <option value="1" <%= (f.getRating() == 1) ? "selected" : "" %>>1</option>
            <option value="2" <%= (f.getRating() == 2) ? "selected" : "" %>>2</option>
            <option value="3" <%= (f.getRating() == 3) ? "selected" : "" %>>3</option>
            <option value="4" <%= (f.getRating() == 4) ? "selected" : "" %>>4</option>
            <option value="5" <%= (f.getRating() == 5) ? "selected" : "" %>>5</option>
        </select><br><br>
        Comments:<br>
        <textarea name="comments" rows="4" cols="40" required><%= f.getComments() %></textarea><br><br>
        <input type="submit" value="Update Feedback">
    </form>
</body>
</html>
