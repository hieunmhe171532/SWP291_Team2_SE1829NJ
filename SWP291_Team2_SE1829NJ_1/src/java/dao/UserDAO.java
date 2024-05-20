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

public class UserDAO{

    DBContext dbContext;

    public UserDAO(){
        dbContext = DBContext.getInstance();
    }

    public void createUser(User user) {
        String name,gender,address;
        Date dob;
        String sql = "INSERT INTO [User] (username, name, dob, gender, address) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = dbContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
           
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getName());
            pstmt.setDate(3,new Date (user.getDob().getTime()));
            pstmt.setBoolean(4,user.isGender());
            pstmt.setString(5,user.getAddress());
            pstmt.executeUpdate();
            System.out.println("User created successfully!");
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        User user = new User("abc", "John Doe", new java.util.Date(),false , "123 Test St, Test City");
        userDAO.createUser(user);
    }
}
