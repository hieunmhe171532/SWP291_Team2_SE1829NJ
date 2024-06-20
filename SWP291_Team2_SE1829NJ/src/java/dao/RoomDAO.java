/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.*;

public class RoomDAO {

    private final DBContext dbContext;
    private final Connection connection;

    public RoomDAO() {
        dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();
    }

    public void mapParams(PreparedStatement ps, List<Object> args) throws SQLException {
        int i = 1;
        for (Object arg : args) {
            if (arg instanceof Date date) {
                ps.setTimestamp(i++, new Timestamp(date.getTime()));
            } else if (arg instanceof Integer integer) {
                ps.setInt(i++, integer);
            } else if (arg instanceof Long long1) {
                ps.setLong(i++, long1);
            } else if (arg instanceof Double double1) {
                ps.setDouble(i++, double1);
            } else if (arg instanceof Float float1) {
                ps.setFloat(i++, float1);
            } else {
                ps.setString(i++, (String) arg);
            }
        }
    }

    public List<Room> getAllByParam(String userQuantity, String priceRange, Integer typeRoomId) {
        List<Room> rooms = new ArrayList<>();
        List<Object> params = new ArrayList<>();

        StringBuilder query = new StringBuilder();
        query.append("SELECT r.id as rId, r.name as rName, r.image as rImage, r.deleteAt as RdeleteAt, "
                + "r.updateAt as RupdateAt, r.createAt as RcreateAt , r.isDelete as rIsDelete,"
                + "r.userQuantity, r.area, r.quantity, r.price, r.status as rStatus, r.description, "
                + " h.id as hId, h.name as hName, t.id as tId, t.name as tName FROM Room r ")
                .append("JOIN Hotel h ON h.id = r.hotel_id ")
                .append("JOIN TypeRoom t ON t.id = r.type_id ")
                .append("WHERE r.status = 1 ");

        if (userQuantity != null && !userQuantity.isEmpty()) {
            switch (userQuantity) {
                case "1", "2", "3", "4" -> {
                    query.append("AND r.userQuantity = ? ");
                    params.add(Integer.valueOf(userQuantity));
                }
                case "5+" ->
                    query.append("AND r.userQuantity >= 5 ");
            }
        }

        if (priceRange != null && !priceRange.isEmpty()) {
            switch (priceRange) {
                case "0-500.000" ->
                    query.append("AND r.price BETWEEN 0 AND 500000 ");
                case "500.000-1.000.000" ->
                    query.append("AND r.price BETWEEN 500000 AND 1000000 ");
                case "1.000.000-2.000.000" ->
                    query.append("AND r.price BETWEEN 1000000 AND 2000000 ");
                case "2.000.000-5.000.000" ->
                    query.append("AND r.price BETWEEN 2000000 AND 5000000 ");
            }
        }

        if (typeRoomId != null) {
            query.append("AND r.type_id = ? ");
            params.add(typeRoomId);
        }

        try (PreparedStatement preparedStatement = connection.prepareStatement(query.toString())) {
            for (int i = 0; i < params.size(); i++) {
                preparedStatement.setObject(i + 1, params.get(i));
            }

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Room room = new Room();
                    room.setId(resultSet.getInt("rId"));
                    room.setName(resultSet.getString("rName"));
                    room.setImage(resultSet.getString("rImage"));
                    room.setUserQuantity(resultSet.getInt("userQuantity"));
                    room.setArea(resultSet.getFloat("area"));
       
                    room.setPrice(resultSet.getFloat("price"));
                    room.setStatus(resultSet.getInt("rStatus"));
                    room.setDescription(resultSet.getString("description"));
                    room.setIsDelete(resultSet.getBoolean("rIsDelete"));
                    room.setCreateAt(resultSet.getDate("RcreateAt"));
                    room.setDeleteAt(resultSet.getDate("RdeleteAt"));
                    room.setUpdateAt(resultSet.getDate("RupdateAt"));

                    Hotel hotel = new Hotel();
                    hotel.setId(resultSet.getInt("hId"));
                    hotel.setName(resultSet.getString("hName"));
                    // Set other Hotel fields...
                    room.setHotel(hotel);

                    TypeRoom typeRoom = new TypeRoom();
                    typeRoom.setId(resultSet.getInt("tId"));
                    typeRoom.setName(resultSet.getString("tName"));
                    // Set other TypeRoom fields...
                    room.setTypeRoom(typeRoom);

                    rooms.add(room);
                }
            }
        } catch (SQLException e) {
            System.out.println("lỗi " + e);
        }

        return rooms;
    }

    public int countRoom() {
        int count = 0;
        String sql = "SELECT COUNT(*) AS countRoom FROM Room";
        try (
                PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt("countRoom");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public int countEmptyRoom() {
        return countRoomsByStatus(1);
    }

    public int countBookingRoom() {
        return countRoomsByStatus(2);
    }

    public int countUsingRoom() {
        return countRoomsByStatus(3);
    }

    public int countRepairingRoom() {
        int count = 0;
        String sql = "SELECT COUNT(*) AS countRoom FROM Room WHERE isActive = 0";
        try (
                PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt("countRoom");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    private int countRoomsByStatus(int statusId) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS countRoom FROM Room WHERE status_id = ?";
        try (
                PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, statusId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt("countRoom");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public Room getById(int roomId) {
        Room room = null;
        String query = "SELECT r.id as rId, r.name as rName, r.image as rImage, r.deleteAt as RdeleteAt, "
                + "r.updateAt as RupdateAt, r.createAt as RcreateAt,"
                + "r.userQuantity, r.area, r.price, r.status_id as rStatus, r.description, "
                + "h.id as hId, h.name as hName, t.id as tId, t.name as tName "
                + "FROM Room r "
                + "JOIN Hotel h ON h.id = r.hotel_id "
                + "JOIN TypeRoom t ON t.id = r.type_id "
                + "WHERE r.id = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, roomId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    room = new Room();     room.setId(rs.getInt("rId"));
                room.setName(rs.getString("rName"));
                room.setImage(rs.getString("rImage"));
                room.setDeleteAt(rs.getDate("RdeleteAt"));
                room.setUpdateAt(rs.getDate("RupdateAt"));
                room.setCreateAt(rs.getDate("RcreateAt"));
                room.setArea(rs.getFloat("area"));
                room.setUserQuantity(rs.getInt("userQuantity"));
                room.setPrice(rs.getFloat("price"));
                room.setStatus(rs.getInt("rStatus"));
                room.setDescription(rs.getString("description"));

                Hotel hotel = new Hotel();
                hotel.setId(rs.getInt("hId"));
                hotel.setName(rs.getString("hName"));
                // Set other hotel fields if needed

                room.setHotel(hotel);

                TypeRoom typeRoom = new TypeRoom();
                typeRoom.setId(rs.getInt("tId"));
                typeRoom.setName(rs.getString("tName"));

                room.setTypeRoom(typeRoom);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return room;
    }

  public List<Room> getAll() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT r.id as rId, r.name as rName, r.image as rImage, r.deleteAt as RdeleteAt, " +
                     "r.updateAt as RupdateAt, r.createAt as RcreateAt, r.area, r.userQuantity, r.price, " +
                     "r.status_id as rStatus, r.description, h.id as hId, h.name as hName, " +
                     "t.id as tId, t.name as tName " +
                     "FROM Room r " +
                     "JOIN Hotel h ON h.id = r.hotel_id " +
                     "JOIN TypeRoom t ON t.id = r.type_id";

        try (PreparedStatement ps = connection.prepareStatement(sql);
            
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("rId"));
                room.setName(rs.getString("rName"));
                room.setImage(rs.getString("rImage"));
                room.setDeleteAt(rs.getDate("RdeleteAt"));
                room.setUpdateAt(rs.getDate("RupdateAt"));
                room.setCreateAt(rs.getDate("RcreateAt"));
                room.setArea(rs.getFloat("area"));
                room.setUserQuantity(rs.getInt("userQuantity"));
                room.setPrice(rs.getFloat("price"));
                room.setStatus(rs.getInt("rStatus"));
                room.setDescription(rs.getString("description"));

                Hotel hotel = new Hotel();
                hotel.setId(rs.getInt("hId"));
                hotel.setName(rs.getString("hName"));
                // Set other hotel fields if needed

                room.setHotel(hotel);

                TypeRoom typeRoom = new TypeRoom();
                typeRoom.setId(rs.getInt("tId"));
                typeRoom.setName(rs.getString("tName"));

                room.setTypeRoom(typeRoom);

                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    
  public static void main(String[] args) {
        RoomDAO roomDAO = new RoomDAO();
//        List<Room> rooms = roomDAO.getAll();
//
//        for (Room room : rooms) {
//            System.out.println("Room ID: " + room.getId());
//            System.out.println("Room Name: " + room.getName());
//  
//            System.out.println("---------------------------");
//        }

 Room s1 = roomDAO.getById(2);
 
      System.out.println(s1.getId());
        System.out.println(s1.getStatus());


    }
    
    
    
    
    
    
    
    
    
    
    
    
}
