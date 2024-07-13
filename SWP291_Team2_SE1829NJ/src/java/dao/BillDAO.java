package dao;

import dal.DBContext;
import model.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Bill;
import model.BookingItem;
import model.Cart;
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
    
     public List<Bill> getAllBills() {
    List<Bill> bills = new ArrayList<>();
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
            int bookingId = rs.getInt("BookingID");
            String roomName = rs.getString("RoomName");
            String customerName = rs.getString("CustomerName");
            String phoneNumber = rs.getString("PhoneNumber");
            String address = rs.getString("Address");
            Date startDate = rs.getDate("startDate");
            Date endDate = rs.getDate("endDate");
            float fees = rs.getFloat("Fees");
            String paymentMode = rs.getString("PaymentMode");

            Bill bill = new Bill(bookingId, roomName, customerName, phoneNumber, address, startDate, endDate, fees, paymentMode);
            bills.add(bill);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return bills;
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
    
      // Method to get all bookings by user_id
    public List<Booking> getAllBookingsByUserId(int userId) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Booking WHERE user_id = ?";
        
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("id"),
                        rs.getInt("room_id"),
                        rs.getInt("user_id"),
                        rs.getInt("bill_id"),
                        rs.getDate("startDate"),
                        rs.getDate("endDate"),
                        rs.getFloat("cost"),
                        rs.getTimestamp("createAt")
                );
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
     
     
   public void addBooking(Cart cart, int userId, int billId) throws SQLException {
        String sqlBooking = "INSERT INTO Booking (room_id, user_id, bill_id, startDate, endDate, cost, createAt) VALUES (?, ?, ?, ?, ?, ?, ?)";
        for (BookingItem item : cart.getItems()) {
            try (PreparedStatement psBooking = connection.prepareStatement(sqlBooking)) {
                psBooking.setInt(1, item.getRoom().getId()); // room_id
                psBooking.setInt(2, userId); // user_id
                psBooking.setInt(3, billId); // bill_id
                psBooking.setDate(4, java.sql.Date.valueOf(item.getStartDate())); // startDate
                psBooking.setDate(5, java.sql.Date.valueOf(item.getEndDate())); // endDate

                // Tính toán cost dựa trên giá phòng và số ngày lưu trú
                double roomPrice = item.getRoom().getPrice(); // Lấy giá phòng từ Room
                long days = java.time.temporal.ChronoUnit.DAYS.between(item.getStartDate(), item.getEndDate());
                double cost = roomPrice * days;

                psBooking.setFloat(6, (float) cost); // Chuyển đổi cost thành float và thiết lập giá trị
                psBooking.setTimestamp(7, new java.sql.Timestamp(System.currentTimeMillis())); // createAt

                psBooking.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle the exception or log it
            }
        }
    }
