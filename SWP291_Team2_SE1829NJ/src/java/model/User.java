/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.security.Timestamp;
import java.sql.Date;

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
    private String username;
    private Timestamp createAt;
    private Timestamp updateAt;
    private boolean isDelete;

    public User() {
    }

    public User(String username,String name, Date dob, boolean gender, String address) {
        this.name = name;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.username = username;
    }
    

    public User(int id, String name, Date dob, boolean gender, String address, String username, Timestamp createAt, Timestamp updateAt, boolean isDelete) {
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

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public Timestamp getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Timestamp updateAt) {
        this.updateAt = updateAt;
    }

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + ", dob=" + dob + ", gender=" + gender + ", address=" + address + ", username=" + username + ", createAt=" + createAt + ", updateAt=" + updateAt + ", isDelete=" + isDelete + '}';
    }
    
}
