<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*, com.cms.bablu.util.DBConnection" %>
<%@ page import="jakarata.servlet.http.HttpSession" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Dashboard</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: #f4f6f9;
    }
    .dashboard-card {
        background: #fff;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
        padding: 30px;
        margin-top: 50px;
    }
    .dashboard-card h3 {
        text-align: center;
        margin-bottom: 20px;
        color: #007bff;
    }
</style>
</head>
<body>

<%
    HttpSession session = request.getSession(false);
    if(session == null || session.getAttribute("empId") == null){
        response.sendRedirect("EmployeeLogin.jsp");
        return;
    }

    int empId = (int) session.getAttribute("empId");

    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM employee WHERE id=?");
    ps.setInt(1, empId);
    ResultSet rs = ps.executeQuery();
%>

<div class="container">
    <div class="dashboard-card">
        <h3>Employee Dashboard</h3>
        <%
            if(rs.next()){
        %>
        <table class="table table-striped">
            <tbody>
                <tr><th>Employee Code</th><td><%= rs.getString("emp_code") %></td></tr>
                <tr><th>Name</th><td><%= rs.getString("first_name") %> <%= rs.getString("last_name") %></td></tr>
                <tr><th>Email</th><td><%= rs.getString("email") %></td></tr>
                <tr><th>Mobile</th><td><%= rs.getString("mobile") %></td></tr>
                <tr><th>Gender</th><td><%= rs.getString("gender") %></td></tr>
                <tr><th>Department</th><td><%= rs.getString("department") %></td></tr>
                <tr><th>Designation</th><td><%= rs.getString("designation") %></td></tr>
                <tr><th>Salary</th><td><%= rs.getBigDecimal("salary") %></td></tr>
                <tr><th>Address</th><td><%= rs.getString("address") %></td></tr>
                <tr><th>Status</th><td><%= rs.getString("status") %></td></tr>
                <tr><th>Created At</th><td><%= rs.getTimestamp("created_at") %></td></tr>
                <tr><th>Updated At</th><td><%= rs.getTimestamp("updated_at") %></td></tr>
            </tbody>
        </table>

        <div class="d-flex justify-content-between">
            <a href="EditEmployee.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning">Update Profile</a>
            <a href="LogoutServlet" class="btn btn-danger">Logout</a>
        </div>
        <%
            }
            rs.close();
            ps.close();
            conn.close();
        %>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
