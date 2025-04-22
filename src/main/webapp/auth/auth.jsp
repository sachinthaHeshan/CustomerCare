<%@ page import="com.customercare.model.User"%>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
	response.sendRedirect("login");
	return;
}
%>