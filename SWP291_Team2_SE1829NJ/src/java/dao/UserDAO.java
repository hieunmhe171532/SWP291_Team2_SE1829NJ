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

     private final DBContext dbContext;
    private final Connection connection;

    public UserDAO() {
        dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();
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
    
public int countUsers() {
    int count = 0;
    String sql = "SELECT COUNT(*) AS TotalUsers FROM [dbo].[User]";

    try (
             PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            ) {

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
        int count = udao.countUsers();
        System.out.println("Number of user: " + count);
    }
    
    
    
    
    
    
    
    
    
}
