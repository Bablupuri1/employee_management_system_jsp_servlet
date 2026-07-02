package com.cms.bablu.controllers;

import java.io.IOException;

import com.cms.bablu.Dao.EmployeeDao;
import com.cms.bablu.Model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Employee emp = new Employee();

        emp.setId(Integer.parseInt(request.getParameter("id")));
        emp.setEmpCode(request.getParameter("empCode"));
        emp.setFirstName(request.getParameter("firstName"));
        emp.setLastName(request.getParameter("lastName"));
        emp.setEmail(request.getParameter("email"));
        emp.setMobile(request.getParameter("mobile"));
        emp.setDepartment(request.getParameter("department"));
        emp.setDesignation(request.getParameter("designation"));
        emp.setSalary(Double.parseDouble(request.getParameter("salary")));
        emp.setStatus(request.getParameter("status"));
        emp.setGender(request.getParameter("gender"));
        emp.setAddress(request.getParameter("address"));
        emp.setPassword(request.getParameter("password"));


        EmployeeDao dao = new EmployeeDao();

        boolean result = dao.updateEmployee(emp);

        if(result){

            response.sendRedirect("ViewEmployeeServlet");

        }else{

            response.getWriter().println("Update Failed");

        }

    }

}