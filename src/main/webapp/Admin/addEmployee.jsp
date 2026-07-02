<%@ page import="com.cms.bablu.Model.Admin"%>

<%
Admin admin = (Admin) session.getAttribute("admin");

if(admin == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Employee</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:#f4f6f9;
}

/* Header */

.header{
    background:#0d47a1;
    color:white;
    padding:18px 50px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.header h2{
    font-size:28px;
}

.header a{
    text-decoration:none;
    color:white;
    background:#d32f2f;
    padding:10px 20px;
    border-radius:5px;
}

.header a:hover{
    background:#b71c1c;
}

/* Form */

.container{
    width:80%;
    margin:40px auto;
    background:white;
    padding:35px;
    border-radius:10px;
    box-shadow:0 4px 15px rgba(0,0,0,.2);
}

.container h2{
    text-align:center;
    color:#0d47a1;
    margin-bottom:30px;
}

.row{
    display:flex;
    gap:20px;
    margin-bottom:20px;
}

.col{
    flex:1;
}

label{
    display:block;
    margin-bottom:8px;
    font-weight:bold;
}

input,
select,
textarea{

    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:5px;
    font-size:15px;

}

textarea{
    resize:none;
    height:90px;
}

.btn{

    width:100%;
    padding:14px;
    border:none;
    background:#0d47a1;
    color:white;
    font-size:18px;
    cursor:pointer;
    border-radius:5px;

}

.btn:hover{
    background:#1565c0;
}

.back{

    text-align:center;
    margin-top:20px;

}

.back a{

    text-decoration:none;
    color:#0d47a1;
    font-weight:bold;

}

</style>

</head>

<body>

<div class="header">

<h2>Employee Management System</h2>

<a href="LogoutServlet">Logout</a>

</div>


<div class="container">

<h2>Add Employee</h2>

<form action="../AddEmployeeServlet" method="post">

<div class="row">

<div class="col">

<label>Employee Code</label>

<input type="text" name="empCode" required>

</div>

<div class="col">

<label>Department</label>

<select name="department" required>

<option value="">Select</option>

<option>IT</option>

<option>HR</option>

<option>Finance</option>

<option>Sales</option>

<option>Marketing</option>

</select>

</div>

</div>


<div class="row">

<div class="col">

<label>First Name</label>

<input type="text" name="firstName" required>

</div>

<div class="col">

<label>Last Name</label>

<input type="text" name="lastName" required>

</div>

</div>


<div class="row">

<div class="col">

<label>Email</label>

<input type="email" name="email" required>

</div>

<div class="col">

<label>Mobile</label>

<input type="text" name="mobile" required>

</div>

</div>


<div class="row">

<div class="col">

<label>Gender</label>

<select name="gender">

<option>Male</option>

<option>Female</option>

<option>Other</option>

</select>

</div>

<div class="col">

<label>Designation</label>

<input type="text" name="designation" required>

</div>

</div>


<div class="row">

<div class="col">

<label>Salary</label>

<input type="number" name="salary" required>

</div>

<div class="col">

<label>Status</label>

<select name="status">

<option>Active</option>

<option>Inactive</option>

</select>

</div>

</div>


<div class="row">

<div class="col">

<label>Password</label>

<input type="password" name="password" required>

</div>

<div class="col">

<label>Address</label>

<textarea name="address"></textarea>

</div>

</div>

<input type="submit" value="Add Employee" class="btn">

</form>

<div class="back">

<a href="admin/dashboard.jsp">← Back to Dashboard</a>

</div>

</div>

</body>
</html>