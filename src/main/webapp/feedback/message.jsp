<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../auth/auth.jsp"%>
<%
String status = request.getParameter("status");
String action = request.getParameter("action");

String message = "";
if ("success".equals(status)) {
	message = action + " completed successfully!";
} else if ("error".equals(status)) {
	message = "An error occurred while trying to " + action.toLowerCase() + ".";
} else {
	message = "Unknown operation.";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback Status</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/feedback.css">
	<link rel="stylesheet" href="styles/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
	<div class="main-container">
		<%@ include file="../layout/side-bar.jsp"%>
		<div class="main-content">
			<%@ include file="../layout/header.jsp"%>

			<div class="container status-container">
				<div
					class="status-icon <%="success".equals(status) ? "status-success" : "status-error"%>">
					<%="success".equals(status) ? "✓" : "⚠️"%>
				</div>
				<h2><%=message%></h2>
				<div>
					<a href="ViewFeedback" class="btn">Back to Feedback List</a>
				</div>
			</div>

		</div>
	</div>
</body>
</html>