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
public class BillDAO {
     private final DBContext dbContext;
    private final Connection connection;

    public BillDAO() {
        dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();
    }

                    public int countBill() {
    int count = 0;
    String sql = "SELECT COUNT(*) AS countBill FROM Bill";
    
    try ( PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery()) {
        
        if (rs.next()) {
            count = rs.getInt("countBill");
        }
        
    } catch (SQLException e) {
        // Xử lý ngoại lệ (ví dụ: log lỗi, thông báo cho người dùng, etc.)

    }
    
    return count;
}
                    
   public static void main(String[] args) {
       BillDAO rdao = new BillDAO();
        int count = rdao.countBill();
        System.out.println("Number of Bill: " + count);
    }  




}
