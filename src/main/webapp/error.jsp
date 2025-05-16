<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Error - CustomerCare</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/styles/main.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <style>
      .error-container {
        max-width: 800px;
        margin: 100px auto;
        padding: 40px;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
        text-align: center;
        border: 1px solid #eaeef2;
        animation: fadeIn 0.5s ease;
      }

      @keyframes fadeIn {
        from {
          opacity: 0;
          transform: translateY(-15px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      .error-icon {
        font-size: 60px;
        color: #e63946;
        margin-bottom: 20px;
      }

      .error-title {
        font-size: 28px;
        color: #2d3748;
        margin-bottom: 15px;
      }

      .error-message {
        font-size: 18px;
        color: #4a5568;
        margin-bottom: 30px;
        padding: 15px;
        background-color: #f8f9fa;
        border-radius: 8px;
      }

      .error-code {
        display: inline-block;
        padding: 5px 15px;
        background-color: #ffebee;
        color: #d32f2f;
        border-radius: 50px;
        font-weight: 500;
        margin-bottom: 25px;
      }

      .buttons {
        margin-top: 25px;
      }

      .btn-home {
        display: inline-block;
        background-color: #4361ee;
        color: white;
        padding: 12px 25px;
        border-radius: 6px;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s ease;
        margin-right: 15px;
        box-shadow: 0 2px 5px rgba(67, 97, 238, 0.3);
      }

      .btn-home:hover {
        background-color: #3a0ca3;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(67, 97, 238, 0.4);
        text-decoration: none;
      }

      .btn-back {
        display: inline-block;
        background-color: #fff;
        color: #4361ee;
        padding: 12px 25px;
        border-radius: 6px;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s ease;
        border: 1px solid #4361ee;
      }

      .btn-back:hover {
        background-color: #eef2ff;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(67, 97, 238, 0.1);
        text-decoration: none;
      }
    </style>
  </head>
  <body>
    <div class="error-container">
      <i class="fas fa-exclamation-circle error-icon"></i>

      <h1 class="error-title">Oops! Something went wrong</h1>

      <%-- Display status code if available --%> <% if(response.getStatus() > 0)
      { %>
      <div class="error-code">Error <%= response.getStatus() %></div>
      <% } %> <%-- Display error message if available --%>
      <div class="error-message">
        <% if(exception != null) { %> <%= exception.getMessage() %> <% } else {
        %> The page you're looking for could not be found or an error occurred.
        <% } %>
      </div>

      <div class="buttons">
        <a href="${pageContext.request.contextPath}/dashboard" class="btn-home">
          <i class="fas fa-home"></i> Go to Dashboard
        </a>
        <a href="javascript:history.back()" class="btn-back">
          <i class="fas fa-arrow-left"></i> Go Back
        </a>
      </div>
    </div>
  </body>
</html>
