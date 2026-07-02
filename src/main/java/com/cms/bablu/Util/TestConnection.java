package com.cms.bablu.Util;

import java.sql.Connection;

import com.cms.bablu.config.DBConnection;

public class TestConnection {

    public static void main(String[] args) {

        Connection con = DBConnection.getConnection();

        if (con != null) {

            System.out.println("Connection Success");

        } else {

            System.out.println("Connection Failed");

        }

    }

}