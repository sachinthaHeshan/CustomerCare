<%@ include file="../auth/auth.jsp"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@ page
import="com.customercare.model.User" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Submit Feedback</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/styles/feedback.css"
    />
    <script>
      function validateForm() {
        const name = document.getElementById("name").value.trim();
        const comments = document.getElementById("comments").value.trim();

        if (name.length < 3) {
          alert("Name must be at least 3 characters long.");
          return false;
        }

        if (comments.length < 10) {
          alert("Comments must be at least 10 characters long.");
          return false;
        }

        return true;
      }
    </script>
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
        <div class="container">
          <h2>Submit Your Feedback</h2>

          <form
            class="feedback-form"
            action="${pageContext.request.contextPath}/SubmitFeedback"
            method="post"
            onsubmit="return validateForm();"
          >
            <div class="form-group">
              <label for="name">Name:</label>
              <input class="form-control" type="text" id="name" name="name"
              value="<%= session.getAttribute("user") != null ?
              ((User)session.getAttribute("user")).getName() : "" %>" required
              minlength="3" readonly>
            </div>

            <div class="form-group">
              <label for="email">Email:</label>
              <input class="form-control" type="email" id="email" name="email"
              value="<%= session.getAttribute("user") != null ?
              ((User)session.getAttribute("user")).getEmail() : "" %>" required
              readonly>
            </div>

            <div class="form-group">
              <label for="rating">Rating:</label>
              <select
                class="form-control rating-select"
                id="rating"
                name="rating"
                required
              >
                <option value="">--Select--</option>
                <option value="1">1 - Very Poor</option>
                <option value="2">2 - Poor</option>
                <option value="3">3 - Average</option>
                <option value="4">4 - Good</option>
                <option value="5">5 - Excellent</option>
              </select>
            </div>

            <div class="form-group">
              <label for="comments">Comments:</label>
              <textarea
                class="form-control"
                id="comments"
                name="comments"
                rows="5"
                required
                minlength="10"
              ></textarea>
            </div>

            <div class="form-actions">
              <button type="submit" class="btn btn-block">
                Submit Feedback
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
