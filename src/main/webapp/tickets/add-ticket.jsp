<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.customercare.model.Ticket" %>
<%
    Ticket ticket = (Ticket) request.getAttribute("ticket");
    boolean isEdit = ticket != null;
%>
<%@ include file="../auth/auth.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title><%= isEdit ? "Edit Ticket" : "Add New Ticket" %></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/tickets.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/add-ticket.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
   <div class="main-container">
      <%@ include file="../layout/side-bar.jsp"%>
      <div class="main-content">
        <%@ include file="../layout/header.jsp"%>

        <div class="content-wrapper">
            
            <div class="ticket-title">
                <h1><%= isEdit ? "Edit Ticket" : "Add New Ticket" %></h1>
            </div>
              
          

            <main>
                <form action="${pageContext.request.contextPath}/TicketServlet" method="post" class="ticket-form">
                    <input type="hidden" name="id" value="<%= isEdit ? ticket.getId() : "" %>">

                    <div class="form-group">
                        <label for="customerName">Customer Name</label>
                        <input type="text" id="customerName" name="customerName" required value="<%= isEdit ? ticket.getCustomerName() : "" %>" />
                    </div>

                    <div class="form-group">
                        <label for="ticketType">Ticket Type</label>
                        <select id="ticketType" name="ticketType" required>
                            <option value="">-- Select Type --</option>
                            <option value="Technical" <%= isEdit && "Technical".equals(ticket.getTicketType()) ? "selected" : "" %>>Technical</option>
                            <option value="Billing" <%= isEdit && "Billing".equals(ticket.getTicketType()) ? "selected" : "" %>>Billing</option>
                            <option value="General" <%= isEdit && "General".equals(ticket.getTicketType()) ? "selected" : "" %>>General</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="issue">Issue</label>
                        <textarea id="issue" name="issue" required><%= isEdit ? ticket.getIssue() : "" %></textarea>
                    </div>

                    <div class="form-group">
                        <label for="productService">Product / Service</label>
                        <select id="productService" name="productService" required>
                            <option value="">-- Select Product --</option>
                            <option value="Internet" <%= isEdit && "Internet".equals(ticket.getProductService()) ? "selected" : "" %>>Internet</option>
                            <option value="TV" <%= isEdit && "TV".equals(ticket.getProductService()) ? "selected" : "" %>>TV</option>
                            <option value="Mobile" <%= isEdit && "Mobile".equals(ticket.getProductService()) ? "selected" : "" %>>Mobile</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="contactNumber">Contact Number</label>
                        <input type="text" id="contactNumber" name="contactNumber" pattern="\d{10}" required value="<%= isEdit ? ticket.getContactNumber() : "" %>" placeholder="10-digit number"/>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required value="<%= isEdit ? ticket.getEmail() : "" %>"/>
                    </div>

                    <div class="ticket-actions">
                        <input type="submit" value="<%= isEdit ? "Update Ticket" : "Submit Ticket" %>">
                        <a href="${pageContext.request.contextPath}/TicketServlet?action=LIST">Back to Tickets</a>
                    </div>
                </form>
            </main>
        </div>
      </div>
   </div>
</body>
</html>