package model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<BookingItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<BookingItem> items) {
        this.items = items;
    }

    public List<BookingItem> getItems() {
        return items;
    }

    public void setItems(List<BookingItem> items) {
        this.items = items;
    }

    public int getQuantityByRoomId(int roomId) {
        BookingItem item = getBookingItemByRoomId(roomId);
        return item != null ? item.getQuantity() : 0;
    }

    private BookingItem getBookingItemByRoomId(int roomId) {
        for (BookingItem item : items) {
            if (item.getRoom().getId() == roomId) {
                return item;
            }
        }
        return null;
    }

    private BookingItem checkBookingItem(int roomId, LocalDate startDate, LocalDate endDate) {
        for (BookingItem item : items) {
            if (item.getRoom().getId() == roomId && item.getStartDate().equals(startDate) && item.getEndDate().equals(endDate)) {
                return item;
            }
        }
        return null;
    }

    public void addBookingItem(BookingItem newItem) {
        BookingItem existingItem = checkBookingItem(newItem.getRoom().getId(), newItem.getStartDate(), newItem.getEndDate());
        if (existingItem != null) {
            existingItem.setQuantity(existingItem.getQuantity() + newItem.getQuantity());
        } else {
            items.add(newItem);
        }
    }

    public void removeBookingItem(int roomId, LocalDate startDate, LocalDate endDate) {
        BookingItem itemToRemove = checkBookingItem(roomId, startDate, endDate);
        if (itemToRemove != null) {
            items.remove(itemToRemove);
        }
    }

    public double getTotalCost() {
        double totalCost = 0;
        for (BookingItem item : items) {
            totalCost += item.calculateCost();
        }
        return totalCost;
    }
}
