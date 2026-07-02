package com.cms.bablu.controllers;

import java.io.IOException;

import com.cms.bablu.Dao.EmployeeDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");

        if (idStr != null && !idStr.isEmpty()) {

            int id = Integer.parseInt(idStr);

            EmployeeDao dao = new EmployeeDao();

            dao.deactivateEmployee(id);
        }

        response.sendRedirect(request.getContextPath() + "/ViewEmployeeServlet");
    }
}