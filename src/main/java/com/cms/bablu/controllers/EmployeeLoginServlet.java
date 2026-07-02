package com.cms.bablu.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cms.bablu.config.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class EmployeeLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Form se email aur password lena
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            // 2️⃣ Database query: employee ko check karna
            String sql = "SELECT id, emp_code, first_name, last_name, email, designation "
                       + "FROM employee WHERE email=? AND password=? AND status='ACTIVE'";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            // 3️⃣ Agar record milta hai → Login success
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("empId", rs.getInt("id"));   // unique identifier
                session.setAttribute("empCode", rs.getString("emp_code"));
                session.setAttribute("empName", rs.getString("first_name") + " " + rs.getString("last_name"));
                session.setAttribute("empEmail", rs.getString("email"));
                session.setAttribute("designation", rs.getString("designation"));

                // Dashboard page pe bhejna
                response.sendRedirect("Employee/employeeDashboard.jsp");
            } else {
                // 4️⃣ Agar record nahi mila → Login fail
                request.setAttribute("errorMessage", "Invalid email or password, or account inactive.");
                request.getRequestDispatcher("Employee/EmployeeLogin.jsp").forward(request, response);
            }

        } catch (Exception e) {
            // 5️⃣ Agar koi error aaya
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong. Please try again.");
            request.getRequestDispatcher("Employee/EmployeeLogin.jsp").forward(request, response);
        }
    }
}
