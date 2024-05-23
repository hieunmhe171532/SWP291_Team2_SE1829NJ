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

public class RoomDAO {
    
      DBContext dbContext;


          public RoomDAO() {
        dbContext = DBContext.getInstance();
    }
     
      
        public int CountRoom() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'countRoom'\n"
                + "  FROM Room";
        try {
          
            Connection conn = dbContext.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery(); 
            
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return count;
    }
        
        
         public static void main(String[] args) {
        RoomDAO rdao = new RoomDAO();
        int count = rdao.CountRoom();
        System.out.println("Number of rooms: " + count);
    }
    
}

