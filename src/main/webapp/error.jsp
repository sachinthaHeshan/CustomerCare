<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Error</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 20px;
        line-height: 1.6;
      }
      .error-container {
        background-color: #ffebee;
        border-left: 4px solid #d32f2f;
        padding: 15px;
        margin-bottom: 20px;
      }
      h1 {
        color: #d32f2f;
      }
      .btn {
        display: inline-block;
        padding: 10px 15px;
        background-color: #2196f3;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        margin-top: 20px;
      }
      .error-details {
        background-color: #f5f5f5;
        padding: 10px;
        border: 1px solid #ddd;
        margin-top: 20px;
        font-family: monospace;
        white-space: pre-wrap;
      }
    </style>
  </head>
  <body>
    <h1>Error</h1>

    <div class="error-container">
      <p>
        <strong>An error occurred while processing your request.</strong>
      </p>
      <p>
        <%-- Display error message if available --%> <% String errorMessage =
        (String) request.getAttribute("error"); if (errorMessage != null &&
        !errorMessage.isEmpty()) { out.println(errorMessage); } else if
        (exception != null) { out.println(exception.getMessage()); } else {
        out.println("Unknown error occurred."); } %>
      </p>
    </div>

    <%-- Show technical details if an exception is available --%> <% if
    (exception != null) { %>
    <div class="error-details">
      <h3>Technical Details:</h3>
      <% for (StackTraceElement element : exception.getStackTrace()) {
      out.println(element.toString()); out.println("<br />"); } %>
    </div>
    <% } %>

    <a href="${pageContext.request.contextPath}/" class="btn"
      >Go to Home Page</a
    >
  </body>
</html>
