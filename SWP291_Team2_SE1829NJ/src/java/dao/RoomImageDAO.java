/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Room;

/**
 *
 * @author dinhl
 */
public class RoomImageDAO {
    private int id;
    private String img;
    private Room room;
    private String createAt;

    public RoomImageDAO() {
    }

    public RoomImageDAO(int id, String img, Room room, String createAt) {
        this.id = id;
        this.img = img;
        this.room = room;
        this.createAt = createAt;
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

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "RoomImageDAO{" + "id=" + id + ", img=" + img + ", room=" + room + ", createAt=" + createAt + '}';
    }
    
}
