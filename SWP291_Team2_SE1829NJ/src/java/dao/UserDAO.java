/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
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
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO {

    DBContext dbContext;

    public UserDAO() {
        dbContext = DBContext.getInstance();
    }

    public void createUser(User user) {
        String name, gender, address;
        Date dob;
        String sql = "INSERT INTO [User] (username, name, dob, gender, address) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = dbContext.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getUsername());
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

//    public User getUserbyUsername(Account acc) {
//
//        try {
//            String sql = "SELECT * FROM [User] WHERE username = ?";
//            Connection conn = dbContext.getConnection();
//            PreparedStatement stm = conn.prepareStatement(sql);
//            stm.setString(1, acc.getUsername()); // Assuming you have a getUsername method in the Account class
//
//            ResultSet rs = stm.executeQuery();
//
//            if (rs.next()) {
//                // User found, create a User object with the retrieved data
//                int id = rs.getInt("id");
//                String name = rs.getString("name");
//                Date dob = rs.getDate("dob");
//                boolean gender = rs.getBoolean("gender");
//                String address = rs.getString("address");
//
//                // Retrieve other user properties here
//                User user = new User(id, name, dob, gender, address, name, createAt, updateAt, gender);
//
//                return user;
//
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        return null;
//    }

//    public static void main(String[] args) {
//        UserDAO userDAO = new UserDAO();
//        User user = new User("abc", "John Doe", new java.sql.Date(),false , "123 Test St, Test City");
//        userDAO.createUser(user);
//    }
}
