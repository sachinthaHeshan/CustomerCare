<%@ include file="auth/auth.jsp"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>
    <link rel="stylesheet" href="styles/dashboard.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
  </head>
  <body> 
   
    
      <header>
        <div class="breadcrumbs">
          <h1>Dashboard</h1>
        </div>

        <div class="user-actions">
          <div class="user-icon"></div>
        </div>
      </header>
        <%@ include file="layout/side-bar.jsp"%>
        <div class="main-container">
      <main>
        <div class="recent-files">
          <div class="recent-files-header">
            <h2>Welcome, Sachintha heshan!</h2>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>
