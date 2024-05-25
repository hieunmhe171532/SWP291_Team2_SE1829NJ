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
    private Hotel hotel;
    private TypeRoom typeRoom;
     private boolean isDelete;
    private Date createAt;
    private Date deleteAt;
    private Date updateAt;

    public Room() {
    }

    public Room(int id, String name, String image, int userQuantity, float area, int quantity, float price, boolean status, String description, Hotel hotel, TypeRoom typeRoom, boolean isDelete, Date createAt, Date deleteAt, Date updateAt) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.userQuantity = userQuantity;
        this.area = area;
        this.quantity = quantity;
        this.price = price;
        this.status = status;
        this.description = description;
        this.hotel = hotel;
        this.typeRoom = typeRoom;
        this.isDelete = isDelete;
        this.createAt = createAt;
        this.deleteAt = deleteAt;
        this.updateAt = updateAt;
    }

    @Override
    public String toString() {
        return "Room{" + "id=" + id + ", name=" + name + ", image=" + image + ", userQuantity=" + userQuantity + ", area=" + area + ", quantity=" + quantity + ", price=" + price + ", status=" + status + ", description=" + description + ", hotel=" + hotel + ", typeRoom=" + typeRoom + ", isDelete=" + isDelete + ", createAt=" + createAt + ", deleteAt=" + deleteAt + ", updateAt=" + updateAt + '}';
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

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public TypeRoom getTypeRoom() {
        return typeRoom;
    }

    public void setTypeRoom(TypeRoom typeRoom) {
        this.typeRoom = typeRoom;
    }

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
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
    
    
}
