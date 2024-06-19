/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

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
import model.Feedback;
import model.Room;
import model.User;

/**
 *
 * @author admin
 */
public class FeedbackDAO {
    DBContext dbContext;

    public FeedbackDAO() {
        dbContext = DBContext.getInstance();
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
                User u=new User();
                Room r=new Room();
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
        String sql = "UPDATE [dbo].[Feedback]\n"
                + "SET\n"
                + "    [img] = ?,\n"
                + "    [description] = ?,\n"
                + "    [createAt]=?\n"
                + "WHERE id=?";
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
        String sql = "DELETE FROM [dbo].[Feedback]\n"
                + "WHERE id=?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);

            pstmt.executeUpdate();
            System.out.println("Account created successfully!");
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        List<Feedback> list=dao.getAllFeedback();
        for (Feedback f : list) {
            System.out.println(f);
        }
//        dao.editFeedback("https://vcdn1-dulich.vnecdn.net/2021/12/24/An-Giang-0-jpeg-1470-1640315739.jpg?w=460&h=0&q=100&dpr=2&fit=crop&s=wDAONDRSgio6Yca5G1sQ7Q", "1234567890", "1");
    }
}
