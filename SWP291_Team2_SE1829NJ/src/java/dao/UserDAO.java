/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.User;

/**
 *
 * @author hieum
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;

public class UserDAO extends DBContext{



    public void createUser(User user) {
        String name, gender, address;
        Date dob;
        String sql = "INSERT INTO [User] (username, name, dob, gender, address) VALUES (?, ?, ?, ?, ?)";
        try (
//                Connection conn = dbContext.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, user.getUsername().getUsername());
            pstmt.setString(2, user.getName());
            pstmt.setDate(3, new Date(user.getDob().getTime()));
            pstmt.setBoolean(4, user.isGender());
            pstmt.setString(5, user.getAddress());
            pstmt.executeUpdate();
            System.out.println("User created successfully!");
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//                      public int countUser() {
//    int count = 0;
//    String sql = " SELECT COUNT(*) AS TotalUsers FROM [dbo].[User]";
//    
//    try (Connection conn = dbContext.getConnection();
//         PreparedStatement stm = conn.prepareStatement(sql);
//         ResultSet rs = stm.executeQuery()) {
//        
//        if (rs.next()) {
//            count = rs.getInt(1);
//        }
//        
//    } catch (SQLException e) {
//        // Xử lý ngoại lệ (ví dụ: log lỗi, thông báo cho người dùng, etc.)
//
//    }
//    
//    return count;
//}
    public List<User> getAllUser() {
//        Connection conn = dbContext.getConnection();
        LocalDateTime curDate = java.time.LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String date = curDate.format(formatter);
        List<User> t = new ArrayList<>();

        try {
            String sql = "SELECT * from Account a JOIN [User] u \n"
                    + "on a.username=u.username";
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet result = stm.executeQuery();

            while (result.next()) {
                User u=new User();
                Account a = new Account();
                a.setUsername(result.getString(1));
                a.setPassword(result.getString(2));
                a.setPhone(result.getString(3));
                a.setEmail(result.getString(4));
                a.setRole_id(result.getString(5));
                a.setIsActive(result.getBoolean(6));
                u.setId(result.getInt(7));
                u.setName(result.getString(8));
                u.setDob(result.getDate(9));
                u.setGender(result.getBoolean(10));
                u.setAddress(result.getString(11));
                u.setUsername(a);
                u.setCreateAt(result.getString(13));
                u.setUpdateAt(result.getString(14));
                u.setIsDelete(result.getBoolean(15));
                
                
                t.add(u);
            }
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return t;
    }
    public List<User> getUserByName(String name) {
//        Connection conn = dbContext.getConnection();

        List<User> t = new ArrayList<>();

        try {
            String sql = "SELECT * from Account a JOIN [User] u \n"
                    + "on a.username=u.username\n"
                    + "WHERE name like ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + name + "%");

            ResultSet result = stm.executeQuery();

            while (result.next()) {
                User u = new User();
                Account a = new Account();
                a.setUsername(result.getString(1));
                a.setPassword(result.getString(2));
                a.setPhone(result.getString(3));
                a.setEmail(result.getString(4));
                a.setRole_id(result.getString(5));
                a.setIsActive(result.getBoolean(6));
                u.setId(result.getInt(7));
                u.setName(result.getString(8));
                u.setDob(result.getDate(9));
                u.setGender(result.getBoolean(10));
                u.setAddress(result.getString(11));
                u.setUsername(a);
                u.setCreateAt(result.getString(13));
                u.setUpdateAt(result.getString(14));
                u.setIsDelete(result.getBoolean(15));
                t.add(u);
            }
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return t;
    }
    public User getUserById(String id){
//        Connection conn = dbContext.getConnection();

        try {
            String sql = "SELECT * from Account a JOIN [User] u \n"
                    + "on a.username=u.username\n"
                    + "WHERE id = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);

            ResultSet result = stm.executeQuery();

            while (result.next()) {
                User u = new User();
                Account a = new Account();
                a.setUsername(result.getString(1));
                a.setPassword(result.getString(2));
                a.setPhone(result.getString(3));
                a.setEmail(result.getString(4));
                a.setRole_id(result.getString(5));
                a.setIsActive(result.getBoolean(6));
                u.setId(result.getInt(7));
                u.setName(result.getString(8));
                u.setDob(result.getDate(9));
                u.setGender(result.getBoolean(10));
                u.setAddress(result.getString(11));
                u.setUsername(a);
                u.setCreateAt(result.getString(13));
                u.setUpdateAt(result.getString(14));
                u.setIsDelete(result.getBoolean(15));
                return u;
            }
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

        
    }

    public int countUsers() {
        int count = 0;
        String sql = "SELECT COUNT(*) AS TotalUsers FROM [dbo].[User]";

        try (
                PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery();) {

            if (rs.next()) {
                count = rs.getInt("TotalUsers");
            }

        } catch (SQLException e) {
            // Handle exception appropriately (log, notify user, etc.)
            e.printStackTrace();
        }

        return count;
    }

    public static void main(String[] args) {
        UserDAO udao = new UserDAO();
//        List<User> list=udao.getUserByName("hie");
//        for (User user : list) {
//            System.out.println(user);
//        }
User u=udao.getUserById("8");
        System.out.println(u);
    }

}
