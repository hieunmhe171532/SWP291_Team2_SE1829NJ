/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hieum
 */
public class Feedback {
    private int id;
    private String img;
    private String description;
    private String createAt;
    private Account acc;
    private Room room;

    public Feedback() {
    }

    public Feedback(int id, String img, String description, String createAt, Account acc, Room room) {
        this.id = id;
        this.img = img;
        this.description = description;
        this.createAt = createAt;
        this.acc = acc;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public Account getAcc() {
        return acc;
    }

    public void setAcc(Account acc) {
        this.acc = acc;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", img=" + img + ", description=" + description + ", createAt=" + createAt + ", acc=" + acc + ", room=" + room + '}';
    }

    

    
}