<%@ page import="com.cms.bablu.Model.Admin"%>

<%
Admin admin = (Admin) session.getAttribute("admin");

if (admin == null) {
	response.sendRedirect("../adminLogin.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, Helvetica, sans-serif;
}

body {
	background: #f4f6f9;
}

/* Navbar */
.navbar {
	background: #0d47a1;
	color: #fff;
	padding: 18px 50px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	font-size: 26px;
	font-weight: bold;
}

.logout-btn {
	text-decoration: none;
	color: white;
	background: #e53935;
	padding: 10px 20px;
	border-radius: 5px;
	transition: .3s;
}

.logout-btn:hover {
	background: #c62828;
}

/* Welcome */
.welcome {
	width: 90%;
	margin: 30px auto;
	background: white;
	padding: 25px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, .1);
}

.welcome h2 {
	color: #0d47a1;
}

.welcome p {
	margin-top: 8px;
	color: #555;
}

/* Cards */
.container {
	width: 90%;
	margin: 30px auto;
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 25px;
}

.card {
	background: white;
	padding: 30px;
	border-radius: 10px;
	text-align: center;
	box-shadow: 0 4px 12px rgba(0, 0, 0, .15);
	transition: .3s;
}

.card:hover {
	transform: translateY(-8px);
}

.card h1 {
	font-size: 50px;
	margin-bottom: 15px;
}

.card h3 {
	color: #0d47a1;
	margin-bottom: 10px;
}

.card p {
	color: #666;
	margin-bottom: 20px;
}

.card a {
	text-decoration: none;
	color: white;
	background: #0d47a1;
	padding: 10px 20px;
	border-radius: 5px;
	display: inline-block;
}

.card a:hover {
	background: #1565c0;
}

/* Footer */
.footer {
	margin-top: 60px;
	background: #0d47a1;
	color: white;
	text-align: center;
	padding: 18px;
}
</style>

</head>

<body>

	<div class="navbar">

		<div class="logo">Employee Management System</div>

		<a href="../LogoutServlet" class="logout-btn"> Logout </a>

	</div>


	<div class="welcome">

		<h2>
			Welcome,
			<%=admin.getFullName()%>
			👋
		</h2>

		<p>Manage employee records efficiently from the admin dashboard.</p>

	</div>


	<div class="container">

		<div class="card">

			<h1>➕</h1>

			<h3>Add Employee</h3>

			<p>Add new employees into the system.</p>

			<a href="addEmployee.jsp">Open</a>

		</div>


		<div class="card">

			<h1>📋</h1>

			<h3>View Employees</h3>

			<p>View complete employee records.</p>

			<a href="../ViewEmployeeServlet">Open</a>

		</div>


		<div class="card">

			<h1>✏️</h1>

			<h3>Update Employee</h3>

			<p>Edit employee information.</p>

			<a href="../ViewEmployeeServlet">Open</a>

		</div>


		<div class="card">

			<h1>🗑️</h1>

			<h3>Delete Employee</h3>

			<p>Delete employee records securely.</p>

			<a href="../ViewEmployeeServlet">Open</a>

		</div>

	</div>


	<div class="footer">© 2026 Employee Management System | Admin
		Panel</div>

</body>
</html>