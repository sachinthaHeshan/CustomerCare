<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Login Page</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/styles/feedback.css"
    />
    <style>
      .login-container {
        max-width: 400px;
        margin: 50px auto;
        padding: 30px;
        background-color: var(--bg-white);
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      }

      .login-container h2 {
        color: var(--primary-color);
        text-align: center;
        margin-bottom: 20px;
      }

      .register-link {
        text-align: center;
        margin-top: 15px;
      }

      .register-link a {
        color: var(--primary-color);
        text-decoration: none;
      }

      .register-link a:hover {
        text-decoration: underline;
      }
    </style>
  </head>
  <body>
    <div class="login-container">
      <h2>Login</h2>
      <% if (request.getParameter("error") != null) { %>
      <div class="alert alert-error">Invalid email or password</div>
      <% } %>
      <form
        action="${pageContext.request.contextPath}/loginServlet"
        method="post"
      >
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
        <div class="form-actions">
          <input type="submit" class="btn btn-block" value="Login" />
        </div>
      </form>
      <div class="register-link">
        Don't have an account?
        <a href="${pageContext.request.contextPath}/auth/register.jsp"
          >Register here</a
        >
      </div>
    </div>
  </body>
</html>
