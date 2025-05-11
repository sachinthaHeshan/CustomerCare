<%@ page import="com.customercare.model.User"%>
<%
  String currentURI = request.getRequestURI();
  String contextPath = request.getContextPath();
  String path = currentURI.substring(contextPath.length());
%>
<div class="sidebar">
  <div class="logo">
    <h1>
      <span class="pulse-text">Pulse</span><span class="care-text">Care</span>
    </h1>
  </div>
  <nav>
    <ul>
      <li>
        <a href="${pageContext.request.contextPath}/dashboard" <%= path.equals("/dashboard") || path.equals("/dashboard.jsp") ? "class=\"active\"" : "" %>
          ><i class="fas fa-ticket">&nbsp;&nbsp;</i>Dashboard</a
        >
      </li>

      <% if ("customer".equals(user.getType())) { %>
      <li>
        <a href="${pageContext.request.contextPath}/list-ticket" <%= path.contains("/list-tickets.jsp") ? "class=\"active\"" : "" %>><i class="fas fa-ticket">&nbsp;&nbsp;</i>My Tickets</a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/add-ticket" <%= path.contains("/add-ticket.jsp") ? "class=\"active\"" : "" %>><i class="fas fa-plus">&nbsp;&nbsp;</i>New Ticket</a>
      </li>
      <li>
        <a href="ViewFeedback" <%= path.contains("Feedback") || path.contains("/createFeedback") || path.contains("feedbackMessage") ? "class=\"active\"" : "" %>
          ><i class="fas fa-commenting">&nbsp;&nbsp;</i>Feedback & Ratings</a
        >
      </li>

      <li>
        <a href="#" <%= path.contains("/inquiries") ? "class=\"active\"" : "" %>><i class="fas fa-briefcase">&nbsp;&nbsp;</i>Inquiries</a>
      </li>
      <li>
        <a href="#" <%= path.contains("/add-inquiry") ? "class=\"active\"" : "" %>
          ><i class="fas fa-external-link-square">&nbsp;&nbsp;</i>Add Inquiry</a
        >
      </li>
      <li>
        <a href="#" <%= path.contains("/faq") ? "class=\"active\"" : "" %>
          ><i class="fas fa-question">&nbsp;&nbsp;</i>FAQ ${user != null ?
          user.getType() : ""}</a
        >
      </li>
      <% } %>
      
      <% if ("admin".equals(user.getType()) || "support".equals(user.getType())) { %>
      <li>
        <a href="${pageContext.request.contextPath}/TicketServlet?action=LIST" <%= path.contains("/list-tickets.jsp") ? "class=\"active\"" : "" %>><i class="fas fa-ticket">&nbsp;&nbsp;</i>All Tickets</a>
      </li>
      <% } %>
      
      <li class="logout-item">
        <a href="${pageContext.request.contextPath}/Logout" class="logout-link">
          <i class="fas fa-sign-out-alt">&nbsp;&nbsp;</i>Logout
        </a>
      </li>
    </ul>
  </nav>
</div>
