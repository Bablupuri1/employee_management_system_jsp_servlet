package com.cms.bablu.controllers;

import java.io.IOException;

import java.util.List;

import com.cms.bablu.Dao.EmployeeDao;
import com.cms.bablu.Model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewEmployeeServlet")
public class ViewEmployeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ViewEmployeeServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EmployeeDao dao = new EmployeeDao();

        List<Employee> employeeList = dao.getAllEmployees();

        request.setAttribute("employeeList", employeeList);

        request.getRequestDispatcher("Admin/ViewEmployee.jsp")
               .forward(request, response);
    }

}