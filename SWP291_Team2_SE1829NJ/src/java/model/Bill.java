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
public class Bill {
     private int id;
    private float discount;
    private Date paymentDate;
      private String phone;
    private String email;
    private String address;
      private String note;
    private Date updateAt;
    private Date deleteAt;
    private boolean isDelete;
    private boolean paymentMode;
    private float total;
    private String paymentMethod;

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
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

    public int getUsed_id() {
        return used_id;
    }

    public void setUsed_id(int used_id) {
        this.used_id = used_id;
    }

    public Bill(float discount, String phone, String email, String address, boolean paymentMode, float total, String paymentMethod, Date createAt, String roomName, String customerName) {
        this.discount = discount;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.paymentMode = paymentMode;
        this.total = total;
        this.paymentMethod = paymentMethod;
        this.createAt = createAt;
        this.roomName = roomName;
        this.customerName = customerName;
    }
    
    
    
    
    
    
    public Bill(String phone, String address, boolean paymentMode, float total, Date createAt, String roomName, String customerName) {
        this.phone = phone;
        this.address = address;
        this.paymentMode = paymentMode;
        this.total = total;
        this.createAt = createAt;
        this.roomName = roomName;
        this.customerName = customerName;
    }
    private int booking_id;
    private Date createAt;
     private String roomName;
    private String customerName;
    private int used_id;
    
    
    
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    public Bill(int id, float discount, Date paymentDate, String phone, String email, String address, boolean paymentMode, float total, int booking_id, Date createAt, Date updateAt, Date deleteAt, boolean isDelete) {
        this.id = id;
        this.discount = discount;
        this.paymentDate = paymentDate;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.paymentMode = paymentMode;
        this.total = total;
        this.booking_id = booking_id;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.deleteAt = deleteAt;
        this.isDelete = isDelete;
    }


    public Bill() {
    }

    public Bill(int id, float discount, Date paymentDate, boolean paymentMode, float total, int booking_id, Date createAt, Date updateAt, Date deleteAt, boolean isDelete) {
        this.id = id;
        this.discount = discount;
        this.paymentDate = paymentDate;
        this.paymentMode = paymentMode;
        this.total = total;
        this.booking_id = booking_id;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.deleteAt = deleteAt;
        this.isDelete = isDelete;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public boolean isPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(boolean paymentMode) {
        this.paymentMode = paymentMode;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public int getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(int booking_id) {
        this.booking_id = booking_id;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

    public Date getDeleteAt() {
        return deleteAt;
    }

    public void setDeleteAt(Date deleteAt) {
        this.deleteAt = deleteAt;
    }

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    public String toString() {
        return "Bill{" + "id=" + id + ", discount=" + discount + ", paymentDate=" + paymentDate + ", paymentMode=" + paymentMode + ", total=" + total + ", booking_id=" + booking_id + ", createAt=" + createAt + ", updateAt=" + updateAt + ", deleteAt=" + deleteAt + ", isDelete=" + isDelete + '}';
    }

    
    
    
}
