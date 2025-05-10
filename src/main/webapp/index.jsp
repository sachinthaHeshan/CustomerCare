<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PulseCare</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/index.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  </head>
  <body class="index-page">
    <header>
      <div class="container">
        <h1>Pulse<span>Care</span></h1>

        <nav>
          <ul>
            <li><a href="#">FAQ</a></li>
            <li><a href="#">Contact Us</a></li>
            <li><a href="login" class="login">Login</a></li>
            <li><a href="#" class="register">Register</a></li>
          </ul>
        </nav>
      </div>
    </header>
    <main>
      <section class="hero">
        <div class="container">
          <h2>
            Connecting <strong>businesses</strong> and
            <strong>customers</strong> with <br />
            <span>FASTER, SMARTER AND PERSONALIZED</span> support experiences
          </h2>
          <p>Lightning Fast Response Guaranteed!</p>
          <p>
            Our platform bridges the gap between businesses and customers,
            delivering fast, intelligent, and personalized support that drives
            stronger relationships and lasting loyalty.
          </p>
        </div>
      </section>
      <section class="image">
        <div class="container">
          <img 
            src="${pageContext.request.contextPath}/assets/images/bg.jpg" 
            alt="Customer Support" 
            onerror="this.onerror=null; this.src='https://via.placeholder.com/800x400?text=Customer+Support';" 
          />
        </div>
      </section>
    </main>
    <footer>
      <div class="container">
        <p>&copy; 2023 PulseCare. All rights reserved.</p>
      </div>
    </footer>
  </body>
</html>