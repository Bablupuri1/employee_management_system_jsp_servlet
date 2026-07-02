<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Management System</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:#f4f6f9;
}

/* Header */

header{
    background:#0d47a1;
    color:white;
    padding:18px 60px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

header h2{
    font-size:28px;
}

nav a{
    color:white;
    text-decoration:none;
    margin-left:25px;
    font-weight:bold;
}

nav a:hover{
    color:#ffcc00;
}

/* Hero */

.hero{
    height:80vh;
    display:flex;
    justify-content:center;
    align-items:center;
    text-align:center;
    color:white;
    background:linear-gradient(rgba(0,0,0,.65),rgba(0,0,0,.65)),
    url("https://images.unsplash.com/photo-1521791136064-7986c2920216?auto=format&fit=crop&w=1500&q=80");
    background-size:cover;
    background-position:center;
}

.hero h1{
    font-size:52px;
    margin-bottom:20px;
}

.hero p{
    font-size:20px;
    margin-bottom:30px;
}

.btn{
    text-decoration:none;
    background:#ff9800;
    color:white;
    padding:15px 35px;
    border-radius:5px;
    font-size:18px;
    font-weight:bold;
}

.btn:hover{
    background:#f57c00;
}

/* Cards */

.container{
    width:90%;
    margin:60px auto;
    display:flex;
    gap:25px;
}

.card{
    flex:1;
    background:white;
    padding:30px;
    text-align:center;
    border-radius:10px;
    box-shadow:0 4px 12px rgba(0,0,0,.2);
}

.card h3{
    color:#0d47a1;
    margin-bottom:15px;
}

.card p{
    color:#555;
}

/* Footer */

footer{
    background:#0d47a1;
    color:white;
    text-align:center;
    padding:18px;
    margin-top:40px;
}

</style>

</head>

<body>

<header>

<h2>👨‍💼 Employee Management System</h2>

<nav>
<a href="#">Home</a>
<a href="employees.jsp">Employees</a>
<a href="Employee/EmployeeLogin.jsp">Employee Login</a>
<a href="about.jsp">About</a>
<a href="AdminLogin.jsp"    >Admin Login</a>
</nav>

</header>


<section class="hero">

<div>

<h1>Employee Management System</h1>

<p>
Manage employee records quickly, securely and efficiently.
</p>

<a href="AdminLogin.jsp" class="btn">Get Started</a>

</div>

</section>


<div class="container">

<div class="card">
<h3>➕ Add Employee</h3>
<p>Add new employees with complete details.</p>
</div>

<div class="card">
<h3>📋 View Employees</h3>
<p>See all employee records in one place.</p>
</div>

<div class="card">
<h3>✏ Update Employee</h3>
<p>Edit employee information whenever needed.</p>
</div>

<div class="card">
<h3>🗑 Delete Employee</h3>
<p>Remove employee records safely.</p>
</div>

</div>

<footer>

<p>© 2026 Employee Management System | All Rights Reserved</p>

</footer>

</body>
</html>