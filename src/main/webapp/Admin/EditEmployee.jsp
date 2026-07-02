<%@page import="com.cms.bablu.Model.Employee"%>
<%
Employee emp = (Employee) request.getAttribute("employee");
if(emp == null){
    response.sendRedirect("employee.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Employee</title>
<style>
body{font-family:Arial;background:#f4f6f9;}
.form-box{
    width:500px;
    margin:40px auto;
    background:white;
    padding:20px;
    border-radius:8px;
    box-shadow:0 0 10px rgba(0,0,0,0.2);
}
input{
    width:100%;
    padding:10px;
    margin:8px 0;
}
button{
    background:#0d47a1;
    color:white;
    padding:10px;
    width:100%;
    border:none;
}
</style>
</head>

<body>

<div class="form-box">
<h2>Edit Employee</h2>

<form action="${pageContext.request.contextPath}/UpdateEmployeeServlet" method="post">

<input type="hidden" name="id" value="<%=emp.getId()%>">

<label>Employee Code</label>
<input type="text" name="empCode" value="<%=emp.getEmpCode()%>">

<label>Gender</label>
<input type="text" name="gender" value="<%=emp.getGender()%>">

<label>Address</label>
<input type="text" name="address" value="<%=emp.getAddress()%>">

<label>Password</label>
<input type="password" name="password" value="<%=emp.getPassword()%>">


<label>First Name</label>
<input type="text" name="firstName" value="<%=emp.getFirstName()%>">

<label>Last Name</label>
<input type="text" name="lastName" value="<%=emp.getLastName()%>">

<label>Email</label>
<input type="email" name="email" value="<%=emp.getEmail()%>">

<label>Mobile</label>
<input type="text" name="mobile" value="<%=emp.getMobile()%>">

<label>Department</label>
<input type="text" name="department" value="<%=emp.getDepartment()%>">

<label>Designation</label>
<input type="text" name="designation" value="<%=emp.getDesignation()%>">

<label>Salary</label>
<input type="text" name="salary" value="<%=emp.getSalary()%>">

<label>Status</label>
<input type="text" name="status" value="<%=emp.getStatus()%>">

<button type="submit">Update Employee</button>

</form>
</div>

</body>
</html>