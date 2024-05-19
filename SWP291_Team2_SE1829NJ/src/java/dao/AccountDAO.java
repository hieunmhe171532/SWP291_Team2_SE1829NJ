package dao;


import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

public class AccountDAO {

   DBContext dbContext;

    public AccountDAO() {
        dbContext = DBContext.getInstance();
    }

    public void createAccount(String username, String password, String phone, String email, String role, boolean isActive) {
        String sql = "INSERT INTO Account (username, password, phone, email, role, isActive) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = dbContext.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, phone);
            pstmt.setString(4, email);
            pstmt.setString(5, role);
            pstmt.setBoolean(6, isActive);
            pstmt.executeUpdate();
            System.out.println("Account created successfully!");
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Account getAccountByUsername(Account acc) {
        try {
            String sql = "SELECT * FROM Account WHERE username = ?";
            Connection conn = dbContext.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, acc.getUsername());

            ResultSet result = stm.executeQuery();

            if (result.next()) {
                String username = result.getString("username");
                String password = result.getString("password");
                String phone = result.getString("phone");
                String email = result.getString("email");
                String role = result.getString("role");

                return new Account(username, password, phone, email, role, true);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
}