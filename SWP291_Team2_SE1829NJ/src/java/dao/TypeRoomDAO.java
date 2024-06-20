package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.TypeRoom;

public class TypeRoomDAO  {
      DBContext dbContext;
     Connection connection;

    public TypeRoomDAO() {
        dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();  // Assuming getConnection() method exists in DBContext
    }
    
    // Get TypeRoom by ID
    public TypeRoom getTypeRoomByID(int id) {
        TypeRoom typeRoom = new TypeRoom();
        String query = "SELECT * FROM TypeRoom WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    typeRoom.setId(resultSet.getInt("id"));
                    typeRoom.setName(resultSet.getString("name"));
                    typeRoom.setIsDelete(resultSet.getBoolean("isDelete"));
                    typeRoom.setCreateAt(resultSet.getDate("createAt"));
                    typeRoom.setUpdateAt(resultSet.getDate("updateAt"));
                    typeRoom.setDeleteAt(resultSet.getDate("deleteAt"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return typeRoom;
    }

    // Add new TypeRoom
    public void addTypeRoom(TypeRoom typeRoom) {
        String query = "INSERT INTO TypeRoom (name, isDelete, createAt, updateAt, deleteAt) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, typeRoom.getName());
            preparedStatement.setBoolean(2, typeRoom.isIsDelete());
            preparedStatement.setDate(3, new java.sql.Date(typeRoom.getCreateAt().getTime()));
            preparedStatement.setDate(4, new java.sql.Date(typeRoom.getUpdateAt().getTime()));
            preparedStatement.setDate(5, new java.sql.Date(typeRoom.getDeleteAt().getTime()));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update existing TypeRoom
    public void updateTypeRoom(TypeRoom typeRoom) {
        String query = "UPDATE TypeRoom SET name = ?, isDelete = ?, createAt = ?, updateAt = ?, deleteAt = ? WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, typeRoom.getName());
            preparedStatement.setBoolean(2, typeRoom.isIsDelete());
            preparedStatement.setDate(3, new java.sql.Date(typeRoom.getCreateAt().getTime()));
            preparedStatement.setDate(4, new java.sql.Date(typeRoom.getUpdateAt().getTime()));
            preparedStatement.setDate(5, new java.sql.Date(typeRoom.getDeleteAt().getTime()));
            preparedStatement.setInt(6, typeRoom.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // List all TypeRoom entries
    public List<TypeRoom> listAllTypeRooms() {
        List<TypeRoom> typeRooms = new ArrayList<>();
        String query = "SELECT * FROM TypeRoom";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                TypeRoom typeRoom = new TypeRoom();
                typeRoom.setId(resultSet.getInt("id"));
                typeRoom.setName(resultSet.getString("name"));
                typeRoom.setIsDelete(resultSet.getBoolean("isDelete"));
                typeRoom.setCreateAt(resultSet.getDate("createAt"));
                typeRoom.setUpdateAt(resultSet.getDate("updateAt"));
                typeRoom.setDeleteAt(resultSet.getDate("deleteAt"));
                typeRooms.add(typeRoom);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return typeRooms;
    }
    public static void main(String[] args) {
        TypeRoomDAO dao= new TypeRoomDAO();
        List<TypeRoom> l = dao.listAllTypeRooms();
        System.out.println(l.size());
    }
}
