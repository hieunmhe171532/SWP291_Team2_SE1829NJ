package model;

import java.sql.Timestamp; // Corrected import
import java.util.Date;

/**
 * Booking class representing a booking record.
 * 
 * Author: hieum
 */
public class Booking {
    private int id;
    private int roomId; // Changed to camelCase for consistency
    private int userId; // Changed to camelCase for consistency
    private Room room;
    private String roomName; // New field
    private String customerName; // New field
    private String phoneNumber; // New field
    private String address; // New field
    private Date startDate;
    private Date endDate;
    private float fees; // New field
    private String paymentMode; // New field
    private Timestamp createdAt; // Changed to camelCase for consistency
    private Timestamp deletedAt; // Changed to camelCase for consistency

    // Default constructor
    public Booking() {
    }

    // Parameterized constructor
//    public Booking(int id, int roomId, int userId, String roomName, String customerName, String phoneNumber, String address, Date startDate, Date endDate, float fees, String paymentMode, Timestamp createdAt, Timestamp deletedAt) {
//        this.id = id;
//        this.roomId = roomId;
//        this.userId = userId;
//        this.roomName = roomName;
//        this.customerName = customerName;
//        this.phoneNumber = phoneNumber;
//        this.address = address;
//        this.startDate = startDate;
//        this.endDate = endDate;
//        this.fees = fees;
//        this.paymentMode = paymentMode;
//        this.createdAt = createdAt;
//        this.deletedAt = deletedAt;
//    }

        public Booking(int id, String roomName, String customerName, String phoneNumber, String address, Date startDate, Date endDate, float fees, String paymentMode) {
        this.id = id;
        this.roomName = roomName;
        this.customerName = customerName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.startDate = startDate;
        this.endDate = endDate;
        this.fees = fees;
        this.paymentMode = paymentMode;
    }
    // Getter and setter methods

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public float getFees() {
        return fees;
    }

    public void setFees(float fees) {
        this.fees = fees;
    }

    public String getPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(String paymentMode) {
        this.paymentMode = paymentMode;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(Timestamp deletedAt) {
        this.deletedAt = deletedAt;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "id=" + id +
                ", roomId=" + roomId +
                ", userId=" + userId +
                ", roomName='" + roomName + '\'' +
                ", customerName='" + customerName + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", address='" + address + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", fees=" + fees +
                ", paymentMode='" + paymentMode + '\'' +
               
               
                '}';
    }
}
