<%@ page import="java.util.List" %>
<%@ page import="com.customercare.model.Feedback" %>
<%@ page import="com.customercare.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    List<Feedback> feedbackList = (List<Feedback>) request.getAttribute("feedbackList");
    User sessionUser = (User) session.getAttribute("user");
    String filter = request.getParameter("filter");
    if (filter == null) {
        filter = "all";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Feedbacks</title>
</head>
<body>
    <h2>All Feedbacks</h2>

    <!-- Filter Form -->
    <form action="<%= request.getContextPath() %>/ViewFeedback" method="get">
        <label>Filter:</label>
        <select name="filter">
            <option value="all" <%= "all".equals(filter) ? "selected" : "" %>>All Feedbacks</option>
            <option value="mine" <%= "mine".equals(filter) ? "selected" : "" %>>My Feedbacks</option>
        </select>
        <input type="submit" value="Apply Filter">
    </form>

    <br>

    <!-- Search Bar -->
    <form action="${pageContext.request.contextPath}/SearchFeedback" method="get">
        <input type="text" name="query" placeholder="Search by name or comment..." required />
        <input type="submit" value="Search" />
    </form>

    <!-- Create Feedback Button -->
    <form action="<%= request.getContextPath() %>/feedback/createFeedback.jsp" method="get">
        <input type="submit" value="Create New Feedback" />
    </form>

    <br>

    <table border="1" cellpadding="8">
        <tr>
            <!-- <th>ID</th> -->
            <th>Name</th>
            <!-- <th>Email</th> -->
            <th>Rating</th>
            <th>Comments</th>
            <th>Actions</th>
        </tr>

        <%
            if (feedbackList != null && !feedbackList.isEmpty()) {
                for (Feedback f : feedbackList) {
        %>
            <tr>
                <%-- <td><%= f.getId() %></td> --%>
                <td><%= f.getName() %></td>
                <%-- <td><%= f.getEmail() %></td> --%>
                <td><%= f.getRating() %></td>
                <td><%= f.getComments() %></td>
                <td>
                    <% if (sessionUser != null && f.getCreatedUserId() == sessionUser.getId()) { %>
                        <a href="<%= request.getContextPath() %>/EditFeedback?id=<%= f.getId() %>">Edit</a> |
                        <a href="<%= request.getContextPath() %>/DeleteFeedback?id=<%= f.getId() %>" onclick="return confirm('Are you sure you want to delete this feedback?');">Delete</a>
                    <% } else { %>
                        -
                    <% } %>
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
