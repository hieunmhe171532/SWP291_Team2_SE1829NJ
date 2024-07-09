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
    private boolean paymentMode;
    private float total;
    private int booking_id;
    private Date createAt;
    private Date updateAt;
    private Date deleteAt;
    private boolean isDelete;

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