// public List<Booking> getBookingsByDay(LocalDate day) {
//    List<Booking> bookingsByDay = new ArrayList<>();
//    String sql = "SELECT " +
//                 "b.id AS BookingID, " +
//                 "r.name AS RoomName, " +
//                 "u.name AS CustomerName, " +
//                 "a.phone AS PhoneNumber, " +
//                 "u.address AS Address, " +
//                 "b.startDate, " +
//                 "b.endDate, " +
//                 "bl.total AS Fees, " +
//                 "CASE " +
//                 "    WHEN bl.paymentMode = 1 THEN 'Cash' " +
//                 "    ELSE 'Other' " +
//                 "END AS PaymentMode " +
//                 "FROM Booking b " +
//                 "JOIN [User] u ON b.user_id = u.id " +
//                 "JOIN Account a ON u.username = a.username " +
//                 "JOIN Room r ON b.room_id = r.id " +
//                 "JOIN Bill bl ON b.id = bl.booking_id " +
//                 "WHERE b.startDate = ?"; // Use placeholder for parameter
//
//    try (PreparedStatement st = connection.prepareStatement(sql)) {
//        st.setObject(1, day); // Set the parameter for the placeholder
//        ResultSet rs = st.executeQuery();
//        while (rs.next()) {
//            Booking booking = new Booking(
//                    rs.getInt("BookingID"),
//                    rs.getString("RoomName"),
//                    rs.getString("CustomerName"),
//                    rs.getString("PhoneNumber"),
//                    rs.getString("Address"),
//                    rs.getDate("startDate"),
//                    rs.getDate("endDate"),
//                    rs.getFloat("Fees"),
//                    rs.getString("PaymentMode")
//            );
//            bookingsByDay.add(booking);
//        }
//    } catch (SQLException e) {
//        e.printStackTrace();
//    }
//    return bookingsByDay;
//}
// 
// 
 public int getLastBillId() {
    String sql = "SELECT TOP 1 id FROM [Bill] ORDER BY id DESC";
    try (PreparedStatement ps = connection.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
            return rs.getInt("id");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return -1; // Return -1 if no bill found or in case of an error
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
    String sql = "INSERT INTO Bill (used_id, phone, email, address, discount, paymentDate, paymentMode, paymentMethod, total, createAt, updateAt, deleteAt, isDelete) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setInt(1, bill.getBooking_id());
        st.setString(2, bill.getPhone());
        st.setString(3, bill.getEmail());
        st.setString(4, bill.getAddress());
        st.setFloat(5, bill.getDiscount());
        st.setDate(6, new java.sql.Date(bill.getPaymentDate().getTime()));
        st.setBoolean(7, bill.isPaymentMode());
        st.setString(8, bill.getPaymentMethod());
        st.setFloat(9, bill.getTotal());
        st.setTimestamp(10, new java.sql.Timestamp(bill.getCreateAt().getTime()));
        st.setTimestamp(11, new java.sql.Timestamp(bill.getUpdateAt().getTime()));
        if (bill.getDeleteAt() != null) {
            st.setTimestamp(12, new java.sql.Timestamp(bill.getDeleteAt().getTime()));
        } else {
            st.setNull(12, java.sql.Types.TIMESTAMP);
        }
        st.setBoolean(13, bill.isIsDelete());
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


//public static void main(String[] args) {
//    BillDAO billDAO = new BillDAO();
//    int count = billDAO.countBill();
//    System.out.println("Number of Bills: " + count);
//
//    // Fetch and print booking details for the current day
//    List<Booking> bookings = billDAO.getBookingsByDay(LocalDate.now());
//    for (Booking booking : bookings) {
//        System.out.println(booking);
//    }
//}

    
    public List<Map<String, Object>> getBookingSummaryByUserId(int userId) {
    List<Map<String, Object>> bookingSummaries = new ArrayList<>();
    String sql = "SELECT " +
                 "bk.id AS [Mã booking], " +
                 "bk.createAt AS [Ngày khởi tạo], " +
                 "CASE " +
                 "    WHEN bl.paymentMode = 1 THEN 'Cash' " +
                 "    ELSE 'Other' " +
                 "END AS [Hình thức GD], " +
                 "bk.startDate AS [startdate], " +
                 "bk.endDate AS [endate], " +
                 "bk.cost AS [cost], " +
                 "r.name AS [room] " +
                 "FROM Booking bk " +
                 "JOIN Bill bl ON bk.bill_id = bl.id " +
                 "JOIN Room r ON bk.room_id = r.id " +
                 "WHERE bk.user_id = ?;";

    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setInt(1, userId);
        try (ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> bookingSummary = new HashMap<>();
                bookingSummary.put("Mã booking", rs.getInt("Mã booking"));
                bookingSummary.put("Ngày khởi tạo", rs.getTimestamp("Ngày khởi tạo"));
                bookingSummary.put("Hình thức GD", rs.getString("Hình thức GD"));
                bookingSummary.put("startdate", rs.getDate("startdate"));
                bookingSummary.put("endate", rs.getDate("endate"));
                bookingSummary.put("cost", rs.getFloat("cost"));
                bookingSummary.put("room", rs.getString("room"));
                bookingSummaries.add(bookingSummary);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return bookingSummaries;
}

    
    public static void main(String[] args) {
    BillDAO billDAO = new BillDAO();
    
    // Fetch and print booking summaries for a specific user ID
    int userId = 1; // Replace with a valid user ID
    List<Map<String, Object>> bookingSummaries = billDAO.getBookingSummaryByUserId(userId);
    System.out.println("Booking Summaries for user_id " + userId + ":");
    for (Map<String, Object> summary : bookingSummaries) {
        System.out.println(summary);
    }
}
}
