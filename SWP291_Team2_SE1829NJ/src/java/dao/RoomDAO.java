package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoomDAO {
    private final DBContext dbContext;
    private final Connection connection;

    public RoomDAO() {
        dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();
    }

    public int countRoom() {
        int count = 0;
        String sql = "SELECT COUNT(*) AS countRoom FROM Room";
        try (
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery()
        ) {
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
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery()
        ) {
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
            PreparedStatement st = connection.prepareStatement(sql)
        ) {
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

    public static void main(String[] args) {
        RoomDAO rdao = new RoomDAO();
        int count = rdao.countEmptyRoom();
        System.out.println("Number of empty rooms: " + count);
    }
}
