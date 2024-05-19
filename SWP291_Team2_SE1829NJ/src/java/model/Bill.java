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
    private Timestamp createAt;
    private Timestamp updateAt;
    private Timestamp delateAt;
    private boolean isDelete;

    public Bill() {
    }

    public Bill(int id, float discount, Date paymentDate, boolean paymentMode, float total, int booking_id, Timestamp createAt, Timestamp updateAt, Timestamp delateAt, boolean isDelete) {
        this.id = id;
        this.discount = discount;
        this.paymentDate = paymentDate;
        this.paymentMode = paymentMode;
        this.total = total;
        this.booking_id = booking_id;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.delateAt = delateAt;
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

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public Timestamp getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Timestamp updateAt) {
        this.updateAt = updateAt;
    }

    public Timestamp getDelateAt() {
        return delateAt;
    }

    public void setDelateAt(Timestamp delateAt) {
        this.delateAt = delateAt;
    }

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    public String toString() {
        return "Bill{" + "id=" + id + ", discount=" + discount + ", paymentDate=" + paymentDate + ", paymentMode=" + paymentMode + ", total=" + total + ", booking_id=" + booking_id + ", createAt=" + createAt + ", updateAt=" + updateAt + ", delateAt=" + delateAt + ", isDelete=" + isDelete + '}';
    }

    
    
    
}
