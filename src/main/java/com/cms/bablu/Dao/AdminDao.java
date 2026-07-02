package com.cms.bablu.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cms.bablu.Model.Admin;
import com.cms.bablu.config.DBConnection;

public class AdminDao {

    public Admin login(String email, String password) {

        Admin admin = null;

        String sql = "SELECT * FROM admin WHERE email=? AND password=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                admin = new Admin();

                admin.setId(rs.getInt("id"));
                admin.setFullName(rs.getString("full_name"));
                admin.setEmail(rs.getString("email"));
                admin.setMobile(rs.getString("mobile"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }

}