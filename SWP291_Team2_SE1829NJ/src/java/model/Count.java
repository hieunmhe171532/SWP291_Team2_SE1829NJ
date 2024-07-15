/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import model.User;

/**
 *
 * @author admin
 */
public class Count {
    private String address;
    private int count;
    private User user;
    private Account acc;
    

    public Count() {
    }

    public Count(String address, int count, User user, Account acc) {
        this.address = address;
        this.count = count;
        this.user = user;
        this.acc = acc;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Account getAcc() {
        return acc;
    }

    public void setAcc(Account acc) {
        this.acc = acc;
    }

    @Override
    public String toString() {
        return "Count{" + "address=" + address + ", count=" + count + ", user=" + user + ", acc=" + acc + '}';
    }

    
    
}