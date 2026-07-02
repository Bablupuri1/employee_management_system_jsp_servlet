<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login | Employee Management System</title>

<style>

*{
	margin:0;
	padding:0;
	box-sizing:border-box;
	font-family:Arial, Helvetica, sans-serif;
}

body{

	background:#f4f6f9;
	display:flex;
	justify-content:center;
	align-items:center;
	height:100vh;

}

.login-box{

	width:400px;
	background:#fff;
	padding:35px;
	border-radius:10px;
	box-shadow:0px 0px 15px rgba(0,0,0,0.2);

}

.login-box h2{

	text-align:center;
	color:#0d47a1;
	margin-bottom:30px;

}

.input-group{

	margin-bottom:18px;

}

.input-group label{

	display:block;
	margin-bottom:8px;
	font-weight:bold;

}

.input-group input{

	width:100%;
	padding:12px;
	border:1px solid #ccc;
	border-radius:5px;
	font-size:15px;

}

.input-group input:focus{

	outline:none;
	border-color:#0d47a1;

}

.btn{

	width:100%;
	padding:12px;
	border:none;
	background:#0d47a1;
	color:white;
	font-size:17px;
	font-weight:bold;
	border-radius:5px;
	cursor:pointer;

}

.btn:hover{

	background:#1565c0;

}

.back{

	text-align:center;
	margin-top:18px;

}

.back a{

	text-decoration:none;
	color:#0d47a1;
	font-weight:bold;

}

.error{

	color:red;
	text-align:center;
	margin-bottom:15px;

}

</style>

</head>

<body>


<div class="login-box">

	<h2>Admin Login</h2>

	<%
	String error = (String) request.getAttribute("error");

	if(error != null){
	%>

	<p class="error"><%=error %></p>

	<%
	}
	%>

	<form action="AdminLoginServlet" method="post">

		<div class="input-group">
			<label>Email</label>
			<input type="email" name="email" placeholder="Enter Email" required>
		</div>

		<div class="input-group">
			<label>Password</label>
			<input type="password" name="password" placeholder="Enter Password" required>
		</div>

		<input type="submit" value="Login" class="btn">

	</form>

	<div class="back">
		<a href="index.jsp">← Back to Home</a>
	</div>

</div>

</body>
</html>