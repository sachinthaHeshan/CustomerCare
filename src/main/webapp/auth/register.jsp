<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Register - Customer Care</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/styles/feedback.css"
    />
    <style>
      .register-container {
        max-width: 500px;
        margin: 50px auto;
        padding: 30px;
        background-color: var(--bg-white);
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      }

      .register-container h2 {
        color: var(--primary-color);
        text-align: center;
        margin-bottom: 20px;
      }

      .login-link {
        text-align: center;
        margin-top: 15px;
      }

      .login-link a {
        color: var(--primary-color);
        text-decoration: none;
      }

      .login-link a:hover {
        text-decoration: underline;
      }
    </style>
  </head>
  <body>
    <div class="register-container">
      <h2>Create an Account</h2>
      <% if (request.getParameter("error") != null) { %>
      <div class="alert alert-error"><%= request.getParameter("error") %></div>
      <% } %>
      <form
        action="${pageContext.request.contextPath}/loginServlet"
        method="post"
      >
        <input type="hidden" name="action" value="register" />
        <div class="form-group">
          <label for="name">Full Name:</label>
          <input
            type="text"
            class="form-control"
            id="name"
            name="name"
            required
          />
        </div>
        <div class="form-group">
          <label for="email">Email:</label>
          <input
            type="email"
            class="form-control"
            id="email"
            name="email"
            required
          />
        </div>
        <div class="form-group">
          <label for="password">Password:</label>
          <input
            type="password"
            class="form-control"
            id="password"
            name="password"
            required
          />
        </div>
        <div class="form-group">
          <label for="confirmPassword">Confirm Password:</label>
          <input
            type="password"
            class="form-control"
            id="confirmPassword"
            name="confirmPassword"
            required
          />
        </div>
        <div class="form-actions">
          <input type="submit" class="btn btn-block" value="Register" />
        </div>
      </form>
      <div class="login-link">
        Already have an account?
        <a href="${pageContext.request.contextPath}/auth/login.jsp"
          >Login here</a
        >
      </div>
    </div>
  </body>
</html>
