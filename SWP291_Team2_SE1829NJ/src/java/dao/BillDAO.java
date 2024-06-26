package dao;

import dal.DBContext;
import model.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Bill;
import model.User;

/**
 * DAO class for handling Bill-related database operations.
 * 
 * Author: HUNG
 */
public class BillDAO {
    private final DBContext dbContext;
    private final Connection connection;

    public BillDAO() {
        dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();
    }

    // Method to count the number of bills
    public int countBill() {
        int count = 0;
        String sql = "SELECT COUNT(*) AS countBill FROM Bill";
        
        try (PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            
            if (rs.next()) {
                count = rs.getInt("countBill");
            }
            
        } catch (SQLException e) {
            // Handle exceptions (e.g., log error, notify user, etc.)
        }
        
        return count;
    }
    
     public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT " +
                     "b.id AS BookingID, " +
                     "r.name AS RoomName, " +
                     "u.name AS CustomerName, " +
                     "a.phone AS PhoneNumber, " +
                     "u.address AS Address, " +
                     "b.startDate, " +
                     "b.endDate, " +
                     "bl.total AS Fees, " +
                     "CASE " +
                     "    WHEN bl.paymentMode = 1 THEN 'Cash' " +
                     "    ELSE 'Other' " +
                     "END AS PaymentMode " +
                     "FROM Booking b " +
                     "JOIN [User] u ON b.user_id = u.id " +
                     "JOIN Account a ON u.username = a.username " +
                     "JOIN Room r ON b.room_id = r.id " +
                     "JOIN Bill bl ON b.id = bl.booking_id";

        try (PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("BookingID"),
                        rs.getString("RoomName"),
                        rs.getString("CustomerName"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Address"),
                        rs.getDate("startDate"),
                        rs.getDate("endDate"),
                        rs.getFloat("Fees"),
                        rs.getString("PaymentMode")
                );
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Method to fetch detailed booking information
//    public List<Booking> getBookingByDay() {
//         List<Booking> bookingByDay = new ArrayList<>();
//        String sql = "SELECT " +
//                "b.id AS BookingID, " +
//                "r.name AS RoomName, " +
//                "u.name AS CustomerName, " +
//                "a.phone AS PhoneNumber, " +
//                "u.address AS Address, " +
//                "b.startDate, " +
//                "b.endDate, " +
//                "bl.total AS Fees, " +
//                "CASE " +
//                "    WHEN bl.paymentMode = 1 THEN 'Cash' " +
//                "    ELSE 'Other' " +
//                "END AS PaymentMode " +
//                "FROM Booking b " +
//                "JOIN [User] u ON b.user_id = u.id " +
//                "JOIN Account a ON u.username = a.username " +
//                "JOIN Room r ON b.room_id = r.id " +
//                "JOIN Bill bl ON b.id = bl.booking_id " +
//                "WHERE b.id = ?";
//      
//            try (PreparedStatement st = connection.prepareStatement(sql);
//             ResultSet rs = st.executeQuery()) {
//            while (rs.next()) {
//                Booking booking = new Booking(
//                        rs.getInt("BookingID"),
//                        rs.getString("RoomName"),
//                        rs.getString("CustomerName"),
//                        rs.getString("PhoneNumber"),
//                        rs.getString("Address"),
//                        rs.getDate("startDate"),
//                        rs.getDate("endDate"),
//                        rs.getFloat("Fees"),
//                        rs.getString("PaymentMode")
//                );
//                bookingByDay.add(booking);
//            }
//        }
//        
//        
//        catch (SQLException e) {
//            // Handle exceptions (e.g., log error, notify user, etc.)
//        }
//        
//        return null;
//    }

//    public static void main(String[] args) {
//        BillDAO billDAO = new BillDAO();
//        int count = billDAO.countBill();
//        System.out.println("Number of Bills: " + count);
//
//        // Fetch and print booking details for a specific booking ID
//        int bookingId = 3; // Example booking ID
//        Booking booking = billDAO.getBookingDetails(bookingId);
//        if (booking != null) {
//            System.out.println(booking);
//        } else {
//            System.out.println("Booking not found for ID: " + bookingId);
//        }
//    }
    
    
 public List<Booking> getBookingsByDay(LocalDate day) {
    List<Booking> bookingsByDay = new ArrayList<>();
    String sql = "SELECT " +
                 "b.id AS BookingID, " +
                 "r.name AS RoomName, " +
                 "u.name AS CustomerName, " +
                 "a.phone AS PhoneNumber, " +
                 "u.address AS Address, " +
                 "b.startDate, " +
                 "b.endDate, " +
                 "bl.total AS Fees, " +
                 "CASE " +
                 "    WHEN bl.paymentMode = 1 THEN 'Cash' " +
                 "    ELSE 'Other' " +
                 "END AS PaymentMode " +
                 "FROM Booking b " +
                 "JOIN [User] u ON b.user_id = u.id " +
                 "JOIN Account a ON u.username = a.username " +
                 "JOIN Room r ON b.room_id = r.id " +
                 "JOIN Bill bl ON b.id = bl.booking_id " +
                 "WHERE b.startDate = ?"; // Use placeholder for parameter

    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setObject(1, day); // Set the parameter for the placeholder
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Booking booking = new Booking(
                    rs.getInt("BookingID"),
                    rs.getString("RoomName"),
                    rs.getString("CustomerName"),
                    rs.getString("PhoneNumber"),
                    rs.getString("Address"),
                    rs.getDate("startDate"),
                    rs.getDate("endDate"),
                    rs.getFloat("Fees"),
                    rs.getString("PaymentMode")
            );
            bookingsByDay.add(booking);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return bookingsByDay;
}
    
    
public static void main(String[] args) {
    BillDAO billDAO = new BillDAO();
    int count = billDAO.countBill();
    System.out.println("Number of Bills: " + count);

    // Fetch and print booking details for the current day
    List<Booking> bookings = billDAO.getBookingsByDay(LocalDate.now());
    for (Booking booking : bookings) {
        System.out.println(booking);
    }
}

}
