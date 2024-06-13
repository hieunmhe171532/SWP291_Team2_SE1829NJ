/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.security.Timestamp;
import java.util.Date;

/**
 *
 * @author hieum
 */
public class User {

    private int id;
    private String name;
    private Date dob;
    private boolean gender;
    private String address;
    private Account username;
    private String createAt;
    private String updateAt;
    private boolean isDelete;

    public User() {
    }

    public User(int id, String name, Date dob, boolean gender, String address, Account username, String createAt, String updateAt, boolean isDelete) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.username = username;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.isDelete = isDelete;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Date getDob() {
        return dob;
    }

    public boolean isGender() {
        return gender;
    }

    public String getAddress() {
        return address;
    }

    public Account getUsername() {
        return username;
    }

    public String getCreateAt() {
        return createAt;
    }

    public String getUpdateAt() {
        return updateAt;
    }

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setUsername(Account username) {
        this.username = username;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public void setUpdateAt(String updateAt) {
        this.updateAt = updateAt;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + ", dob=" + dob + ", gender=" + gender + ", address=" + address + ", username=" + username + ", createAt=" + createAt + ", updateAt=" + updateAt + ", isDelete=" + isDelete + '}';
    }

    
    
}
