package model;

import java.util.Date;

public class UserAccount {
    private int id;
    private String username;
    private String password;
    private String phone;
    private String email;
    private String role;
    private boolean isActive;
    private String fullname;
    private Date dob;
    private boolean gender;
    private String address;
    private String createAt;
    private String updateAt;
    private boolean isDelete;

    
    
    
    
    
    
    
    
    
    
    
    // Constructors, getters, setters, and toString method...

    public UserAccount() {
    }

    public UserAccount(int id, String username, String password, String phone, String email, String role, boolean isActive, String fullname, Date dob, boolean gender, String address, String createAt, String updateAt, boolean isDelete) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.role = role;
        this.isActive = isActive;
        this.fullname = fullname;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
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

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public String getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(String updateAt) {
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
        return "UserAccount{" + "id=" + id + ", username=" + username + ", password=" + password + ", phone=" + phone + ", email=" + email + ", role=" + role + ", isActive=" + isActive + ", fullname=" + fullname + ", dob=" + dob + ", gender=" + gender + ", address=" + address + ", createAt=" + createAt + ", updateAt=" + updateAt + ", isDelete=" + isDelete + '}';
    }
    
    
}
