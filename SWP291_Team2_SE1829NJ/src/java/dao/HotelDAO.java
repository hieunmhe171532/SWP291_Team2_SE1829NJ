package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Hotel;

public class HotelDAO  {
    
// 
//    private final DBContext dbContext;
//    private final Connection conn;
//
//    public HotelDAO() {
//        dbContext = DBContext.getInstance();
//        conn = dbContext.getConnection();  // Assuming getConnection() method exists in DBContext
//    }

    public Hotel getHotelByID(int id) {
        Hotel hotel = null;
        String query = "SELECT * FROM Hotel WHERE id = ?";
        
        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    hotel = new Hotel();
                    hotel.setId(resultSet.getInt("id"));
                    hotel.setName(resultSet.getString("name"));
                    hotel.setImage(resultSet.getString("image"));
                    hotel.setAddress(resultSet.getString("address"));
                    hotel.setPhone(resultSet.getString("phone"));
                    hotel.setRating(resultSet.getFloat("rating"));
                    hotel.setIsActive(resultSet.getBoolean("isActive"));
                    hotel.setDescription(resultSet.getString("description"));
                    hotel.setFeedback(resultSet.getString("feedback"));
                    hotel.setCreateAt(resultSet.getDate("createAt"));
                    hotel.setDeleteAt(resultSet.getDate("deleteAt"));
                    hotel.setUpdateAt(resultSet.getDate("updateAt"));
                    hotel.setIsDelete(resultSet.getBoolean("isDelete"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return hotel;
    }public static void main(String[] args) {
        
            
    }
}
