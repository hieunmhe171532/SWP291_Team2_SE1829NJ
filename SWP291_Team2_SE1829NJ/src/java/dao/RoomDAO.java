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
    private Connection conn;

    public RoomDAO() {
        dbContext = DBContext.getInstance();
        conn = dbContext.getConnection();  // Assuming getConnection() method exists in DBContext
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
                case "5+" -> query.append("AND r.userQuantity >= 5 ");
            }
        }

        if (priceRange != null && !priceRange.isEmpty()) {
            switch (priceRange) {
                case "0-500.000" -> query.append("AND r.price BETWEEN 0 AND 500000 ");
                case "500.000-1.000.000" -> query.append("AND r.price BETWEEN 500000 AND 1000000 ");
                case "1.000.000-2.000.000" -> query.append("AND r.price BETWEEN 1000000 AND 2000000 ");
                case "2.000.000-5.000.000" -> query.append("AND r.price BETWEEN 2000000 AND 5000000 ");
            }
        }

        if (typeRoomId != null) {
            query.append("AND r.type_id = ? ");
            params.add(typeRoomId);
        }

        try ( PreparedStatement preparedStatement = conn.prepareStatement(query.toString())) {
            for (int i = 0; i < params.size(); i++) {
                preparedStatement.setObject(i + 1, params.get(i));
            }

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Room room = new Room();
                    room.setId(resultSet.getInt("rId"));
                    room.setName(resultSet.getString("rName"));
                    room.setImage(resultSet.getString("rImage"));
                    room.setUserQuantity(resultSet.getInt("userQuantity"));
                    room.setArea(resultSet.getFloat("area"));
                    room.setQuantity(resultSet.getInt("quantity"));
                    room.setPrice(resultSet.getFloat("price"));
                    room.setStatus(resultSet.getBoolean("rStatus"));
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
            System.out.println("lỗi "+ e);
        }

        return rooms;
    }

    public static void main(String[] args) {
        RoomDAO dao = new RoomDAO();
        List<Room> list = dao.getAllByParam("", "", 1);
        System.out.println("Number of rooms: " + list.size());
        for (Room r : list) {
            System.out.println(r);
        }
    }
}
