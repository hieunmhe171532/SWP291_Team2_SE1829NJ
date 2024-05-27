/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Hotel {
    private int id;
    private String name;	
    private String image;
    private String address;
    private String phone;
    private float rating;
    private boolean isActive;
    
    private String description;
    private String feedback;
    private Date createAt;
    private Date deleteAt;
    private Date updateAt;
    private boolean  isDelete;

    public Hotel() {
    }

    
    public Hotel(int id, String name, String image, String address, String phone, float rating, boolean isActive, String description, String feedback, Date createAt, Date deleteAt, Date updateAt, boolean isDelete) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.address = address;
        this.phone = phone;
        this.rating = rating;
        this.isActive = isActive;
        this.description = description;
        this.feedback = feedback;
        this.createAt = createAt;
        this.deleteAt = deleteAt;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getDeleteAt() {
        return deleteAt;
    }

    public void setDeleteAt(Date deleteAt) {
        this.deleteAt = deleteAt;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
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
        return "Hotel{" + "id=" + id + ", name=" + name + ", image=" + image + ", address=" + address + ", phone=" + phone + ", rating=" + rating + ", isActive=" + isActive + ", description=" + description + ", feedback=" + feedback + ", createAt=" + createAt + ", deleteAt=" + deleteAt + ", updateAt=" + updateAt + ", isDelete=" + isDelete + '}';
    }
    
    
}
