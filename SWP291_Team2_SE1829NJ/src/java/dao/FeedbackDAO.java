/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Blog;
import model.Count;
import model.Feedback;
import model.Room;
import model.User;

/**
 *
 * @author admin
 */
public class FeedbackDAO {

    DBContext dbContext;
    Connection connection;

    public FeedbackDAO() {
        dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();  // Assuming getConnection() method exists in DBContext

    }

    public List<Feedback> getAllFeedback() {
        Connection conn = dbContext.getConnection();
        List<Feedback> t = new ArrayList<>();

        try {
            String sql = "select * from Feedback";
            PreparedStatement stm = conn.prepareStatement(sql);

            ResultSet result = stm.executeQuery();

            while (result.next()) {
                Feedback f = new Feedback();
                User u = new User();
                Room r = new Room();
                f.setId(result.getInt(1));
                f.setImg(result.getString(2));
                f.setDescription(result.getString(3));
                f.setCreateAt(result.getString(4));
                u.setId(result.getInt(5));
                f.setUser(u);
                r.setId(result.getInt(6));
                f.setRoom(r);
                t.add(f);
            }
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return t;
    }

    public void editFeedback(String img, String des, String id) {
        Connection conn = dbContext.getConnection();
        LocalDateTime curDate = java.time.LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String date = curDate.format(formatter);
        String sql = """
                     UPDATE [dbo].[Feedback]
                     SET
                         [img] = ?,
                         [description] = ?,
                         [createAt]=?
                     WHERE id=?""";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, img);
            pstmt.setString(2, des);
            pstmt.setString(3, date);
            pstmt.setString(4, id);
            pstmt.executeUpdate();
            System.out.println("Account created successfully!");
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteFeedback(String id) {
        Connection conn = dbContext.getConnection();
        String sql = """
                     DELETE FROM [dbo].[Feedback]
                     WHERE id=?""";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);

            pstmt.executeUpdate();
            System.out.println("Account created successfully!");
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int totalUserComment() {
        int count = 0;
        String sql = "SELECT  COUNT(distinct user_id) as commentUser from Feedback ";

        try (
                PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery();) {

            if (rs.next()) {
                count = rs.getInt("commentUser");
            }

        } catch (SQLException e) {
            // Handle exception appropriately (log, notify user, etc.)
            e.printStackTrace();
        }

        return count;
    }

    public int totalComment() {
        int count = 0;
        String sql = "SELECT  COUNT(*)  as comment from Feedback";

        try (
                PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery();) {

            if (rs.next()) {
                count = rs.getInt("comment");
            }

        } catch (SQLException e) {
            // Handle exception appropriately (log, notify user, etc.)
            e.printStackTrace();
        }

        return count;
    }
    
    public List<Count> topUserFeedback(){
        List<Count> t = new ArrayList<>();
        String sql = "SELECT u.name, COUNT(*) AS comment_count\n"
                + "FROM feedback f JOIN [User] u \n"
                + "on f.user_id=u.id\n"
                + "GROUP BY u.name\n"
                + "ORDER BY comment_count DESC";

        try (
                PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery();) {

            while (rs.next()) {
                Count c = new Count();
                User u=new User();
                u.setName(rs.getString(1));
                c.setUser(u);
                c.setCount(rs.getInt(2));
                t.add(c);

            }

        } catch (SQLException e) {
            // Handle exception appropriately (log, notify user, etc.)
            e.printStackTrace();
        }

        return t;
    }
    
    

    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        List<Count> list=dao.topUserFeedback();
        for (Count count : list) {
            System.out.println(count);
        }

    }
}
