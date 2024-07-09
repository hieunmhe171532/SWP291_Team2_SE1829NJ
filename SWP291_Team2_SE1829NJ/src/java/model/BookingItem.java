package model;

import java.time.LocalDate;
import java.util.logging.Logger;

public class BookingItem {
    private static final Logger logger = Logger.getLogger(BookingItem.class.getName());
    
    private Room room;
    private LocalDate startDate;
    private LocalDate endDate;
    private int quantity;

    public BookingItem() {
        // Default constructor
    }

    public BookingItem(Room room, LocalDate startDate, LocalDate endDate, int quantity) {
        if (startDate.isAfter(endDate)) {
            throw new IllegalArgumentException("Start date must be before end date.");
        }
        if (quantity <= 0) {
            throw new IllegalArgumentException("Quantity must be positive.");
        }

        this.room = room;
        this.startDate = startDate;
        this.endDate = endDate;
        this.quantity = quantity;
    }

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
        if (endDate != null && startDate.isAfter(endDate)) {
            throw new IllegalArgumentException("Start date must be before end date.");
        }
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        if (startDate != null && endDate.isBefore(startDate)) {
            throw new IllegalArgumentException("End date must be after start date.");
        }
        this.endDate = endDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        if (quantity <= 0) {
            throw new IllegalArgumentException("Quantity must be positive.");
        }
        this.quantity = quantity;
    }

    public double calculateCost() {
        long days = java.time.temporal.ChronoUnit.DAYS.between(startDate, endDate);
        double cost = days * room.getPrice() * quantity;
        logger.info("Calculated cost: " + cost);
        return cost;
    }

    @Override
    public String toString() {
        return "BookingItem{" +
                "room=" + room +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", quantity=" + quantity +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BookingItem that = (BookingItem) o;

        if (quantity != that.quantity) return false;
        if (!room.equals(that.room)) return false;
        if (!startDate.equals(that.startDate)) return false;
        return endDate.equals(that.endDate);
    }

    @Override
    public int hashCode() {
        int result = room.hashCode();
        result = 31 * result + startDate.hashCode();
        result = 31 * result + endDate.hashCode();
        result = 31 * result + quantity;
        return result;
    }
}
