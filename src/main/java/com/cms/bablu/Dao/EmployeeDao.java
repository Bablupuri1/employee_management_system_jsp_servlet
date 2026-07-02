package com.cms.bablu.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cms.bablu.Model.Employee;
import com.cms.bablu.config.DBConnection;

public class EmployeeDao {

    // ================= Add Employee =================

    public boolean addEmployee(Employee emp) {

        boolean status = false;

        String sql = "INSERT INTO employee(emp_code,first_name,last_name,email,mobile,gender,department,designation,salary,address,password,status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, emp.getEmpCode());
            ps.setString(2, emp.getFirstName());
            ps.setString(3, emp.getLastName());
            ps.setString(4, emp.getEmail());
            ps.setString(5, emp.getMobile());
            ps.setString(6, emp.getGender());
            ps.setString(7, emp.getDepartment());
            ps.setString(8, emp.getDesignation());
            ps.setDouble(9, emp.getSalary());
            ps.setString(10, emp.getAddress());
            ps.setString(11, emp.getPassword());
            ps.setString(12, emp.getStatus());

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // ================= View All Employees =================

    public List<Employee> getAllEmployees() {

        List<Employee> list = new ArrayList<>();

        String sql = "SELECT * FROM employee where status='ACTIVE' ";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Employee emp = new Employee();

                emp.setId(rs.getInt("id"));
                emp.setEmpCode(rs.getString("emp_code"));
                emp.setFirstName(rs.getString("first_name"));
                emp.setLastName(rs.getString("last_name"));
                emp.setEmail(rs.getString("email"));
                emp.setMobile(rs.getString("mobile"));
                emp.setGender(rs.getString("gender"));
                emp.setDepartment(rs.getString("department"));
                emp.setDesignation(rs.getString("designation"));
                emp.setSalary(rs.getDouble("salary"));
                emp.setAddress(rs.getString("address"));
                emp.setPassword(rs.getString("password"));
                emp.setStatus(rs.getString("status"));
                emp.setCreatedAt(rs.getTimestamp("created_at"));
                emp.setUpdatedAt(rs.getTimestamp("updated_at"));

                list.add(emp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= Get Employee By Id =================

    public Employee getEmployeeById(int id) {

        Employee emp = null;

        String sql = "SELECT * FROM employee WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                emp = new Employee();

                emp.setId(rs.getInt("id"));
                emp.setEmpCode(rs.getString("emp_code"));
                emp.setFirstName(rs.getString("first_name"));
                emp.setLastName(rs.getString("last_name"));
                emp.setEmail(rs.getString("email"));
                emp.setMobile(rs.getString("mobile"));
                emp.setGender(rs.getString("gender"));
                emp.setDepartment(rs.getString("department"));
                emp.setDesignation(rs.getString("designation"));
                emp.setSalary(rs.getDouble("salary"));
                emp.setAddress(rs.getString("address"));
                emp.setPassword(rs.getString("password"));
                emp.setStatus(rs.getString("status"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return emp;
    }

    // ================= Update Employee =================

    public boolean updateEmployee(Employee emp) {

        boolean status = false;

        String sql = "UPDATE employee SET emp_code=?,first_name=?,last_name=?,email=?,mobile=?,gender=?,department=?,designation=?,salary=?,address=?,password=?,status=? WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, emp.getEmpCode());
            ps.setString(2, emp.getFirstName());
            ps.setString(3, emp.getLastName());
            ps.setString(4, emp.getEmail());
            ps.setString(5, emp.getMobile());
            ps.setString(6, emp.getGender());
            ps.setString(7, emp.getDepartment());
            ps.setString(8, emp.getDesignation());
            ps.setDouble(9, emp.getSalary());
            ps.setString(10, emp.getAddress());
            ps.setString(11, emp.getPassword());
            ps.setString(12, emp.getStatus());
            ps.setInt(13, emp.getId());

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // ================= Delete Employee =================
    public boolean deactivateEmployee(int id) {

        boolean status = false;

        String sql = "UPDATE employee SET status='INACTIVE' WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

}