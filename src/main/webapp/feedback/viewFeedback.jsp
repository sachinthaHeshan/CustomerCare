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

        <c:forEach var="f" items="${feedbackList}">
            <tr>
                <td>${f.id}</td>
                <td>${f.name}</td>
                <td>${f.email}</td>
                <td>${f.rating}</td>
                <td>${f.comments}</td>
                <td>
                    <a href="../EditFeedback?id=${f.id}">Edit</a> |
                    <a href="../DeleteFeedback?id=${f.id}" onclick="return confirm('Are you sure you want to delete this feedback?');">Delete</a>
                </td>
            </tr>
        </c:forEach>

    </table>
</body>
</html>
