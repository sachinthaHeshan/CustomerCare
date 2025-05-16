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
        <a href="${pageContext.request.contextPath}/TicketServlet?action=LIST" <%= path.contains("/list-tickets.jsp") ? "class=\"active\"" : "" %>><i class="fas fa-ticket">&nbsp;&nbsp;</i>My Tickets</a>
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
        <a href="${pageContext.request.contextPath}/InquiryServlet?action=LIST" <%= path.contains("/inquiry") && !path.contains("create-inquiry.jsp") ? "class=\"active\"" : "" %>><i class="fas fa-question-circle">&nbsp;&nbsp;</i>My Inquiries</a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/InquiryServlet?action=NEW" <%= path.contains("/inquiry/create-inquiry.jsp") ? "class=\"active\"" : "" %>
          ><i class="fas fa-plus-circle">&nbsp;&nbsp;</i>New Inquiry</a
        >
      </li>
      <% } %>
      
      <% if ("admin".equals(user.getType()) || "support".equals(user.getType())) { %>
      <li>
        <a href="${pageContext.request.contextPath}/TicketServlet?action=LIST" <%= path.contains("/list-tickets.jsp") ? "class=\"active\"" : "" %>><i class="fas fa-ticket">&nbsp;&nbsp;</i>All Tickets</a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/InquiryServlet?action=LIST" <%= path.contains("/inquiry") ? "class=\"active\"" : "" %>><i class="fas fa-question-circle">&nbsp;&nbsp;</i>All Inquiries</a>
      </li>
      <% } %>
      
      <% if ("admin".equals(user.getType())) { %>
      <li>
        <a href="faq" <%= path.contains("/faq") ? "class=\"active\"" : "" %>
          ><i class="fas fa-question">&nbsp;&nbsp;</i>FAQ</a
        >
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
