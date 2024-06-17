package dao;


import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

public class AccountDAO {  
    private final DBContext dbContext;
    private final Connection connection;

    public AccountDAO() {
         dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();
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
                String role = result.getString("role_id");

                return new Account(username, password, phone, email, role, true);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
    
    public Account getAnAccountByUsername(String username) {
        try {
            String sql = "SELECT * FROM Account WHERE username = ?";
            Connection conn = dbContext.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, username);

            ResultSet result = stm.executeQuery();

            if (result.next()) {
                String usernamemoc = result.getString("username");
                String password = result.getString("password");
                String phone = result.getString("phone");
                String email = result.getString("email");
                String role = result.getString("role_id");

                return new Account(usernamemoc, password, phone, email, role, true);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
 public Account checkAcc(String account_username, String account_pass) {
        String checkUserquery = "SELECT * FROM Account WHERE username = ? AND password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(checkUserquery);
            ps.setString(1, account_username);
            ps.setString(2, account_pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String role = rs.getString("role_id");  // Adjust as needed
                boolean isActive = rs.getBoolean("isActive");

                Account acc = new Account(username, password, phone, email, role, isActive);
                return acc;
            }
        } catch (Exception ex) {
            ex.printStackTrace();  // It is good to log the exception for debugging
        }
        return null;
    }
 
public List<Account> getAllAcc() {
    List<Account> accounts = new ArrayList<>();
    String query = "SELECT * FROM Account";

    try (PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            String username = rs.getString("username");
            String password = rs.getString("password");
            String phone = rs.getString("phone");
            String email = rs.getString("email");
            String role = rs.getString("role_id");  // Adjust as needed
            boolean isActive = rs.getBoolean("isActive");

            Account acc = new Account(username, password, phone, email, role, isActive);
            accounts.add(acc);
        }

    } catch (SQLException ex) {
        ex.printStackTrace();  // Log the exception for debugging purposes
    }

    return accounts;
}


 
 public List<Account> getAllAccWithUser() {
    List<Account> accounts = new ArrayList<>();
    String query = "SELECT a.username, a.password, a.phone, a.email, a.role_id, a.isActive, " +
                   "u.name AS fullname, u.dob, u.gender, u.address " +
                   "FROM Account as a " +
                   "JOIN [User] as u ON a.username = u.username";

    try (PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            String username = rs.getString("username");
            String password = rs.getString("password");
            String phone = rs.getString("phone");
            String email = rs.getString("email");
            String role = rs.getString("role_id");
            boolean isActive = rs.getBoolean("isActive");

            // Additional user details
            String fullname = rs.getString("fullname");
            Date dob = rs.getDate("dob");
            boolean gender = rs.getBoolean("gender");
            String address = rs.getString("address");

            Account acc = new Account(username, password, phone, email, role, isActive, fullname, dob, gender, address);
            accounts.add(acc);
        }

    } catch (SQLException ex) {
        ex.printStackTrace();  // Log the exception for debugging purposes
    }

    return accounts;
}

public Account getAllAccWithUserByUseName(String username) {
    
    String query = "SELECT a.username, a.password, a.phone, a.email, a.role_id, a.isActive, " +
                   "u.name AS fullname, u.dob, u.gender, u.address " +
                   "FROM Account as a " +
                   "JOIN [User] as u ON a.username = u.username " +
                   "WHERE a.username = ?";

    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setString(1, username);  // Set the username parameter

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String retrievedUsername = rs.getString("username");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String role = rs.getString("role_id");
                boolean isActive = rs.getBoolean("isActive");

                // Additional user details
                String fullname = rs.getString("fullname");
                Date dob = rs.getDate("dob");
                boolean gender = rs.getBoolean("gender");
                String address = rs.getString("address");

                Account acc = new Account(retrievedUsername, password, phone, email, role, isActive, fullname, dob, gender, address);
               return acc;
            }
        }
    } catch (SQLException ex) {
        ex.printStackTrace();  // Log the exception for debugging purposes
    }

    return null;
}

    public void AccDelete(String username) {
       
        String sq3 = "delete from [User] where username=?";
        try {
          
          PreparedStatement ps = connection.prepareStatement(sq3);
          
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

        String sql2 = "delete from [Account] where username=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql2);
       
         
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }


    }

    


    
// 
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        Account account = dao.getAllAccWithUserByUseName("admin");
        if (account != null) {
            System.out.println("Account found: " + account);
        } else {
            System.out.println("Account not found");
        }
        
        
    }
    
    
    
    
//    public static void main(String[] args) {
//    // Create an instance of AccountDAO
//    AccountDAO dao = new AccountDAO();
//
//    // Specify the username of the account you want to delete
//    String usernameToDelete = "customer1";
//
//    // Call the AccDelete method with the specified username
//    dao.AccDelete(usernameToDelete);
//
//    // Optional: Check if the account was deleted successfully
//    Account deletedAccount = dao.getAnAccountByUsername(usernameToDelete);
//    if (deletedAccount == null) {
//        System.out.println("Account with username '" + usernameToDelete + "' successfully deleted.");
//    } else {
//        System.out.println("Failed to delete account with username '" + usernameToDelete + "'.");
//    }
//}
    
    
    
}