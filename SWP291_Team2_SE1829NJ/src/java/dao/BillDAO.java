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
 
 
     public int getUserIdByAccountUsername(String username) {
        String sql = "SELECT id FROM [User] WHERE username = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Return -1 if user_id not found
    }

    // Method to add a new Bill
    public void addBill(Bill bill) {
        String sql = "INSERT INTO Bill (user_id, discount, paymentDate, paymentMode, total, booking_id, createAt, updateAt, deleteAt, isDelete) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, bill.getBooking_id()); // Assuming user_id is same as booking_id
            st.setFloat(2, bill.getDiscount());
            st.setDate(3, new java.sql.Date(bill.getPaymentDate().getTime()));
            st.setBoolean(4, bill.isPaymentMode());
            st.setFloat(5, bill.getTotal());
            st.setInt(6, bill.getBooking_id());
            st.setTimestamp(7, new java.sql.Timestamp(bill.getCreateAt().getTime()));
            st.setTimestamp(8, new java.sql.Timestamp(bill.getUpdateAt().getTime()));
            st.setTimestamp(9, new java.sql.Timestamp(bill.getDeleteAt().getTime()));
            st.setBoolean(10, bill.isIsDelete());

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to get a Bill by ID
    public Bill getBillById(int id) {
        String sql = "SELECT * FROM Bill WHERE id = ?";
        Bill bill = null;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                bill = new Bill(
                    rs.getInt("id"),
                    rs.getFloat("discount"),
                    rs.getDate("paymentDate"),
                    rs.getBoolean("paymentMode"),
                    rs.getFloat("total"),
                    rs.getInt("booking_id"),
                    rs.getTimestamp("createAt"),
                    rs.getTimestamp("updateAt"),
                    rs.getTimestamp("deleteAt"),
                    rs.getBoolean("isDelete")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bill;
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
