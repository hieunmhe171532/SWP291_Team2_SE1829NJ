package dao;

import dal.DBContext;
import java.lang.System.Logger.Level;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.*;

public class RoomDAO {

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
//
//    public List<Room> getAllByParam(String userQuantity, String priceRange, Integer typeRoomId) {
//        List<Room> rooms = new ArrayList<>();
//        List<Object> params = new ArrayList<>();
//
//        StringBuilder query = new StringBuilder();
//        query.append("SELECT r.id as rId, r.name as rName, r.image as rImage, r.deleteAt as RdeleteAt, "
//                + "r.updateAt as RupdateAt, r.createAt as RcreateAt , r.isDelete as rIsDelete,"
//                + "r.userQuantity, r.area, r.quantity, r.price, r.status as rStatus, r.description, "
//                + " h.id as hId, h.name as hName, t.id as tId, t.name as tName FROM Room r ")
//                .append("JOIN Hotel h ON h.id = r.hotel_id ")
//                .append("JOIN TypeRoom t ON t.id = r.type_id ")
//                .append("WHERE r.status = 1 ");
//
//        if (userQuantity != null && !userQuantity.isEmpty()) {
//            switch (userQuantity) {
//                case "1", "2", "3", "4" -> {
//                    query.append("AND r.userQuantity = ? ");
//                    params.add(Integer.valueOf(userQuantity));
//                }
//                case "5+" ->
//                    query.append("AND r.userQuantity >= 5 ");
//            }
//        }
//
//        if (priceRange != null && !priceRange.isEmpty()) {
//            switch (priceRange) {
//                case "0-500.000" ->
//                    query.append("AND r.price BETWEEN 0 AND 500000 ");
//                case "500.000-1.000.000" ->
//                    query.append("AND r.price BETWEEN 500000 AND 1000000 ");
//                case "1.000.000-2.000.000" ->
//                    query.append("AND r.price BETWEEN 1000000 AND 2000000 ");
//                case "2.000.000-5.000.000" ->
//                    query.append("AND r.price BETWEEN 2000000 AND 5000000 ");
//            }
//        }
//
//        if (typeRoomId != null) {
//query.append("AND r.type_id = ? ");
//            params.add(typeRoomId);
//        }
//
//        try (PreparedStatement preparedStatement = connection.prepareStatement(query.toString())) {
//            for (int i = 0; i < params.size(); i++) {
//                preparedStatement.setObject(i + 1, params.get(i));
//            }
//
//            try (ResultSet resultSet = preparedStatement.executeQuery()) {
//                while (resultSet.next()) {
//                    Room room = new Room();
//                    room.setId(resultSet.getInt("rId"));
//                    room.setName(resultSet.getString("rName"));
//                    room.setImage(resultSet.getString("rImage"));
//                    room.setUserQuantity(resultSet.getInt("userQuantity"));
//                    room.setArea(resultSet.getFloat("area"));
//
//                    room.setPrice(resultSet.getFloat("price"));
//                    room.setStatus(resultSet.getInt("rStatus"));
//                    room.setDescription(resultSet.getString("description"));
//                    room.setIsDelete(resultSet.getBoolean("rIsDelete"));
////                    room.setCreateAt(resultSet.getDate("RcreateAt"));
////                    room.setDeleteAt(resultSet.getDate("RdeleteAt"));
////                    room.setUpdateAt(resultSet.getDate("RupdateAt"));
//
//                    Hotel hotel = new Hotel();
//                    hotel.setId(resultSet.getInt("hId"));
//                    hotel.setName(resultSet.getString("hName"));
//                    // Set other Hotel fields...
//                    room.setHotel(hotel);
//
//                    TypeRoom typeRoom = new TypeRoom();
//                    typeRoom.setId(resultSet.getInt("tId"));
//                    typeRoom.setName(resultSet.getString("tName"));
//                    // Set other TypeRoom fields...
//                    room.setTypeRoom(typeRoom);
//
//                    rooms.add(room);
//                }
//            }
//        } catch (SQLException e) {
//            System.out.println("lỗi " + e);
//        }
//
//        return rooms;
//    }

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

