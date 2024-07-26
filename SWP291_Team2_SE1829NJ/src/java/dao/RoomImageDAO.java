/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Hotel;
import model.Room;
import model.RoomImage;
import model.TypeRoom;

/**
 *
 * @author dinhl
 */
public class RoomImageDAO {
    DBContext dbContext;
    Connection connection;

    public RoomImageDAO() {
        dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();  // Assuming getConnection() method exists in DBContext
    }
    public List<RoomImage> getRoomImage(int rid) {
        List<RoomImage> t = new ArrayList<>();

        try {
            String sql = """
                         select * from RoomImages ri
                         join Room r on ri.room_id=r.id
                         where r.id=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                RoomImage ri=new RoomImage();
                Room r=new Room();
                Hotel h=new Hotel();
                TypeRoom tr=new TypeRoom();
                ri.setId(rs.getInt(1));
                ri.setImg(rs.getString(2));
                r.setId(rs.getInt(3));
                ri.setCreateAt(rs.getString(4));
                r.setId(rs.getInt(5));
                r.setName(rs.getString(6));
                r.setRoom_floor(rs.getString(7));
                r.setUserQuantity(rs.getInt(8));
                r.setArea(rs.getFloat(9));
                r.setPrice(rs.getFloat(10));
                r.setStatus(rs.getInt(11));
                r.setDescription(rs.getString(12));
                h.setId(rs.getInt(13));
                r.setHotel(h);
                tr.setId(rs.getInt(14));
                r.setTypeRoom(tr);
                r.setIsActive(rs.getBoolean(18));
                ri.setRoom(r);
                t.add(ri);
                
            }
        } catch (SQLException ex) {
        }

        return t;
    }
    
    
       public boolean insertRoomImage(RoomImage roomImage) {
        String sql = "INSERT INTO RoomImages (img, room_id, createAt) VALUES (?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, roomImage.getImg());
            ps.setInt(2, roomImage.getRoom().getId());
            ps.setTimestamp(3, new java.sql.Timestamp(System.currentTimeMillis()));
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Insert RoomImage Error: " + e.getMessage());
            return false;
        }
    }
    
    public static void main(String[] args) {
        RoomImageDAO daori=new RoomImageDAO();
        List<RoomImage> l=daori.getRoomImage(601);
        for (RoomImage ri : l) {
            System.out.println(ri);
        }
    }
    
}
