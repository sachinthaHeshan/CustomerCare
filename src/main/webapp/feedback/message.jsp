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
    <title>Feedback Status</title>
</head>
<body>
    <h2><%= message %></h2>
    <br>
    <a href="viewFeedback.jsp">Back to Feedback List</a>
</body>
</html>
