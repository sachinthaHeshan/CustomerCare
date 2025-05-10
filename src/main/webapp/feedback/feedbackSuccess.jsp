<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback Submitted</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/feedback.css">
</head>
<body>
    <div class="container status-container">
        <div class="status-icon status-success">Success</div>
        <h2>Thank You!</h2>
        <p class="status-message">Your feedback has been successfully submitted. We appreciate your input!</p>
        <div class="form-actions">
            <a href="createFeedback.jsp" class="btn">Submit Another</a>
            <a href="${pageContext.request.contextPath}" class="btn btn-secondary">Return Home</a>
        </div>
    </div>
</body>
</html>