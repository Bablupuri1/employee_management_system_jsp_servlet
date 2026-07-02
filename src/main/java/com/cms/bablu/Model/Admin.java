package com.cms.bablu.Model;

import java.sql.Timestamp;

public class Admin {

    private int id;
    private String fullName;
    private String email;
    private String password;
    private String mobile;
    private Timestamp createdAt;

    // Default Constructor
    public Admin() {

    }

    // Parameterized Constructor
    public Admin(int id, String fullName, String email, String password,
                 String mobile, Timestamp createdAt) {

        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.mobile = mobile;
        this.createdAt = createdAt;
    }

    // Getters & Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Admin [id=" + id +
                ", fullName=" + fullName +
                ", email=" + email +
                ", mobile=" + mobile +
                ", createdAt=" + createdAt + "]";
    }

}