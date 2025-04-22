<%@ include file="auth/auth.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	HOME PAGE

	<h2>
		Welcome,
		<%=user.getName()%>!
	</h2>
</body>
</html>