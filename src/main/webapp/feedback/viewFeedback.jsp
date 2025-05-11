<%@ page import="java.util.List"%>
<%@ page import="com.customercare.model.Feedback"%>
<%@ page import="com.customercare.model.User"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../auth/auth.jsp"%>
<%
List<Feedback> feedbackList = (List<Feedback>) request.getAttribute("feedbackList");
User sessionUser = (User) session.getAttribute("user");
String filter = request.getParameter("filter");
if (filter == null) {
	filter = "all";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Feedbacks</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/feedback.css">
<style>
/* Additional styles specific to viewFeedback */
.feedback-controls {
	display: flex;
	flex-wrap: wrap;
	gap: 15px;
	margin-bottom: 30px;
	align-items: center;
}

.feedback-controls .form-group {
	margin-bottom: 0;
	flex: 1;
	min-width: 200px;
}

.feedback-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.feedback-table th {
	background-color: var(--primary-color);
	color: white;
	padding: 12px;
	text-align: left;
}

.feedback-table td {
	padding: 12px;
	border-bottom: 1px solid var(--border-color);
}

.feedback-table tr:hover {
	background-color: rgba(3, 169, 244, 0.05);
}

.rating-stars {
	color: #ffc107;
	font-size: 18px;
	white-space: nowrap;
}

.rating-stars .star {
	display: inline-block;
	width: 18px;
	text-align: center;
}

.rating-value {
	margin-left: 5px;
	color: var(--text-dark);
}

.action-links a {
	color: var(--primary-color);
	text-decoration: none;
	margin-right: 10px;
}

.action-links a:hover {
	text-decoration: underline;
}

.no-feedback {
	text-align: center;
	padding: 30px;
	color: var(--text-medium);
}
</style>
<link rel="stylesheet" href="styles/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>

	<div class="main-container">
		<%@ include file="../layout/side-bar.jsp"%>
		<div class="main-content">
			<%@ include file="../layout/header.jsp"%>

			<div class="container">
				<h2>All Feedbacks</h2>

				<div class="feedback-controls">
					<!-- Filter Form -->
					<div class="form-group">
						<form action="<%=request.getContextPath()%>/ViewFeedback"
							method="get" class="filter-form">
							<select class="form-control" id="filter" name="filter"
								onchange="this.form.submit()" 	style="margin: 0;">
								<option value="all" <%="all".equals(filter) ? "selected" : ""%>>All
									Feedbacks</option>
								<option value="mine"
									<%="mine".equals(filter) ? "selected" : ""%>>My
									Feedbacks</option>
							</select>
						</form>
					</div>

					<!-- Search Bar -->
					<div class="form-group">
						<form action="${pageContext.request.contextPath}/SearchFeedback"
							method="get" style="display: flex; gap: 10px;">
							<input type="text" class="form-control" name="query"
							style="margin: 0;"
								placeholder="Search feedback..." required />
							<button type="submit" class="btn">Search</button>
						</form>
					</div>

					<a href="<%=request.getContextPath()%>/createFeedback"
						class="btn">Create New Feedback</a>
				</div>

				<table class="feedback-table">
					<thead>
						<tr>
							<th>User</th>
							<th>Rating</th>
							<th>Comments</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (feedbackList != null && !feedbackList.isEmpty()) {
							for (Feedback f : feedbackList) {
						%>
						<tr>
							<td><%=f.getUserName()%></td>
							<td>
								<div class="rating-stars">
									<%
									for (int i = 1; i <= 5; i++) {
									%>
									<span class="star"><%=i <= f.getRating() ? "★" : "☆"%></span>
									<%
									}
									%>
									<span class="rating-value">(<%=f.getRating()%>/5)
									</span>
								</div>
							</td>
							<td><%=f.getComments()%></td>
							<td class="action-links">
								<%
								if (sessionUser != null && f.getCreatedUserId() == sessionUser.getId()) {
								%> <a
								href="<%=request.getContextPath()%>/EditFeedback?id=<%=f.getId()%>">Edit</a>
								<a
								href="<%=request.getContextPath()%>/DeleteFeedback?id=<%=f.getId()%>"
								onclick="return confirm('Are you sure you want to delete this feedback?');">Delete</a>
								<%
								} else {
								%> <span>-</span> <%
								}
								%>
							</td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="4" class="no-feedback">No feedback found.</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>





</body>
</html>