<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../auth/auth.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Add FAQ</title>
    <!-- Global styles -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/styles.css"
    />
    <!-- Page-specific styles -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/styles/edit-faq.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/styles/main.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
  </head>

  <body>
    <div class="main-container">
      <%@ include file="../layout/side-bar.jsp"%>
      <div class="main-content">
        <%@ include file="../layout/header.jsp"%>
        <div class="edit-faq-container">
          <h2 class="edit-faq-title">Submit a Question</h2>

          <form
            class="edit-faq-form"
            name="faqForm"
            action="${pageContext.request.contextPath}/faq?action=add"
            method="post"
            onsubmit="return validateForm()"
          >
            <label for="customerName">Name:</label>
            <input type="text" name="customerName" id="customerName" required />

            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required />

            <label for="question">Question:</label>
            <textarea name="question" id="question" required></textarea>

            <label for="category">Category:</label>
            <select name="category" id="category">
              <option value="Billing">Billing</option>
              <option value="Technical">Technical</option>
              <option value="General">General</option>
            </select>

            <label for="answer">Answer:</label>
            <textarea name="answer" id="answer"></textarea>

            <div class="btn-container">
              <input type="submit" value="Submit" class="btn-update" />
              <a
                href="${pageContext.request.contextPath}/faq"
                class="btn-cancel"
                >Cancel</a
              >
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
