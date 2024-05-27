package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * DAO class for managing Blog entities.
 * Handles database operations related to Blog.
 */
public class BlogDAO {

     private final DBContext dbContext;
    private final Connection connection;

    public BlogDAO() {
        dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();
    }
  
    public int countBlog() {
        int count = 0;
        String sql = "SELECT COUNT(*) AS countBlog FROM Blog";

        try (
                 PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery()
                ) {

            if (rs.next()) {
                count = rs.getInt("countBlog");
            }

        } catch (SQLException e) {
            // Handle exception (e.g., log error, notify user, etc.)
            e.printStackTrace();
        }

        return count;
    }

    /**
     * Main method to test countBlog() functionality.
     * 
     * @param args The command line arguments (not used).
     */
    public static void main(String[] args) {
        BlogDAO blogDAO = new BlogDAO();
        int count = blogDAO.countBlog();
        System.out.println("Number of Blogs: " + count);
    }
}
