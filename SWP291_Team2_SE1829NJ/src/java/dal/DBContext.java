package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

//public class DBContext {
//    public Connection connection;
//    public DBContext()
//    {
//        try {
//            //Change the username password and url to connect your own database
//            String username = "hieu";
//            String password = "123456";
//            String url = "jdbc:sqlserver://localhost:1433;databaseName=HotelBooking";
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            connection = DriverManager.getConnection(url, username, password);
//        } catch (ClassNotFoundException | SQLException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//    
//    public static void main(String[] args) {
//        DBContext db = new DBContext();
//    }
//
//    Connection getConnection() {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
//public class DBContext {
//
//    public Connection conn = null;
//    private static DBContext instance;
//    private final String DB_HOST = "localhost";
//    private final String DB_PORT = "1433";
//    private final String DB_NAME = "HotelBooking";
//    private final String DB_USER = "test";
//    private final String DB_PASS = "12345678";
//
//    public static DBContext getInstance() {
//        if (instance == null) {
//            instance = new DBContext();
//        }
//        return instance;
//    }
//
//    private DBContext() {
//        try {
//            if (conn == null || conn.isClosed()) {
//                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//                // connection
//                String connectionString = "jdbc:sqlserver://" + DB_HOST + ":" + DB_PORT + ";databaseName=" + DB_NAME + ";encrypt=true;trustServerCertificate=true;";
//                conn = DriverManager.getConnection(connectionString, DB_USER, DB_PASS);
//            }
//            System.out.println("Connected to SQL Server");
//        } catch (ClassNotFoundException | SQLException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    public Connection getConnection() {
//        return conn;
//    }
//
//    public static void main(String[] args) {
//        DBContext.getInstance().getConnection();
//    }
//}
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    public Connection conn = null;
    private static DBContext instance;
    private final String DB_HOST = "localhost";
    private final String DB_PORT = "1433";
    private final String DB_NAME = "bookinghotelver3";
    private final String DB_USER = "test";
    private final String DB_PASS = "12345678";

    public static DBContext getInstance() {
        if (instance == null) {
            instance = new DBContext();
        }
        return instance;
    }

    private DBContext() {
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                // connection
                String connectionString = "jdbc:sqlserver://" + DB_HOST + ":" + DB_PORT + ";databaseName=" + DB_NAME + ";encrypt=true;trustServerCertificate=true;";
                conn = DriverManager.getConnection(connectionString, DB_USER, DB_PASS);
            }
            System.out.println("Connected to SQL Server");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Connection getConnection() {
        return conn;
    }

    public static void main(String[] args) {
        DBContext.getInstance().getConnection();
    }
}
