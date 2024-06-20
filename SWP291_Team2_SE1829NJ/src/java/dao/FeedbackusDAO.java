package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Feedbackus;

public class FeedbackusDAO {

    // Chi tiết kết nối cơ sở dữ liệu (chỉnh sửa nếu cần)
    private static final String url = "jdbc:sqlserver://LINHNNHE171195\\MSSQLSERVER04:1433;databaseName=HotelBooking";
    private static final String username = "sa";
    private static final String password = "123";

    // Câu lệnh SQL để chèn phản hồi
    private static final String INSERT_FEEDBACK_SQL = "INSERT INTO [feedbackus] (name, email, message, created_at) VALUES (?, ?, ?, ?)";

    public boolean submitFeedback(Feedbackus feedback) {
        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(INSERT_FEEDBACK_SQL)) {

            stmt.setString(1, feedback.getName());
            stmt.setString(2, feedback.getEmail());
            stmt.setString(3, feedback.getMessage());
            stmt.setTimestamp(4, new java.sql.Timestamp(feedback.getCreatedAt().getTime()));

            // Thực thi câu lệnh
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException ex) {
            System.out.println("Lỗi khi gửi phản hồi: " + ex.getMessage());
            return false;
        }
    }
}
