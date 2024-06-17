/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.UserAccount;

/**
 *
 * @author HUNG
 */
public class UserAccountDAO {
        private final DBContext dbContext;
    private final Connection connection;

    public UserAccountDAO() {
         dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();
    }

 public UserAccount getUserAccountByUsername(String username) {
        String sql = "SELECT u.id, u.name AS fullname, u.dob, u.gender, u.address, " +
        
                     "u.createAt, u.updateAt, u.isDelete, " +
                     "a.username, a.password, a.phone, a.email, a.role_id, a.isActive " +
                     "FROM [User] u " +
                     "JOIN [Account] a ON u.username = a.username " +
                     "WHERE a.username = ?";
        try (Connection conn = dbContext.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {

            stm.setString(1, username);
            ResultSet result = stm.executeQuery();

            if (result.next()) {
                int id = result.getInt("id");
                String fullname = result.getString("fullname");
                Date dob = result.getDate("dob");
                boolean gender = result.getBoolean("gender");
                String address = result.getString("address");
                String createAt = result.getString("createAt");
                String updateAt = result.getString("updateAt");
                boolean isDelete = result.getBoolean("isDelete");

                String password = result.getString("password");
                String phone = result.getString("phone");
                String email = result.getString("email");
                String role = result.getString("role_id");
                boolean isActive = result.getBoolean("isActive");

                return new UserAccount(id, username, password, phone, email, role, isActive, fullname, dob, gender, address, createAt, updateAt, isDelete);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserAccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
     public static void main(String[] args) {
        UserAccountDAO dao = new UserAccountDAO();
        UserAccount account = dao.getUserAccountByUsername("admin");
        if (account != null) {
            System.out.println("Account found: " + account);
        } else {
            System.out.println("Account not found");
        }
        
        
    }
    
    
    
}