     public List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT r.id, r.name, r.room_floor, r.userQuantity, r.area, r.price, r.status_id, r.description, h.id AS hotel_id, h.name AS hotel_name, t.id AS type_id, t.name AS type_name "
                   + "FROM Room r "
                   + "JOIN Hotel h ON r.hotel_id = h.id "
                   + "JOIN TypeRoom t ON r.type_id = t.id"
                  + "WHERE r.status_id = 1";
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("id"));
                room.setName(rs.getString("name"));
                room.setRoom_floor(rs.getString("room_floor"));
                room.setUserQuantity(rs.getInt("userQuantity"));
                room.setArea(rs.getFloat("area"));
                room.setPrice(rs.getFloat("price"));
                room.setStatus(rs.getInt("status_id"));
                room.setDescription(rs.getString("description"));

                Hotel hotel = new Hotel();
                hotel.setId(rs.getInt("hotel_id"));
                hotel.setName(rs.getString("hotel_name"));
                room.setHotel(hotel);

                TypeRoom typeRoom = new TypeRoom();
                typeRoom.setId(rs.getInt("type_id"));
                typeRoom.setName(rs.getString("type_name"));
                room.setTypeRoom(typeRoom);

                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }
     public List<RoomImage> getRoomsForHomePage() {
        List<RoomImage> t = new ArrayList<>();
        String sql = "SELECT TOP(6) r.*, ri.*\n" +
"                         FROM room r\n" +
"                         JOIN RoomImages ri ON r.id = ri.room_id\n" +
"						 where isActive=1 and status_id=1\n" +
"                         AND NOT EXISTS (\n" +
"                             SELECT 1\n" +
"                             FROM RoomImages ri2\n" +
"                             WHERE ri.room_id = ri2.room_id\n" +
"                             AND ri.id > ri2.id\n" +
"                         )\n" +
"                         ORDER BY r.id;";
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Room room=new Room();
                RoomImage ri=new RoomImage();
                room.setId(rs.getInt(1));
                room.setName(rs.getString(2));
                room.setRoom_floor(rs.getString(3));
                room.setArea(rs.getFloat(5));
                room.setUserQuantity(rs.getInt(4));
                room.setPrice(rs.getFloat(6));
                room.setStatus(rs.getInt(7));
                room.setDescription(rs.getString(8));
                ri.setId(rs.getInt(15));
                ri.setImg(rs.getString(16));
                ri.setRoom(room);

                Hotel hotel = new Hotel();
                hotel.setId(rs.getInt(9));
                // Set other hotel fields if needed

                room.setHotel(hotel);

                TypeRoom typeRoom = new TypeRoom();
                typeRoom.setId(rs.getInt(10));

                room.setTypeRoom(typeRoom);
                t.add(ri);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return t;
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
        String query = "SELECT * "
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

    public Room getRoomByRid(int rId) {
        Room room = null;
        String query = "SELECT * "
                + "FROM Room r "
                + "JOIN Hotel h ON h.id = r.hotel_id "
                + "JOIN TypeRoom t ON t.id = r.type_id "
                + "WHERE r.id = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, rId);
            try (ResultSet rs = ps.executeQuery()) {
if (rs.next()) {
                    room = new Room();
                    room.setId(rs.getInt(1));
                    room.setName(rs.getString(2));

                    room.setRoom_floor(rs.getString(3));
//                room.setDeleteAt(rs.getDate("RdeleteAt"));
//                room.setUpdateAt(rs.getDate("RupdateAt"));
//                room.setCreateAt(rs.getDate("RcreateAt"));
                    room.setArea(rs.getFloat(5));
                    room.setUserQuantity(rs.getInt(4));
                    room.setPrice(rs.getFloat(6));
                    room.setStatus(rs.getInt(7));
                    room.setDescription(rs.getString(8));

                    Hotel hotel = new Hotel();
                    hotel.setId(rs.getInt(9));
                    hotel.setName(rs.getString(16));
                    // Set other hotel fields if needed
                room.setIsActive(rs.getBoolean("isActive"));
                    room.setHotel(hotel);

                    TypeRoom typeRoom = new TypeRoom();
                    typeRoom.setId(rs.getInt(10));
                    typeRoom.setName(rs.getString(29));

                    room.setTypeRoom(typeRoom);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return room;
    }

    
     public boolean editRoomById(Room room, List<RoomImage> images) {
        String sql = "UPDATE Room SET "
                + "name = ?, "
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
            ps.setString(2, room.getRoom_floor());
            ps.setInt(3, room.getUserQuantity());
            ps.setFloat(4, room.getArea());
            ps.setFloat(5, room.getPrice());
            ps.setInt(6, room.getStatus());
            ps.setString(7, room.getDescription());
            ps.setInt(8, room.getHotel().getId());
            ps.setInt(9, room.getTypeRoom().getId());
            ps.setBoolean(10, room.isIsActive());
            ps.setInt(11, room.getId());

            int result = ps.executeUpdate();
            if (result > 0) {
                updateRoomImages(room.getId(), images);
                return true; // Return true if the update was successful
            }
            return false;
        } catch (SQLException e) {
            System.out.println("Update Room Error: " + e.getMessage());
            return false;
        }
    }

    
    public List<Room> getAll() {
        List<Room> rooms = new ArrayList<>();
        Connection conn = dbContext.getConnection();
        String sql = "SELECT r.id AS rId, r.name AS rName, r.room_floor AS rRoomFloor, "
                + "r.deleteAt AS RdeleteAt, r.updateAt AS RupdateAt, r.createAt AS RcreateAt, "
                + "r.area, r.userQuantity, r.price, r.status_id AS rStatus, r.description, "
                + "h.id AS hId, h.name AS hName, "
                + "t.id AS tId, t.name AS tName "
                + "FROM Room r "
                + "JOIN Hotel h ON r.hotel_id = h.id "
                + "JOIN TypeRoom t ON r.type_id = t.id";

        try (
                PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

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
                + "INSERT INTO Room (id, name, room_floor, userQuantity, area, price, status_id, description, hotel_id, type_id, isActive) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
                + "SET IDENTITY_INSERT Room OFF;";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, room.getId()); // Only include this if you're sure you want to manually set the ID
            ps.setString(2, room.getName());
            ps.setString(3, room.getRoom_floor());
            ps.setInt(4, room.getUserQuantity());
            ps.setFloat(5, room.getArea());
            ps.setFloat(6, room.getPrice());
            ps.setInt(7, room.getStatus());
            ps.setString(8, room.getDescription());
            ps.setInt(9, room.getHotel().getId()); // Ensure Hotel and TypeRoom are not null
            ps.setInt(10, room.getTypeRoom().getId());
            ps.setBoolean(11, room.isIsActive());

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

//  
//    public boolean editRoomById(Room room, List<RoomImage> images) {
//        String sql = "UPDATE Room SET "
//                + "name = ?, "
//                + "room_floor = ?, "
//                + "userQuantity = ?, "
//                + "area = ?, "
//                + "price = ?, "
//                + "status_id = ?, "
//                + "description = ?, "
//                + "hotel_id = ?, "
//                + "type_id = ?, "
//                + "isActive = ? "
//                + "WHERE id = ?;";
//
//        try (PreparedStatement ps = connection.prepareStatement(sql)) {
//            ps.setString(1, room.getName());
//            ps.setString(2, room.getRoom_floor());
//            ps.setInt(3, room.getUserQuantity());
//            ps.setFloat(4, room.getArea());
//            ps.setFloat(5, room.getPrice());
//            ps.setInt(6, room.getStatus());
//            ps.setString(7, room.getDescription());
//            ps.setInt(8, room.getHotel().getId());
//            ps.setInt(9, room.getTypeRoom().getId());
//            ps.setBoolean(10, room.isIsActive());
//            ps.setInt(11, room.getId());
//
//            int result = ps.executeUpdate();
//            if (result > 0) {
//                updateRoomImages(room.getId(), images);
//                return true; // Return true if the update was successful
//            }
//            return false;
//        } catch (SQLException e) {
//            System.out.println("Update Room Error: " + e.getMessage());
//            return false;
//        }
//    }

    private void updateRoomImages(int roomId, List<RoomImage> images) throws SQLException {
        String deleteSql = "DELETE FROM RoomImages WHERE room_id = ?";
        try (PreparedStatement deletePs = connection.prepareStatement(deleteSql)) {
            deletePs.setInt(1, roomId);
            deletePs.executeUpdate();
        }

        String insertSql = "INSERT INTO RoomImages (img, room_id, createAt) VALUES (?, ?, ?)";
        try (PreparedStatement insertPs = connection.prepareStatement(insertSql)) {
            for (RoomImage image : images) {
                insertPs.setString(1, image.getImg());
                insertPs.setInt(2, roomId);
                insertPs.setTimestamp(3, new java.sql.Timestamp(System.currentTimeMillis()));
                insertPs.executeUpdate();
            }
        }
    }

    public List<RoomImage> getSimilarRooms(int uquan,int rid) {
        List<RoomImage> t = new ArrayList<>();

        try {
            String sql = """
                         SELECT TOP(5) r.*, ri.*
                         FROM room r
                         JOIN RoomImages ri ON r.id = ri.room_id
                         WHERE r.userQuantity = ?
                         AND r.id <> ?
                         AND NOT EXISTS (
                             SELECT 1
                             FROM RoomImages ri2
                             WHERE ri.room_id = ri2.room_id
                             AND ri.id > ri2.id
                         )
                         ORDER BY r.id;""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uquan);
            stm.setInt(2, rid);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Room room=new Room();
                RoomImage ri=new RoomImage();
                room.setId(rs.getInt(1));
                room.setName(rs.getString(2));
                room.setRoom_floor(rs.getString(3));
                room.setArea(rs.getFloat(5));
                room.setUserQuantity(rs.getInt(4));
                room.setPrice(rs.getFloat(6));
                room.setStatus(rs.getInt(7));
                room.setDescription(rs.getString(8));
                ri.setId(rs.getInt(15));
                ri.setImg(rs.getString(16));
                ri.setRoom(room);

                Hotel hotel = new Hotel();
                hotel.setId(rs.getInt(9));
                // Set other hotel fields if needed

                room.setHotel(hotel);

                TypeRoom typeRoom = new TypeRoom();
                typeRoom.setId(rs.getInt(10));

                room.setTypeRoom(typeRoom);
                t.add(ri);
            }
        } catch (SQLException ex) {
        }

        return t;
    }
//   
//    public List<Room> findListRoomByNumbersRoomNumberHuman(int numberOfHumans) {
//        List<Room> rooms = new ArrayList<>();
//        String sql = "WITH RoomWithRowNum AS ("
//                   + "    SELECT r.id, r.name, r.userQuantity, r.price, r.status_id, r.description, "
//                   + "           h.id AS hotelId, h.name AS hotelName, "
//                   + "           t.id AS typeRoomId, t.name AS typeRoomName, "
//                   + "           ROW_NUMBER() OVER (ORDER BY r.userQuantity DESC) AS rn "
//                   + "    FROM Room r "
//                   + "    JOIN Hotel h ON h.id = r.hotel_id "
//                   + "    JOIN TypeRoom t ON t.id = r.type_id "
//                   + "    WHERE r.status_id = 1 "
//                   + ") "
//                   + "SELECT id, name, userQuantity, price, status_id, description, hotelId, hotelName, typeRoomId, typeRoomName "
//                   + "FROM RoomWithRowNum "
//                   + "ORDER BY userQuantity DESC";
//
//        try (PreparedStatement ps = connection.prepareStatement(sql);
//             ResultSet rs = ps.executeQuery()) {
//
//            List<Room> availableRooms = new ArrayList<>();
//            while (rs.next()) {
//                Room room = new Room();
//                room.setId(rs.getInt("id"));
//                room.setName(rs.getString("name"));
//                room.setUserQuantity(rs.getInt("userQuantity"));
//                room.setPrice(rs.getFloat("price"));
//                room.setStatus(rs.getInt("status_id"));
//                room.setDescription(rs.getString("description"));
//
//                Hotel hotel = new Hotel();
//                hotel.setId(rs.getInt("hotelId"));
//                hotel.setName(rs.getString("hotelName"));
//                room.setHotel(hotel);
//
//                TypeRoom typeRoom = new TypeRoom();
//                typeRoom.setId(rs.getInt("typeRoomId"));
//                typeRoom.setName(rs.getString("typeRoomName"));
//                room.setTypeRoom(typeRoom);
//
//                availableRooms.add(room);
//            }
//
//            rooms = findOptimalRoomCombination(availableRooms, numberOfHumans);
//
//        } catch (SQLException e) {
//          
//        }
//        return rooms;
//    }
//
    private List<Room> findOptimalRoomCombination(List<Room> availableRooms, int numberOfHumans) {
    List<Room> selectedRooms = new ArrayList<>();
    int remainingHumans = numberOfHumans;

    // Separate rooms that accommodate 4 and 2 people
    List<Room> roomsForFour = new ArrayList<>();
    List<Room> roomsForTwo = new ArrayList<>();
    for (Room room : availableRooms) {
        if (room.getUserQuantity() == 4) {
            roomsForFour.add(room);
        } else if (room.getUserQuantity() == 2) {
            roomsForTwo.add(room);
        }
    }

    // Handle cases where the number of humans is divisible by 4 or remainder is 3
    if (remainingHumans % 4 == 0 || remainingHumans % 4 == 3) {
        while (remainingHumans >= 4 && !roomsForFour.isEmpty()) {
            selectedRooms.add(roomsForFour.remove(0)); // Add room for 4 people
            remainingHumans -= 4;
        }
        // If remaining humans are more than 0 and no rooms for 4 people are left, use rooms for 2 people
        while (remainingHumans > 0 && !roomsForTwo.isEmpty()) {
            selectedRooms.add(roomsForTwo.remove(0)); // Add room for 2 people
            remainingHumans -= 2;
        }
        return selectedRooms;
    }

    // Handle case where the remainder is 2
    if (remainingHumans % 4 == 2) {
        if (!roomsForTwo.isEmpty()) {
            selectedRooms.add(roomsForTwo.remove(0)); // Add room for 2 people
            remainingHumans -= 2;
        }

        while (remainingHumans >= 4 && !roomsForFour.isEmpty()) {
            selectedRooms.add(roomsForFour.remove(0)); // Add room for 4 people
            remainingHumans -= 4;
        }
        // If remaining humans are more than 0 and no rooms for 4 people are left, use rooms for 2 people
        while (remainingHumans > 0 && !roomsForTwo.isEmpty()) {
            selectedRooms.add(roomsForTwo.remove(0)); // Add room for 2 people
            remainingHumans -= 2;
        }
        return selectedRooms;
    }

    // Handle case where the remainder is 1
    if (remainingHumans % 4 == 1) {
        if (remainingHumans < 4) {
            // If less than 4, use one room for 2 people
            if (!roomsForTwo.isEmpty()) {
                selectedRooms.add(roomsForTwo.remove(0));
                remainingHumans -= 2;
            }
        } else {
            // If greater than 4, handle remainder by using rooms for 4 people and one room for 2 people
            while (remainingHumans > 5 && !roomsForFour.isEmpty()) {
                selectedRooms.add(roomsForFour.remove(0)); // Add room for 4 people
                remainingHumans -= 4;
            }
            if (remainingHumans == 5) {
                if (!roomsForFour.isEmpty() && !roomsForTwo.isEmpty()) {
                    selectedRooms.add(roomsForFour.remove(0)); // Add room for 4 people
                    selectedRooms.add(roomsForTwo.remove(0)); // Add room for 2 people
                    remainingHumans -= 6; // Should be 5
                } else if (!roomsForFour.isEmpty()) {
                    selectedRooms.add(roomsForFour.remove(0)); // Add room for 4 people
                    remainingHumans -= 4;
                } else if (!roomsForTwo.isEmpty()) {
                    selectedRooms.add(roomsForTwo.remove(0)); // Add room for 2 people
                    remainingHumans -= 2;
                }
            }
        }
        // If remaining humans are more than 0 and no rooms for 4 people are left, use rooms for 2 people
        while (remainingHumans > 0 && !roomsForTwo.isEmpty()) {
            selectedRooms.add(roomsForTwo.remove(0)); // Add room for 2 people
            remainingHumans -= 2;
        }
        return selectedRooms;
    }

    // Regular logic for other cases
    for (Room room : availableRooms) {
        while (room.getUserQuantity() <= remainingHumans) {
            selectedRooms.add(room);
            remainingHumans -= room.getUserQuantity();

            // Ensure no one is left alone
            if (remainingHumans == 1) {
                // Adjust by finding an additional room to prevent one person being left alone
                if (!selectedRooms.isEmpty()) {
                    Room lastRoom = selectedRooms.get(selectedRooms.size() - 1);
                    selectedRooms.remove(selectedRooms.size() - 1);
                    remainingHumans += lastRoom.getUserQuantity();
                }
            }
        }
    }

    // If there's an issue finding an exact match, adjust logic here
    if (remainingHumans > 0 && remainingHumans != 1) {
        selectedRooms.add(availableRooms.get(availableRooms.size() - 1)); // Add the smallest room
    }

    return selectedRooms;
}


       public List<Room> getAllRoomsWithStatusOne() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT r.id, r.name,r.room_floor, r.userQuantity, r.area, r.price, r.status_id, r.description, r.hotel_id, r.type_id, r.createAt, r.deleteAt, r.updateAt, r.isActive, h.name AS hotelName, t.name AS typeRoomName "
                   + "FROM Room r "
                   + "JOIN Hotel h ON r.hotel_id = h.id "
                   + "JOIN TypeRoom t ON r.type_id = t.id "
                   + "WHERE r.status_id = 1";

        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("id"));
                room.setName(rs.getString("name"));

                room.setRoom_floor(rs.getString("room_floor"));
                room.setUserQuantity(rs.getInt("userQuantity"));
                room.setArea(rs.getFloat("area"));
                room.setPrice(rs.getFloat("price"));
                room.setStatus(rs.getInt("status_id"));
                room.setDescription(rs.getString("description"));
//                room.setCreateAt(rs.getTimestamp("createAt"));
//                room.setDeleteAt(rs.getTimestamp("deleteAt"));
//                room.setUpdateAt(rs.getTimestamp("updateAt"));
                room.setIsActive(rs.getBoolean("isActive"));

                Hotel hotel = new Hotel();
                hotel.setId(rs.getInt("hotel_id"));
                hotel.setName(rs.getString("hotelName"));
                room.setHotel(hotel);

                TypeRoom typeRoom = new TypeRoom();
                typeRoom.setId(rs.getInt("type_id"));
                typeRoom.setName(rs.getString("typeRoomName"));
                room.setTypeRoom(typeRoom);

                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }
    
  public List<Room> findListRoomByNumbersRoomNumberHuman(int numberOfHumans) {
    List<Room> rooms = new ArrayList<>();
    String sql = "WITH RoomWithRowNum AS ("
               + "    SELECT r.id, r.name, r.userQuantity, r.area, r.price, r.status_id, r.description, "
               + "           h.id AS hotelId, h.name AS hotelName, "
               + "           t.id AS typeRoomId, t.name AS typeRoomName, "
               + "           ROW_NUMBER() OVER (ORDER BY r.userQuantity DESC) AS rn "
               + "    FROM Room r "
               + "    JOIN Hotel h ON h.id = r.hotel_id "
               + "    JOIN TypeRoom t ON t.id = r.type_id "
               + "    WHERE r.status_id = 1 "
               + ") "
               + "SELECT id, name, userQuantity, area, price, status_id, description, hotelId, hotelName, typeRoomId, typeRoomName "
               + "FROM RoomWithRowNum "
               + "ORDER BY userQuantity DESC";

    try (PreparedStatement ps = connection.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        List<Room> availableRooms = new ArrayList<>();
        while (rs.next()) {
            Room room = new Room();
            room.setId(rs.getInt("id"));
            room.setName(rs.getString("name"));
            room.setUserQuantity(rs.getInt("userQuantity"));
            room.setArea(rs.getFloat("area"));
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

            availableRooms.add(room);
        }

        // Check if the total capacity is enough
        int totalCapacity = availableRooms.stream().mapToInt(Room::getUserQuantity).sum();
        if (totalCapacity < numberOfHumans) {
            System.out.println("Not enough room for number of humans");
            return new ArrayList<>();
        } else {
            System.out.println("Having enough room for number of humans");
        }

        rooms = findOptimalRoomCombination(availableRooms, numberOfHumans);

    } catch (SQLException e) {
        e.printStackTrace();
    }
    return rooms;
}



//    private List<Room> findOptimalRoomCombination(List<Room> availableRooms, int numberOfHumans) {
//        List<Room> selectedRooms = new ArrayList<>();
//        int remainingHumans = numberOfHumans;
//
//        // Separate rooms based on their capacity
//        List<Room> roomsForFour = new ArrayList<>();
//        List<Room> roomsForTwo = new ArrayList<>();
//        for (Room room : availableRooms) {
//            if (room.getUserQuantity() == 4) {
//                roomsForFour.add(room);
//            } else if (room.getUserQuantity() == 2) {
//                roomsForTwo.add(room);
//            }
//        }
//
//        // Handle different remainder cases
//        while (remainingHumans > 0) {
//            if (remainingHumans % 4 == 0 || remainingHumans % 4 == 3) {
//                while (remainingHumans >= 4 && !roomsForFour.isEmpty()) {
//                    selectedRooms.add(roomsForFour.remove(0));
//                    remainingHumans -= 4;
//                }
//                while (remainingHumans > 0 && !roomsForTwo.isEmpty()) {
//                    selectedRooms.add(roomsForTwo.remove(0));
//                    remainingHumans -= 2;
//                }
//            } else if (remainingHumans % 4 == 2) {
//                if (!roomsForTwo.isEmpty()) {
//                    selectedRooms.add(roomsForTwo.remove(0));
//                    remainingHumans -= 2;
//                }
//                while (remainingHumans >= 4 && !roomsForFour.isEmpty()) {
//                    selectedRooms.add(roomsForFour.remove(0));
//                    remainingHumans -= 4;
//                }
//                while (remainingHumans > 0 && !roomsForTwo.isEmpty()) {
//                    selectedRooms.add(roomsForTwo.remove(0));
//                    remainingHumans -= 2;
//                }
//            } else if (remainingHumans % 4 == 1) {
//                if (remainingHumans < 4) {
//                    if (!roomsForTwo.isEmpty()) {
//                        selectedRooms.add(roomsForTwo.remove(0));
//                        remainingHumans -= 2;
//                    }
//                } else {
//                    while (remainingHumans > 5 && !roomsForFour.isEmpty()) {
//                        selectedRooms.add(roomsForFour.remove(0));
//                        remainingHumans -= 4;
//                    }
//                    if (remainingHumans == 5 && !roomsForFour.isEmpty() && !roomsForTwo.isEmpty()) {
//                        selectedRooms.add(roomsForFour.remove(0));
//                        selectedRooms.add(roomsForTwo.remove(0));
//                        remainingHumans -= 6;
//                    } else if (!roomsForFour.isEmpty()) {
//                        selectedRooms.add(roomsForFour.remove(0));
//                        remainingHumans -= 4;
//                    } else if (!roomsForTwo.isEmpty()) {
//                        selectedRooms.add(roomsForTwo.remove(0));
//                        remainingHumans -= 2;
//                    }
//                }
//                while (remainingHumans > 0 && !roomsForTwo.isEmpty()) {
//                    selectedRooms.add(roomsForTwo.remove(0));
//                    remainingHumans -= 2;
//                }
//            }
//        }
//
//        return selectedRooms;
//    }

        public boolean checkRoomAvailability(List<Room> availableRooms, int numberOfHumans) {
        int totalCapacity = availableRooms.stream().mapToInt(Room::getUserQuantity).sum();
        if (totalCapacity < numberOfHumans) {
            System.out.println("Not enough room for number of humans");
            return false;
        } else {
            System.out.println("Having enough room for number of humans");
            return true;
        }
    }


     public List<Room> getRoomsByType(int typeRoomId) {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT r.id, r.name, r.room_floor, r.userQuantity, r.area, r.price, r.status_id, r.description, r.hotel_id, r.type_id, r.createAt, r.deleteAt, r.updateAt, r.isActive, h.name AS hotelName, t.name AS typeRoomName "
                   + "FROM Room r "
                   + "JOIN Hotel h ON r.hotel_id = h.id "
                   + "JOIN TypeRoom t ON r.type_id = t.id "
                   + "WHERE r.type_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, typeRoomId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Room room = new Room();
                    room.setId(rs.getInt("id"));
                    room.setName(rs.getString("name"));
                    room.setRoom_floor(rs.getString("room_floor"));
                    room.setUserQuantity(rs.getInt("userQuantity"));
                    room.setArea(rs.getFloat("area"));
                    room.setPrice(rs.getFloat("price"));
                    room.setStatus(rs.getInt("status_id"));
                    room.setDescription(rs.getString("description"));
                    room.setIsActive(rs.getBoolean("isActive"));

                    Hotel hotel = new Hotel();
                    hotel.setId(rs.getInt("hotel_id"));
                    hotel.setName(rs.getString("hotelName"));
                    room.setHotel(hotel);

                    TypeRoom typeRoom = new TypeRoom();
                    typeRoom.setId(rs.getInt("type_id"));
                    typeRoom.setName(rs.getString("typeRoomName"));
                    room.setTypeRoom(typeRoom);

                    rooms.add(room);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    public List<TypeRoom> getTypeRooms() {
        List<TypeRoom> typeRooms = new ArrayList<>();
        String sql = "SELECT id, name FROM TypeRoom";
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                TypeRoom typeRoom = new TypeRoom();
                typeRoom.setId(rs.getInt("id"));
                typeRoom.setName(rs.getString("name"));
                typeRooms.add(typeRoom);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return typeRooms;
    }

    public List<Room> getListByPage(List<Room> list, int start, int end) {
        ArrayList<Room> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    
    
       public List<Room> getRoomsByFloor(String roomFloor) {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM Room WHERE room_floor = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, roomFloor);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Room room = new Room();
                    room.setId(rs.getInt("id"));
                    room.setName(rs.getString("name"));
                    room.setRoom_floor(rs.getString("room_floor"));
                    room.setUserQuantity(rs.getInt("userQuantity"));
                    room.setArea(rs.getFloat("area"));
                    room.setPrice(rs.getFloat("price"));
                    room.setStatus(rs.getInt("status_id"));
                    room.setDescription(rs.getString("description"));
                    room.setIsActive(rs.getBoolean("isActive"));



                    rooms.add(room);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    public List<String> getAllFloors() {
        List<String> floors = new ArrayList<>();
        String sql = "SELECT DISTINCT room_floor FROM Room";
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                floors.add(rs.getString("room_floor"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return floors;
    }

    // Method to get rooms sorted by high cost
    public List<Room> getRoomHighCost() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM Room ORDER BY price DESC";
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("id"));
                room.setName(rs.getString("name"));
                room.setRoom_floor(rs.getString("room_floor"));
                room.setUserQuantity(rs.getInt("userQuantity"));
                room.setArea(rs.getFloat("area"));
                room.setPrice(rs.getFloat("price"));
                room.setStatus(rs.getInt("status_id"));
                room.setDescription(rs.getString("description"));
                room.setIsActive(rs.getBoolean("isActive"));

                // Add other fields as needed

                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    // Method to get rooms sorted by low cost
    public List<Room> getRoomLowCost() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM Room ORDER BY price ASC";
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("id"));
                room.setName(rs.getString("name"));
                room.setRoom_floor(rs.getString("room_floor"));
                room.setUserQuantity(rs.getInt("userQuantity"));
                room.setArea(rs.getFloat("area"));
                room.setPrice(rs.getFloat("price"));
                room.setStatus(rs.getInt("status_id"));
                room.setDescription(rs.getString("description"));
                room.setIsActive(rs.getBoolean("isActive"));

                // Add other fields as needed

                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }
    
     public static void main(String[] args) {
        // Create an instance of RoomDAO
        RoomDAO roomDAO = new RoomDAO();

//        // Test the findListRoomByNumbersRoomNumberHuman method
//        int numberOfHumans = 4;
//        List<Room> rooms = roomDAO.findListRoomByNumbersRoomNumberHuman(numberOfHumans);
//
//        // Print the results
//        if (rooms != null) {
//            for (Room room : rooms) {
//                System.out.println(room);
//            }
//        } else {
//            System.out.println("No rooms found for the given number of humans.");
//            
//            
//            
//        }
        List<RoomImage> l=roomDAO.getRoomsForHomePage();
         for (RoomImage r : l) {
             System.out.println(r);
         }
        
        
    }
            
            
            
    }






