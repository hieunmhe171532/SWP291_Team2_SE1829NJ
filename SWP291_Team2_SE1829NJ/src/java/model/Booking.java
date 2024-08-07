package model;

import java.sql.Timestamp; 
import java.util.Date;

public class Booking {
    private int id;
    private int roomId;
    private int userId;
    private int billId;
    private Date startDate;
    private Date endDate;
    private float cost;
    private Timestamp createdAt;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public Booking() {
    }

    public Booking(int roomId, int userId, int billId, Date startDate, Date endDate, float cost, Timestamp createdAt) {
        this.roomId = roomId;
        this.userId = userId;
        this.billId = billId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.cost = cost;
        this.createdAt = createdAt;
    }

 
    public Booking(int id, int roomId, int userId, int billId, Date startDate, Date endDate, float cost, Timestamp createdAt) {
        this.id = id;
        this.roomId = roomId;
        this.userId = userId;
        this.billId = billId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.cost = cost;
        this.createdAt = createdAt;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
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

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    @Override
    public String toString() {
        return "Booking{" + "id=" + id + ", roomId=" + roomId + ", userId=" + userId + ", billId=" + billId + ", startDate=" + startDate + ", endDate=" + endDate + ", cost=" + cost + ", createdAt=" + createdAt + '}';
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

}
