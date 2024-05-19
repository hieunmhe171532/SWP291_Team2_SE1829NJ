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
public class Booking {
    private int id;
    private int room_id;
    private int user_id;
    private Date startDate;
    private Date endDate;
    private Timestamp createAt;
    private Timestamp deleteAt;

    public Booking() {
    }

    public Booking(int id, int room_id, int user_id, Date startDate, Date endDate, Timestamp createAt, Timestamp deleteAt) {
        this.id = id;
        this.room_id = room_id;
        this.user_id = user_id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.createAt = createAt;
        this.deleteAt = deleteAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public Timestamp getDeleteAt() {
        return deleteAt;
    }

    public void setDeleteAt(Timestamp deleteAt) {
        this.deleteAt = deleteAt;
    }

    @Override
    public String toString() {
        return "Booking{" + "id=" + id + ", room_id=" + room_id + ", user_id=" + user_id + ", startDate=" + startDate + ", endDate=" + endDate + ", createAt=" + createAt + ", deleteAt=" + deleteAt + '}';
    }
    
}
