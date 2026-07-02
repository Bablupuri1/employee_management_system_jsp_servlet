package com.cms.bablu.controllers;

import java.io.IOException;


import com.cms.bablu.Dao.AdminDao;
import com.cms.bablu.Model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AdminDao dao = new AdminDao();

        Admin admin = dao.login(email, password);

        if (admin != null) {

            HttpSession session = request.getSession();

            session.setAttribute("admin", admin);

            response.sendRedirect("Admin/dashboard.jsp");

        } else {

            request.setAttribute("error", "Invalid Email or Password");

            request.getRequestDispatcher("AdminLogin.jsp")
                    .forward(request, response);

        }

    }

}