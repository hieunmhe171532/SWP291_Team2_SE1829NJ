/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.security.Timestamp;

/**
 *
 * @author hieum
 */
public class Room {
    private int id;
    private String name;
    private String image;
    private int userQuantity;
    private float area;
    private int quantity;
    private float price;
    private boolean status;
    private String description;
    private int hotel_id;
    private int type_id;
    private Timestamp createAt;
    private Timestamp updateAt;
    private Timestamp delateAt;
    private boolean isDelete;

    public Room() {
    }

    public Room(int id, String name, String image, int userQuantity, float area, int quantity, float price, boolean status, String description, int hotel_id, int type_id, Timestamp createAt, Timestamp updateAt, Timestamp delateAt, boolean isDelete) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.userQuantity = userQuantity;
        this.area = area;
        this.quantity = quantity;
        this.price = price;
        this.status = status;
        this.description = description;
        this.hotel_id = hotel_id;
        this.type_id = type_id;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.delateAt = delateAt;
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

    public int getUserQuantity() {
        return userQuantity;
    }

    public void setUserQuantity(int userQuantity) {
        this.userQuantity = userQuantity;
    }

    public float getArea() {
        return area;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getHotel_id() {
        return hotel_id;
    }

    public void setHotel_id(int hotel_id) {
        this.hotel_id = hotel_id;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
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

    public Timestamp getDelateAt() {
        return delateAt;
    }

    public void setDelateAt(Timestamp delateAt) {
        this.delateAt = delateAt;
    }

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    public String toString() {
        return "Room{" + "id=" + id + ", name=" + name + ", image=" + image + ", userQuantity=" + userQuantity + ", area=" + area + ", quantity=" + quantity + ", price=" + price + ", status=" + status + ", description=" + description + ", hotel_id=" + hotel_id + ", type_id=" + type_id + ", createAt=" + createAt + ", updateAt=" + updateAt + ", delateAt=" + delateAt + ", isDelete=" + isDelete + '}';
    }

    

    
    
}
