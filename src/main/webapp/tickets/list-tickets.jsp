<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.customercare.model.Ticket" %>
<%@ include file="../auth/auth.jsp"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Submitted Tickets</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/tickets.css">
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/feedback.css">
	<link rel="stylesheet" href="styles/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
   <div class="main-container">
      <%@ include file="../layout/side-bar.jsp"%>
      <div class="main-content">
        <%@ include file="../layout/header.jsp"%>
<div class="main-content">
    <h2>All Submitted Tickets</h2>

    <div class="ticket-actions">
        <a href="${pageContext.request.contextPath}/add-ticket">Create New Ticket</a>
    </div>

    <%
        List<Ticket> tickets = (List<Ticket>) request.getAttribute("ticketList");
        Integer currentTicketId = (Integer) session.getAttribute("currentTicketId");
    %>

    <!-- Debug info -->
    <div style="display: none;">
        <p>Ticket list attribute exists: <%= tickets != null %></p>
        <p>Ticket list is empty: <%= tickets == null ? "N/A" : tickets.isEmpty() %></p>
        <p>Current ticket ID: <%= currentTicketId %></p>
    </div>

    <% if (tickets != null && !tickets.isEmpty()) { %>
        <table class="ticket-table">
            <tr>
                <th>ID</th>
                <th>Customer Name</th>
                <th>Ticket Type</th>
                <th>Issue</th>
                <th>Product/Service</th>
                <th>Contact Number</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
            <% for (Ticket t : tickets) { %>
                <tr>
                    <td><%= t.getId() %></td>
                    <td><%= t.getCustomerName() %></td>
                    <td><%= t.getTicketType() %></td>
                    <td><%= t.getIssue() %></td>
                    <td><%= t.getProductService() %></td>
                    <td><%= t.getContactNumber() %></td>
                    <td><%= t.getEmail() %></td>
                    <td class="action-links">
                        <% if (currentTicketId != null && currentTicketId == t.getId()) { %>
                            <a href="TicketServlet?action=EDIT&id=<%= t.getId() %>">Edit</a> |
                            <a href="TicketServlet?action=DELETE&id=<%= t.getId() %>">Delete</a>
                        <% } else { %>
                            -
                        <% } %>
                    </td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <div class="no-tickets">
            <p>No tickets found in the database.</p>
        </div>
    <% } %>
</div>
 </div>
 </div>
 
</body>
</html>
