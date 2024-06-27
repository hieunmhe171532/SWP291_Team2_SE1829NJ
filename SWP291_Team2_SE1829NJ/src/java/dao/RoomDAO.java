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

public class RoomDAO{
     DBContext dbContext;
     Connection connection;

    public RoomDAO() {
        dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();  // Assuming getConnection() method exists in DBContext
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
//                    room.setCreateAt(resultSet.getDate("RcreateAt"));
//                    room.setDeleteAt(resultSet.getDate("RdeleteAt"));
//                    room.setUpdateAt(resultSet.getDate("RupdateAt"));

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
        String query = "SELECT r.id as rId, r.name as rName, r.image as rImage,r.room_floor AS rRoomFloor, r.deleteAt as RdeleteAt, "
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
                    room = new Room();    
                    room.setId(rs.getInt("rId"));
                room.setName(rs.getString("rName"));
                room.setImage(rs.getString("rImage"));
                  room.setRoom_floor(rs.getString("rRoomFloor"));
//                room.setDeleteAt(rs.getDate("RdeleteAt"));
//                room.setUpdateAt(rs.getDate("RupdateAt"));
//                room.setCreateAt(rs.getDate("RcreateAt"));
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
                Connection conn = dbContext.getConnection();
        String sql = "SELECT r.id AS rId, r.name AS rName, r.image AS rImage, r.room_floor AS rRoomFloor, " +
                     "r.deleteAt AS RdeleteAt, r.updateAt AS RupdateAt, r.createAt AS RcreateAt, " +
                     "r.area, r.userQuantity, r.price, r.status_id AS rStatus, r.description, " +
                     "h.id AS hId, h.name AS hName, " +
                     "t.id AS tId, t.name AS tName " +
                     "FROM Room r " +
                     "JOIN Hotel h ON r.hotel_id = h.id " +
                     "JOIN TypeRoom t ON r.type_id = t.id";

        try (
                        

            
              
                PreparedStatement ps = conn.prepareStatement(sql);
            
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Room room = mapRoom(rs);
                rooms.add(room);
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception in RoomDAO.getAll: " + e.getMessage());
        }
        return rooms;
    }



   
    private Room mapRoom(ResultSet rs) throws SQLException {
        Room room = new Room();
        room.setId(rs.getInt("rId"));
        room.setName(rs.getString("rName"));
        room.setImage(rs.getString("rImage"));
        room.setRoom_floor(rs.getString("rRoomFloor"));
;
        room.setArea(rs.getFloat("area"));
        room.setUserQuantity(rs.getInt("userQuantity"));
        room.setPrice(rs.getFloat("price"));
        room.setStatus(rs.getInt("rStatus"));
        room.setDescription(rs.getString("description"));

        Hotel hotel = new Hotel();
        hotel.setId(rs.getInt("hId"));
        hotel.setName(rs.getString("hName"));
        room.setHotel(hotel);

        TypeRoom typeRoom = new TypeRoom();
        typeRoom.setId(rs.getInt("tId"));
        typeRoom.setName(rs.getString("tName"));
        room.setTypeRoom(typeRoom);

        return room;
    }
    
public boolean insertRoom(Room room) {
    String sql = "SET IDENTITY_INSERT Room ON;"
            + "INSERT INTO Room (id, name, image, room_floor, userQuantity, area, price, status_id, description, hotel_id, type_id, isActive) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            +"SET IDENTITY_INSERT Room OFF;";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, room.getId()); // Only include this if you're sure you want to manually set the ID
        ps.setString(2, room.getName());
        ps.setString(3, room.getImage());
        ps.setString(4, room.getRoom_floor());
        ps.setInt(5, room.getUserQuantity());
        ps.setFloat(6, room.getArea());
        ps.setFloat(7, room.getPrice());
        ps.setInt(8, room.getStatus());
        ps.setString(9, room.getDescription());
        ps.setInt(10, room.getHotel().getId()); // Ensure Hotel and TypeRoom are not null
        ps.setInt(11, room.getTypeRoom().getId());
        ps.setBoolean(12, room.isIsActive());

        int result = ps.executeUpdate(); // Execute the insert SQL statement
        return result > 0; // Return true if the insert was successful
    } catch (SQLException e) {
        System.out.println("Insert Room Error: " + e.getMessage());
        return false;
    }
}


public boolean updateRoomStatus(int roomId, int status) {
    String sql = "UPDATE Room SET status_id = ? WHERE id = ?";
    try (PreparedStatement ps = connection.prepareStatement(sql
         )) {
        ps.setInt(1, status);
        ps.setInt(2, roomId);
        int affectedRows = ps.executeUpdate();
        return affectedRows > 0;
    } catch (SQLException e) {
        return false;
    }
}


public boolean deleteRoom(int roomId) {
    // SQL statement to delete a room based on its ID
    String sql = "DELETE FROM Room WHERE id = ?";
    
    try (
            // Assume getConnection() is a method that sets up your database connection
         PreparedStatement ps = connection.prepareStatement(sql)) {
        
        ps.setInt(1, roomId); // Set the ID of the room to delete

        int result = ps.executeUpdate(); // Execute the delete statement
        return result > 0; // Return true if the deletion was successful (i.e., one or more rows were deleted)
    } catch (SQLException e) {
        System.out.println("Delete Room Error: " + e.getMessage());
        return false;
    }
}

