package dao;


import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Count;
import model.User;

public class AccountDAO {  
 
   DBContext dbContext;
    Connection connection;

    public AccountDAO() {
         dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();
    }

    public void createAccount(String username, String password, String phone, String email, String role, boolean isActive) {
       
     
        
        String sql = "INSERT INTO Account (username, password, phone, email, role, isActive) VALUES (?, ?, ?, ?, ?, ?)";
        try (
                Connection conn = dbContext.getConnection(); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
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

       public String getUserNameByEmail(String email) {
        String sql = "SELECT username FROM [Account] WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //set ?
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String name = rs.getString(1);
                return name;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
       
              public String getPassWordByEmail(String email) {
        String sql = "SELECT password FROM [Account] WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //set ?
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String name = rs.getString(1);
                return name;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
       
    
            public String checkEmailExist(String email) {
        try {
            String sql = "SELECT * FROM [Account] WHERE email = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return email;
            }
        } catch (SQLException e) {
        }
        return null;
    }

            
    public Account getAccountByUsername(Account acc) {
    
        try {
            String sql = "SELECT * FROM Account WHERE username = ?";
           
            PreparedStatement stm = connection.prepareStatement(sql);
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
//            Connection conn = dbContext.getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
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

    try (
            PreparedStatement ps = connection.prepareStatement(query);
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

    


public void updateAccountAndUser(String username,String password, String newPhone, String newEmail, int newRoleId, boolean newIsActive,
                                 String newName, Date newDob, boolean newGender, String newAddress, boolean newIsDelete) throws SQLException {
    String updateAccountSQL = "UPDATE Account SET password =? , phone = ?, email = ?, role_id = ?, isActive = ? WHERE username = ?";
    String updateUserSQL = "UPDATE [User] SET name = ?, dob = ?, gender = ?, address = ?, isDelete = ? WHERE username = ?";

    try {
        connection.setAutoCommit( false);

        try (PreparedStatement psAccount = connection.prepareStatement(updateAccountSQL);
             PreparedStatement psUser = connection.prepareStatement(updateUserSQL)) {

            // Cập nhật bảng Account
              psAccount.setString(1, password);
            psAccount.setString(2, newPhone);
            psAccount.setString(3, newEmail);
            psAccount.setInt(4, newRoleId);
            psAccount.setBoolean(5, newIsActive);
            psAccount.setString(6, username);
            psAccount.executeUpdate();

            // Cập nhật bảng User
            psUser.setString(1, newName);
            psUser.setDate(2, new java.sql.Date(newDob.getTime()));
            psUser.setBoolean(3, newGender);
            psUser.setString(4, newAddress);
       
            psUser.setBoolean(5, newIsDelete);
            psUser.setString(6, username);
            psUser.executeUpdate();

            connection.commit();
        } catch (SQLException ex) {
            connection.rollback();
            throw ex;
        } finally {
            connection.setAutoCommit(true);
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        throw ex;
    }
}

  public void createAccountWithUser(String username, String password, String phone, String email, int role, boolean isActive,
                                      String fullName, Date dob, boolean gender, String address) {
        // SQL statement for Account
        String sqlAccount = "INSERT INTO Account (username, password, phone, email, role_id, isActive) VALUES (?, ?, ?, ?, ?, ?)";
        // SQL statement for User
        String sqlUser = "INSERT INTO [User] (username, name, dob, gender, address) VALUES (?, ?, ?, ?, ?)";

        try {
            // Set auto-commit to false
            connection.setAutoCommit(false);

            // Insert into Account
            try (PreparedStatement pstmtAccount = connection.prepareStatement(sqlAccount)) {
                pstmtAccount.setString(1, username);
                pstmtAccount.setString(2, password);
                pstmtAccount.setString(3, phone);
                pstmtAccount.setString(4, email);
                pstmtAccount.setInt(5, role);
                pstmtAccount.setBoolean(6, isActive);
                pstmtAccount.executeUpdate();
            }

            // Insert into User
            try (PreparedStatement pstmtUser = connection.prepareStatement(sqlUser)) {
                pstmtUser.setString(1, username);
                pstmtUser.setString(2, fullName);
                pstmtUser.setDate(3, new java.sql.Date(dob.getTime())); // Convert java.util.Date to java.sql.Date
                pstmtUser.setBoolean(4, gender);
                pstmtUser.setString(5, address);
                pstmtUser.executeUpdate();
            }

            // Commit both transactions
            connection.commit();
            System.out.println("Account and User created successfully!");
        } catch (SQLException ex) {
            try {
                // Rollback any changes if exception occurs
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException se2) {
            }
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                // Reset default commit behavior
                connection.setAutoCommit(true);
            } catch (SQLException se) {

            }
        }
    }
    
// 
//    public static void main(String[] args) {
//        AccountDAO dao = new AccountDAO();
//        Account account = dao.getAllAccWithUserByUseName("admin");
//        if (account != null) {
//            System.out.println("Account found: " + account);
//        } else {
//            System.out.println("Account not found");
//        }
        
        
//    }
    

    public void register(String username, String password, String phone, String email, int role, boolean isActive, String fullname, Date dob, boolean gender, String address) {
        String sqlAccount = "INSERT INTO Account (username, password, phone, email, role_id, isActive) VALUES (?, ?, ?, ?, ?, ?)";
        String sqlUser = "INSERT INTO [User] (username, name, dob, gender, address) VALUES (?, ?, ?, ?, ?)";

        try {
            connection.setAutoCommit(false);  // Begin transaction

            // Insert into Account
            try (PreparedStatement pstmtAccount = connection.prepareStatement(sqlAccount)) {
                pstmtAccount.setString(1, username);
                pstmtAccount.setString(2, password);
                pstmtAccount.setString(3, phone);
                pstmtAccount.setString(4, email);
                pstmtAccount.setInt(5, role);
                pstmtAccount.setBoolean(6, isActive);
                pstmtAccount.executeUpdate();
            }

            // Insert into User
            try (PreparedStatement pstmtUser = connection.prepareStatement(sqlUser)) {
                pstmtUser.setString(1, username);
                pstmtUser.setString(2, fullname);
                pstmtUser.setDate(3, new java.sql.Date(dob.getTime()));  // Convert java.util.Date to java.sql.Date
                pstmtUser.setBoolean(4, gender);
                pstmtUser.setString(5, address);
                pstmtUser.executeUpdate();
            }

            connection.commit();  // Commit transaction
            System.out.println("Registration successful!");
        } catch (SQLException ex) {
            try {
                if (connection != null) {
                    connection.rollback();  // Rollback transaction on error
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.setAutoCommit(true);  // Reset auto-commit to true
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
    public int countAcc() {
        int count = 0;
        String sql = "SELECT COUNT(*) AS TotalAcc FROM [dbo].[Account]";

        try (
                PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery();) {

            if (rs.next()) {
                count = rs.getInt("TotalAcc");
            }

        } catch (SQLException e) {
            // Handle exception appropriately (log, notify user, etc.)
            e.printStackTrace();
        }

        return count;
    }
    public int totalAccComment() {
        int count = 0;
        String sql = "SELECT  COUNT(distinct f.username) as commentAcc from Feedback f";
        
        try (
                PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery();) {
            
            if (rs.next()) {
                count = rs.getInt("commentAcc");
            }
            
        } catch (SQLException e) {
            // Handle exception appropriately (log, notify user, etc.)
            e.printStackTrace();
        }
        
        return count;
    }
    
    public List<Count> genderFeedback() {
        
        List<Count> t = new ArrayList<>();
        String sql = "select u.gender,COUNT(DISTINCT Account.username) as count "
                + " from Account join [dbo].[User] u on Account.username=u.username "
                + " join feedback  on Account.username=feedback.username"
                + " group by u.gender"
                + " order by count desc;";
        
        
        try (
                PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery();) {
            
            while (rs.next()) {
                Count c = new Count();
                User u=new User();
                u.setGender(rs.getBoolean(1));
                c.setUser(u);
                c.setCount(rs.getInt(2));
                t.add(c);
                
            }
            
        } catch (SQLException e) {
            // Handle exception appropriately (log, notify user, etc.)
            e.printStackTrace();
        }
        
        return t;
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();

        // Test data for registration
//        String username = "newuser";
//        String password = "password123";
//        String phone = "1234567890";
//        String email = "newuser@example.com";
//        int role = 1;  // Assuming 1 is the role ID for a regular user
//        boolean isActive = true;
//        String fullname = "New User";
//        Date dob = null;
//        try {
//            dob = new SimpleDateFormat("dd-MM-yyyy").parse("31-10-2003");
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//        boolean gender = true;  // True for male, false for female
//        String address = "123 Main St, Cityville";
//
//        dao.register(username, password, phone, email, role, isActive, fullname, dob, gender, address);
List<Count> l=dao.genderFeedback();
        for (Count c : l) {
            System.out.println(c);
        }
        }
    
    
    
}