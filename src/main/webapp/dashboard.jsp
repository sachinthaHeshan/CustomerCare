<%@ include file="auth/auth.jsp"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>
    <link rel="stylesheet" href="styles/dashboard.css" />
    <link rel="stylesheet" href="styles/main.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
  </head>
  <body>
    <div class="main-container">
      <%@ include file="layout/side-bar.jsp"%>
      <div class="main-content">
        <%@ include file="layout/header.jsp"%>

        <section class="welcome-section">
          <div class="container">
            <h2>Welcome, ${user.name}!</h2>
            <p>
              Your support dashboard gives you quick access to all customer care
              functions
            </p>
          </div>
        </section>
      </div>
    </div>
  </body>
</html>
