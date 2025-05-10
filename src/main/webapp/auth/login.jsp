<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.login-container {
	background-color: white;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

input[type=email], input[type=password] {
	width: 100%;
	padding: 10px;
	margin: 8px 0 16px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 100%;
	padding: 10px;
	background-color: #4285f4;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #357ae8;
}
</style>
</head>
<body>
	<div class="login-container">
		<h2>Login</h2>
		<form action="loginServlet" method="post">
			<label for="email">Email:</label> <input type="email" id="email"
				name="email" required> <label for="password">Password:</label>
			<input type="password" id="password" name="password" required>

			<input type="submit" value="Login">
		</form>
	</div>

</body>
</html>
