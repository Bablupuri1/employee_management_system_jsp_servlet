package com.cms.bablu.controllers;

import java.io.IOException;

import com.cms.bablu.Dao.EmployeeDao;
import com.cms.bablu.Model.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditEmployeeServlet")
public class EditEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	
    	System.out.println("Edit Employee servet  executed and there  received one parameter from url called id");
        // 1. ID get karo URL se
        String idStr = request.getParameter("id");

        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect("employee.jsp");
            return;
        }

        int id = Integer.parseInt(idStr);

        // 2. DB se employee fetch karo
        EmployeeDao dao = new EmployeeDao();
        Employee emp = dao.getEmployeeById(id);

        // 3. agar employee nahi mila
        if (emp == null) {
            response.sendRedirect("ViewEmployee.jsp");
            return;
        }

        // 4. request me set karo
        request.setAttribute("employee", emp);

        // 5. edit page par bhejo
        RequestDispatcher rd = request.getRequestDispatcher("Admin/EditEmployee.jsp");
        rd.forward(request, response);
    }
}