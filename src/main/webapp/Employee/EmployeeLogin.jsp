<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Login</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .login-card {
        background: #fff;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
        padding: 30px;
        width: 100%;
        max-width: 400px;
    }
    .login-card h3 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }
</style>
</head>
<body>

<div class="login-card">
    <h3>Employee Login</h3>
    <form action="EmployeeLoginServlet" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email address</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
