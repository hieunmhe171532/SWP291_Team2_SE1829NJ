package model;

import java.time.LocalDate;
import java.util.Date;

public class BookingItem {
    private Room room;
    private LocalDate startDate;
    private LocalDate endDate;
    private int quantity;
    private String formattedStartDate;
    private String formattedEndDate;

    public BookingItem(Room room, LocalDate startDate, LocalDate endDate, int quantity) {
        this.room = room;
        this.startDate = startDate;
        this.endDate = endDate;
        this.quantity = quantity;
    }

    // Các getter và setter
    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getFormattedStartDate() {
        return formattedStartDate;
    }

    public void setFormattedStartDate(String formattedStartDate) {
        this.formattedStartDate = formattedStartDate;
    }

    public String getFormattedEndDate() {
        return formattedEndDate;
    }

    public void setFormattedEndDate(String formattedEndDate) {
        this.formattedEndDate = formattedEndDate;
    }

    public float calculateCost() {
        long days = java.time.temporal.ChronoUnit.DAYS.between(startDate, endDate);
        return days * room.getPrice() * quantity;
    }
}
