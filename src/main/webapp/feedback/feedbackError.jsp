<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submission Failed</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/feedback.css">
</head>
<body>
    <div class="container status-container">
        <div class="status-icon status-error">Warning</div>
        <h2>Oops! Something went wrong</h2>
        <p class="status-message">We couldn't process your feedback submission. Please try again.</p>
        <div class="form-actions">
            <a href="createFeedback.jsp" class="btn">Try Again</a>
            <a href="${pageContext.request.contextPath}" class="btn btn-secondary">Return Home</a>
        </div>
    </div>
</body>
</html>