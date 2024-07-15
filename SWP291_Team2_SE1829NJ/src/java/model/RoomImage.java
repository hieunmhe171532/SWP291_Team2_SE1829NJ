/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dinhl
 */
public class RoomImage {
    private int id;
    private String img,createAt;
    private Room room;

    public RoomImage() {
    }

    public RoomImage(int id, String img, String createAt, Room room) {
        this.id = id;
        this.img = img;
        this.createAt = createAt;
        this.room = room;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    @Override
    public String toString() {
        return "RoomImage{" + "id=" + id + ", img=" + img + ", createAt=" + createAt + ", room=" + room + '}';
    }
    
}
