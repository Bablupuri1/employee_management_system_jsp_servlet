package com.cms.bablu.controllers;

import java.io.IOException;

import com.cms.bablu.Dao.EmployeeDao;
import com.cms.bablu.Model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public AddEmployeeServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	System.out.println("Welcome in Add Employee Servlet");
        // Form Data
        String empCode = request.getParameter("empCode");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String department = request.getParameter("department");
        String designation = request.getParameter("designation");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String status = request.getParameter("status");

        // Employee Object
        Employee employee = new Employee();

        employee.setEmpCode(empCode);
        employee.setFirstName(firstName);
        employee.setLastName(lastName);
        employee.setEmail(email);
        employee.setMobile(mobile);
        employee.setGender(gender);
        employee.setDepartment(department);
        employee.setDesignation(designation);
        employee.setSalary(salary);
        employee.setAddress(address);
        employee.setPassword(password);
        employee.setStatus(status);

        // Save Employee
        EmployeeDao dao = new EmployeeDao();

        boolean result = dao.addEmployee(employee);

        if (result) {

        	response.sendRedirect("ViewEmployeeServlet?success=Employee added successfully.");
        } else {

            request.setAttribute("error", "Employee Not Added!");

            request.getRequestDispatcher("Admin/addEmployee.jsp")
                   .forward(request, response);

        }

    }

}