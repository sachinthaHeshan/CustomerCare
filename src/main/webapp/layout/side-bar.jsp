<%@ page import="com.customercare.model.User"%> 
<%
  // Check if user is already in the request scope to avoid duplicate declaration
  User sidebarUser = (User) session.getAttribute("user");
  if (sidebarUser == null) {
    // Redirect to login page if user is not in session
    response.sendRedirect(request.getContextPath() + "/login");
    return;
  }

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
          ><i class="fas fa-home">&nbsp;&nbsp;</i>Dashboard</a
        >
      </li>
      <% if ("customer".equals(sidebarUser.getType())) { %>
      <li>
        <a href="${pageContext.request.contextPath}/TicketServlet?action=LIST" <%= path.contains("/list-tickets.jsp") ? "class=\"active\"" : "" %>><i class="fas fa-ticket-alt">&nbsp;&nbsp;</i>My Tickets</a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/add-ticket" <%= path.contains("/add-ticket.jsp") ? "class=\"active\"" : "" %>><i class="fas fa-plus">&nbsp;&nbsp;</i>New Ticket</a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/ViewFeedback" <%= path.contains("Feedback") || path.contains("/createFeedback") || path.contains("feedbackMessage") ? "class=\"active\"" : "" %>
          ><i class="fas fa-comment">&nbsp;&nbsp;</i>Feedback & Ratings</a
        >
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/inquiries" <%= path.contains("/inquiries") ? "class=\"active\"" : "" %>><i class="fas fa-question-circle">&nbsp;&nbsp;</i>Inquiries</a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/add-inquiry" <%= path.contains("/add-inquiry") ? "class=\"active\"" : "" %>
          ><i class="fas fa-plus-circle">&nbsp;&nbsp;</i>Add Inquiry</a
        >
      </li>
      <% } %>
      
      <% if ("admin".equals(sidebarUser.getType())) { %>
      <li>
        <a href="${pageContext.request.contextPath}/TicketServlet?action=LIST" <%= path.contains("/list-tickets.jsp") ? "class=\"active\"" : "" %>><i class="fas fa-ticket-alt">&nbsp;&nbsp;</i>All Tickets</a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/manage-users" <%= path.contains("/manage-users") ? "class=\"active\"" : "" %>><i class="fas fa-users">&nbsp;&nbsp;</i>Manage Users</a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/reports" <%= path.contains("/reports") ? "class=\"active\"" : "" %>><i class="fas fa-chart-bar">&nbsp;&nbsp;</i>Reports</a>
      </li>
      <% } %>
      
      <% if ("support".equals(sidebarUser.getType())) { %>
      <li>
        <a href="${pageContext.request.contextPath}/TicketServlet?action=LIST" <%= path.contains("/list-tickets.jsp") ? "class=\"active\"" : "" %>><i class="fas fa-ticket-alt">&nbsp;&nbsp;</i>Support Tickets</a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/view-feedback" <%= path.contains("/view-feedback") ? "class=\"active\"" : "" %>><i class="fas fa-comment">&nbsp;&nbsp;</i>View Feedback</a>
      </li>
      <% } %>
      
      <!-- Common for all user types -->
      <li>
        <a href="${pageContext.request.contextPath}/faq" <%= path.contains("/faq") ? "class=\"active\"" : "" %>
          ><i class="fas fa-question">&nbsp;&nbsp;</i>FAQ</a
        >
      </li>
      
      <li class="logout-item">
        <a href="${pageContext.request.contextPath}/Logout" class="logout-link">
          <i class="fas fa-sign-out-alt">&nbsp;&nbsp;</i>Logout
        </a>
      </li>
    </ul>
  </nav>
</div>
