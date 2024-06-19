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

/**
 *
 * @author HUNG
 */
public class MenuDAO {
     private final DBContext dbContext;
    private final Connection connection;

    public MenuDAO() {
        dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();
    }
                    public int countFood() {
    int count = 0;
    String sql = "SELECT COUNT(*) AS countFood FROM Restaurant";
    
    try (
             PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery()
            ) {
        
        if (rs.next()) {
            count = rs.getInt("countFood");
        }
        
    } catch (SQLException e) {
        // Xử lý ngoại lệ (ví dụ: log lỗi, thông báo cho người dùng, etc.)
        e.printStackTrace();
    }
    
    return count;
}
                    
   public static void main(String[] args) {
        MenuDAO rdao = new MenuDAO();
        int count = rdao.countFood();
        System.out.println("Number of food: " + count);
    }          
                    
          
}
