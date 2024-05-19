/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hieum
 */
public class Account {
    private String username;
    private String password;
    private String phone;
    private String email;
    private String role;
    private boolean isActive;

    public Account() {
    }

    public Account(String username, String password, String phone, String email, String role, boolean isActive) {
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.role = role;
        this.isActive = isActive;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "Account{" + "username=" + username + ", password=" + password + ", phone=" + phone + ", email=" + email + ", role=" + role + ", isActive=" + isActive + '}';
    }

    
    
    
}
