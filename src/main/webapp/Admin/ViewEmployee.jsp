<%@page import="java.util.List"%>
<%@page import="com.cms.bablu.Model.Employee"%>
<%@page import="com.cms.bablu.Model.Admin"%>

<%
Admin admin=(Admin)session.getAttribute("admin");

if(admin==null){
	response.sendRedirect("./AdminLogin.jsp");
	return;
}

List<Employee> employeeList=(List<Employee>)request.getAttribute("employeeList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Employees</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial;
}

body{
background:#f4f6f9;
}

.header{

background:#0d47a1;
color:white;
padding:18px 40px;
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
background:red;
padding:10px 20px;
border-radius:5px;

}

.container{

width:95%;
margin:30px auto;

}

.top{

display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:20px;

}

.search{

width:300px;
padding:12px;
border:1px solid #ccc;
border-radius:5px;

}

.add-btn{

text-decoration:none;
background:#0d47a1;
color:white;
padding:12px 20px;
border-radius:5px;

}

table{

width:100%;
border-collapse:collapse;
background:white;
box-shadow:0px 5px 15px rgba(0,0,0,.2);

}

th{

background:#0d47a1;
color:white;
padding:15px;

}

td{

padding:12px;
text-align:center;
border-bottom:1px solid #ddd;

}

tr:hover{

background:#f1f1f1;

}

.edit{

background:#2196F3;
color:white;
padding:8px 14px;
text-decoration:none;
border-radius:5px;

}

.delete{

background:#f44336;
color:white;
padding:8px 14px;
text-decoration:none;
border-radius:5px;

}

.footer{

margin-top:40px;
background:#0d47a1;
color:white;
text-align:center;
padding:18px;

}

</style>

</head>

<body>

<div class="header">

<h2>Employee Management System</h2>

<a href="../LogoutServlet">Logout</a>

</div>

<div class="container">

<div class="top">

<h2>Total Employees :
<%=employeeList==null?0:employeeList.size()%>
</h2>

<input type="text" id="search" class="search"
placeholder="Search Employee...">

<a href="addEmployee.jsp" class="add-btn">
+ Add Employee
</a>

</div>

<table id="employeeTable">

<thead>

<tr>

<th>ID</th>
<th>Code</th>
<th>Name</th>
<th>Email</th>
<th>Mobile</th>
<th>Department</th>
<th>Designation</th>
<th>Salary</th>
<th>Status</th>
<th>Action</th>

</tr>

</thead>

<tbody>

<%

if(employeeList!=null){

for(Employee emp:employeeList){

%>

<tr>

<td><%=emp.getId()%></td>

<td><%=emp.getEmpCode()%></td>

<td><%=emp.getFirstName()%> <%=emp.getLastName()%></td>

<td><%=emp.getEmail()%></td>

<td><%=emp.getMobile()%></td>

<td><%=emp.getDepartment()%></td>

<td><%=emp.getDesignation()%></td>

<td>₹ <%=emp.getSalary()%></td>

<td><%=emp.getStatus()%></td>

<td>

<a class="edit"
href="${pageContext.request.contextPath}/EditEmployeeServlet?id=<%=emp.getId()%>">
Edit
</a>






<a class="delete"
onclick="return confirm('Delete this employee?')"
href="${pageContext.request.contextPath}/DeleteEmployeeServlet?id=<%=emp.getId()%>">

Delete

</a>

</td>

</tr>

<%

}

}

%>

</tbody>

</table>

</div>

<div class="footer">

© 2026 Employee Management System

</div>

<script>

let input=document.getElementById("search");

input.addEventListener("keyup",function(){

let filter=input.value.toLowerCase();

let rows=document.querySelectorAll("#employeeTable tbody tr");

rows.forEach(function(row){

let text=row.innerText.toLowerCase();

row.style.display=text.includes(filter)?"":"none";

});

});

</script>

</body>
</html>