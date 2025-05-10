<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String status = request.getParameter("status");
    String action = request.getParameter("action");

    String message = "";
    if ("success".equals(status)) {
        message = action + " completed successfully!";
    } else if ("error".equals(status)) {
        message = "An error occurred while trying to " + action.toLowerCase() + ".";
    } else {
        message = "Unknown operation.";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback Status</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/feedback.css">
</head>
<body>
    <div class="container status-container">
        <div class="status-icon <%= "success".equals(status) ? "status-success" : "status-error" %>">
            <%= "success".equals(status) ? "✓" : "⚠️" %>
        </div>
        <h2><%= message %></h2>
        <div class="form-actions">
            <a href="../ViewFeedback" class="btn">Back to Feedback List</a>
            <a href="${pageContext.request.contextPath}" class="btn btn-secondary">Return Home</a>
        </div>
    </div>
</body>
</html>