public boolean editRoomById(Room room) {
    String sql = "UPDATE Room SET "
               + "name = ?, "
               + "image = ?, "
               + "room_floor = ?, "
               + "userQuantity = ?, "
               + "area = ?, "
               + "price = ?, "
               + "status_id = ?, "
               + "description = ?, "
               + "hotel_id = ?, "
               + "type_id = ?, "
               + "isActive = ? "
               + "WHERE id = ?;";

    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setString(1, room.getName());
        ps.setString(2, room.getImage());
        ps.setString(3, room.getRoom_floor());
        ps.setInt(4, room.getUserQuantity());
        ps.setFloat(5, room.getArea());
        ps.setFloat(6, room.getPrice());
        ps.setInt(7, room.getStatus());
        ps.setString(8, room.getDescription());
        ps.setInt(9, room.getHotel().getId()); // Ensures that the Hotel object is not null
        ps.setInt(10, room.getTypeRoom().getId()); // Ensures that the TypeRoom object is not null
        ps.setBoolean(11, room.isIsActive());
        ps.setInt(12, room.getId());

        int result = ps.executeUpdate();
        return result > 0; // Return true if the update was successful
    } catch (SQLException e) {
        System.out.println("Update Room Error: " + e.getMessage());
        return false;
    }
}
//
//    
// public static void main(String[] args) {
//        RoomDAO roomDAO = new RoomDAO();
//
//        // Tạo một đối tượng Room mới để cập nhật
//        Room room = new Room();
//        room.setId(9); // Giả sử đây là ID của phòng cần chỉnh sửa
//        room.setName("Phòng Deluxe");
//        room.setImage("deluxe.jpg");
//        room.setRoom_floor("2");
//        room.setUserQuantity(2);
//        room.setArea(30.0f);
//        room.setPrice(1500.0f);
//        room.setStatus(1); // Giả sử 1 là trạng thái "available"
//        room.setDescription("Phòng với view biển");
//        Hotel hotel = new Hotel();
//        hotel.setId(1); // Giả sử Hotel có ID là 1
//        room.setHotel(hotel);
//        TypeRoom typeRoom = new TypeRoom();
//        typeRoom.setId(1); // Giả sử TypeRoom có ID là 1
//        room.setTypeRoom(typeRoom);
//        room.setIsActive(true);
//
//        // Thực hiện cập nhật
//        if(roomDAO.editRoomById(room)){
//            System.out.println("Cập nhật phòng thành công");
//        } else {
//            System.out.println("Cập nhật phòng thất bại");
//        }
//    }

// Room s1 = roomDAO.getById(2);
// 
//      System.out.println(s1.getId());
//        System.out.println(s1.getStatus());
public List<Room> findListRoomByNumbersRoomNumberHuman(int numberOfRooms, int numberOfHumans) {
    List<Room> rooms = new ArrayList<>();
    String sql = "WITH RoomWithRowNum AS ("
               + "    SELECT r.id, r.name, r.userQuantity, r.price, r.status_id, r.description, "
               + "           h.id AS hotelId, h.name AS hotelName, "
               + "           t.id AS typeRoomId, t.name AS typeRoomName, "
               + "           ROW_NUMBER() OVER (ORDER BY r.userQuantity DESC) AS rn "
               + "    FROM Room r "
               + "    JOIN Hotel h ON h.id = r.hotel_id "
               + "    JOIN TypeRoom t ON t.id = r.type_id "
               + "    WHERE r.status_id = 1 "
               + ") "
               + "SELECT id, name, userQuantity, price, status_id, description, hotelId, hotelName, typeRoomId, typeRoomName "
               + "FROM RoomWithRowNum "
               + "WHERE rn <= ? "
               + "AND ("
               + "    SELECT SUM(userQuantity) "
               + "    FROM RoomWithRowNum "
               + "    WHERE rn <= ? "
               + ") >= ? "
               + "ORDER BY rn";

    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, numberOfRooms);
        ps.setInt(2, numberOfRooms);
        ps.setInt(3, numberOfHumans);
        
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("id"));
                room.setName(rs.getString("name"));
                room.setUserQuantity(rs.getInt("userQuantity"));
                room.setPrice(rs.getFloat("price"));
                room.setStatus(rs.getInt("status_id"));
                room.setDescription(rs.getString("description"));

                Hotel hotel = new Hotel();
                hotel.setId(rs.getInt("hotelId"));
                hotel.setName(rs.getString("hotelName"));
                room.setHotel(hotel);

                TypeRoom typeRoom = new TypeRoom();
                typeRoom.setId(rs.getInt("typeRoomId"));
                typeRoom.setName(rs.getString("typeRoomName"));
                room.setTypeRoom(typeRoom);

                rooms.add(room);
            }
        }
    } catch (SQLException e) {
        System.out.println("Error finding rooms: " + e.getMessage());
    }
    return rooms;
}


  public static void main(String[] args) {
        RoomDAO roomDAO = new RoomDAO();

        int numberOfRooms = 3;
        int numberOfHumans = 6;

        List<Room> rooms = roomDAO.findListRoomByNumbersRoomNumberHuman(numberOfRooms, numberOfHumans);

        // In ra kết quả
        if (rooms.isEmpty()) {
            System.out.println("No rooms found matching the criteria.");
        } else {
            for (Room room : rooms) {
                System.out.println("Room ID: " + room.getId());
                System.out.println("Room Name: " + room.getName());
                System.out.println("User Quantity: " + room.getUserQuantity());
                System.out.println("Price: " + room.getPrice());
                System.out.println("Status ID: " + room.getStatus());
                System.out.println("Description: " + room.getDescription());
                System.out.println("-----------------------");
            }
        }
    }
 
 
    }
    
    
    
    
    
    
    
    
    
    
    
    

