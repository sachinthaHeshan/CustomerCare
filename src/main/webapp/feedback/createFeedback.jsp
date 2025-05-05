<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submit Feedback</title>
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
</head>
<body>
    <h2>Submit Your Feedback</h2>
    
    <form action="${pageContext.request.contextPath}/SubmitFeedback" method="post" onsubmit="return validateForm();">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" required minlength="3"><br><br>

        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>

        <label for="rating">Rating:</label><br>
        <select id="rating" name="rating" required>
            <option value="">--Select--</option>
            <option value="1">1 - Very Poor</option>
            <option value="2">2 - Poor</option>
            <option value="3">3 - Average</option>
            <option value="4">4 - Good</option>
            <option value="5">5 - Excellent</option>
        </select><br><br>

        <label for="comments">Comments:</label><br>
        <textarea id="comments" name="comments" rows="5" cols="30" required minlength="10"></textarea><br><br>

        <input type="submit" value="Submit Feedback">
    </form>
</body>
</html>
