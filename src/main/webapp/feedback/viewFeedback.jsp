<%@ page import="java.util.List" %>
<%@ page import="com.customercare.model.Feedback" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    List<Feedback> feedbackList = (List<Feedback>) request.getAttribute("feedbackList");
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Feedback</title>
</head>
<body>
    <h2>All Feedback</h2>
    <table border="1" cellpadding="8">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Rating</th>
            <th>Comments</th>
            <th>Actions</th>
        </tr>

        <%
    if (feedbackList != null && !feedbackList.isEmpty()) {
        for (Feedback f : feedbackList) {
%>
            <tr>
                <td><%= f.getId() %></td>
                <td><%= f.getName() %></td>
                <td><%= f.getEmail() %></td>
                <td><%= f.getRating() %></td>
                <td><%= f.getComments() %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/EditFeedback?id=<%= f.getId() %>">Edit | </a>
                    <a href="<%= request.getContextPath() %>/DeleteFeedback?id=<%= f.getId() %>" onclick="return confirm('Are you sure you want to delete this feedback?');">Delete</a>

                </td>
            </tr>
<%
        }
    } else {
%>
        <tr><td colspan="6">No feedback found.</td></tr>
<%
    }
%>


    </table>
</body>
</html>
