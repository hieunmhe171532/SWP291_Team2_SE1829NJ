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
       private String room_floor;
    private int userQuantity;
    private float area;

    private float price;
    private int status;
     private boolean isActive;
    private String description;
    private Hotel hotel;
    private TypeRoom typeRoom;
     private boolean isDelete;
    private Date createAt;
    private Date deleteAt;
    private Date updateAt;

    public Room() {
    }

    public Room(int id, String name, String image, String room_floor, int userQuantity, float area, float price, int status, boolean isActive, String description, Hotel hotel, TypeRoom typeRoom, boolean isDelete, Date createAt, Date deleteAt, Date updateAt) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.room_floor = room_floor;
        this.userQuantity = userQuantity;
        this.area = area;
        this.price = price;
        this.status = status;
        this.isActive = isActive;
        this.description = description;
        this.hotel = hotel;
        this.typeRoom = typeRoom;
        this.isDelete = isDelete;
        this.createAt = createAt;
        this.deleteAt = deleteAt;
        this.updateAt = updateAt;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }



    @Override
    public String toString() {
        return "Room{" + "id=" + id + ", name=" + name + ", image=" + image + ", room_floor=" + room_floor + ", userQuantity=" + userQuantity + ", area=" + area + ", price=" + price + ", status=" + status + ", description=" + description + ", hotel=" + hotel + ", typeRoom=" + typeRoom + ", isDelete=" + isDelete + ", createAt=" + createAt + ", deleteAt=" + deleteAt + ", updateAt=" + updateAt + '}';
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

    public String getRoom_floor() {
        return room_floor;
    }

    public void setRoom_floor(String room_floor) {
        this.room_floor = room_floor;
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
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
