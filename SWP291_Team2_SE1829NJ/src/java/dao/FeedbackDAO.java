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
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Blog;
import model.Count;
import model.Feedback;
import model.Hotel;
import model.Room;
import model.Status;
import model.TypeRoom;
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
                Account a = new Account();
                Room r = new Room();
                f.setId(result.getInt(1));
                f.setImg(result.getString(2));
                f.setDescription(result.getString(3));
                f.setCreateAt(result.getString(4));
                a.setUsername(result.getString(6));
                f.setAcc(a);
                r.setId(result.getInt(5));
                f.setRoom(r);
                t.add(f);
            }
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return t;
    }
    
    public List<Feedback> getFeedbackByRid(int rid) {
        Connection conn = dbContext.getConnection();
        List<Feedback> t = new ArrayList<>();
        
        try {
            String sql = "select * from feedback\n"
                    + "WHERE roomid=?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, rid);
            ResultSet result = stm.executeQuery();
            
            while (result.next()) {
                Feedback f = new Feedback();
                Account a = new Account();
                Room r = new Room();
                f.setId(result.getInt(1));
                f.setImg(result.getString(2));
                f.setDescription(result.getString(3));
                f.setCreateAt(result.getString(4));
                a.setUsername(result.getString(6));
                f.setAcc(a);
                r.setId(result.getInt(5));
                f.setRoom(r);
                t.add(f);
            }
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return t;
    }
    
    public Feedback getFeedbackById(int id) {
        Connection conn = dbContext.getConnection();
        
        try {
            String sql = "select * from Feedback\n"
                    + "where id=?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, id);
            
            ResultSet result = stm.executeQuery();
            
            while (result.next()) {
                Feedback f = new Feedback();
                Account a = new Account();
                Room r = new Room();
                f.setId(result.getInt(1));
                f.setImg(result.getString(2));
                f.setDescription(result.getString(3));
                f.setCreateAt(result.getString(4));
                a.setUsername(result.getString(6));
                f.setAcc(a);
                r.setId(result.getInt(5));
                f.setRoom(r);
                return f;
            }
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
    
    public List<Feedback> pagingFeedback(int index) {
        Connection conn = dbContext.getConnection();
        List<Feedback> t = new ArrayList<>();
        
        try {
            String sql = "SELECT * from Feedback f JOIN Account a\n"
                    + "on f.username=a.username JOIN Room r\n"
                    + "on f.roomid=r.id\n"
                    + "  ORDER BY f.id\n"
                    + "     OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 5);
            
            ResultSet result = stm.executeQuery();
            
            while (result.next()) {
                Feedback f = new Feedback();
                Account a = new Account();
                Room r = new Room();
                Hotel h = new Hotel();
                TypeRoom tr = new TypeRoom();
                f.setId(result.getInt(1));
                f.setImg(result.getString(2));
                f.setDescription(result.getString(3));
                f.setCreateAt(result.getString(4));
                r.setId(result.getInt(5));
                a.setUsername(result.getString(6));
                a.setUsername(result.getString(7));
                a.setPassword(result.getString(8));
                a.setPhone(result.getString(9));
                a.setEmail(result.getString(10));
                a.setRole_id(result.getString(11));
                a.setIsActive(result.getBoolean(12));
                r.setId(result.getInt(13));
                r.setName(result.getString(14));
                r.setRoom_floor(result.getString(15));
                r.setUserQuantity(result.getInt(16));
                r.setArea(result.getFloat(17));
                r.setPrice(result.getFloat(18));
                r.setStatus(result.getInt(19));
                r.setDescription(result.getString(20));
                h.setId(result.getInt(21));
                r.setHotel(h);
                tr.setId(result.getInt(22));
                r.setTypeRoom(tr);
                r.setIsActive(result.getBoolean(26));
                f.setAcc(a);
                f.setRoom(r);
                t.add(f);
            }
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return t;
    }
    
    public List<Feedback> pagingFeedbackSearch(int index, String des) {
        Connection conn = dbContext.getConnection();
        List<Feedback> t = new ArrayList<>();
        
        try {
            String sql = "SELECT * from Feedback f JOIN [User] u\n"
                    + "on f.userid=u.id JOIN Room r\n"
                    + "on f.roomid=r.id\n"
                    + "where f.[description] LIKE ?\n"
                    + "ORDER BY f.id\n"
                    + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(2, (index - 1) * 5);
            stm.setString(1, "%" + des + "%");
            
            ResultSet result = stm.executeQuery();
            
            while (result.next()) {
                Feedback f = new Feedback();
                Account a = new Account();
                Room r = new Room();
                Hotel h = new Hotel();
                TypeRoom tr = new TypeRoom();
                f.setId(result.getInt(1));
                f.setImg(result.getString(2));
                f.setDescription(result.getString(3));
                f.setCreateAt(result.getString(4));
                r.setId(result.getInt(5));
                a.setUsername(result.getString(6));
                a.setUsername(result.getString(7));
                a.setPassword(result.getString(8));
                a.setPhone(result.getString(9));
                a.setEmail(result.getString(10));
                a.setRole_id(result.getString(11));
                a.setIsActive(result.getBoolean(12));
                r.setId(result.getInt(13));
                r.setName(result.getString(14));
                r.setRoom_floor(result.getString(15));
                r.setUserQuantity(result.getInt(16));
                r.setArea(result.getFloat(17));
                r.setPrice(result.getFloat(18));
                r.setStatus(result.getInt(19));
                r.setDescription(result.getString(20));
                h.setId(result.getInt(21));
                r.setHotel(h);
                tr.setId(result.getInt(22));
                r.setTypeRoom(tr);
                r.setIsActive(result.getBoolean(23));
                f.setAcc(a);
                f.setRoom(r);
                t.add(f);
            }
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return t;
    }
    
    public List<Feedback> pagingFeedbackByRid(int index, int rid) {
        Connection conn = dbContext.getConnection();
        List<Feedback> t = new ArrayList<>();
        
        try {
            String sql = "SELECT * from Feedback f JOIN Account a\n"
                    + "on f.username=a.username JOIN Room r\n"
                    + "on f.roomid=r.id\n"
                    + "where f.roomid=?\n"
                    + "ORDER BY f.id\n"
                    + "OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY;";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(2, (index - 1) * 3);
            stm.setInt(1, rid);
            
            ResultSet result = stm.executeQuery();
            
            while (result.next()) {
                Feedback f = new Feedback();
                Account a = new Account();
                Room r = new Room();
                Hotel h = new Hotel();
                TypeRoom tr = new TypeRoom();
                f.setId(result.getInt(1));
                f.setImg(result.getString(2));
                f.setDescription(result.getString(3));
                f.setCreateAt(result.getString(4));
                r.setId(result.getInt(5));
                a.setUsername(result.getString(6));
                a.setUsername(result.getString(7));
                a.setPassword(result.getString(8));
                a.setPhone(result.getString(9));
                a.setEmail(result.getString(10));
                a.setRole_id(result.getString(11));
                a.setIsActive(result.getBoolean(12));
                r.setId(result.getInt(13));
                r.setName(result.getString(14));
                r.setRoom_floor(result.getString(15));
                r.setUserQuantity(result.getInt(16));
                r.setArea(result.getFloat(17));
                r.setPrice(result.getFloat(18));
                r.setStatus(result.getInt(19));
                r.setDescription(result.getString(20));
                h.setId(result.getInt(21));
                r.setHotel(h);
                tr.setId(result.getInt(22));
                r.setTypeRoom(tr);
                r.setIsActive(result.getBoolean(26));
                f.setAcc(a);
                f.setRoom(r);
                t.add(f);
            }
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return t;
    }
    
    public void insertFeedback(String img, String des, String username, int rid) {
        Connection conn = dbContext.getConnection();
        LocalDateTime curDate = java.time.LocalDateTime.now();
        Timestamp timestamp = Timestamp.valueOf(curDate);
        String sql = "insert into Feedback\n"
                + "(img,description,createAt,roomid,username)\n"
                + "values(?,?,?,?,?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, img);
            pstmt.setString(2, des);
            pstmt.setTimestamp(3, timestamp);
            pstmt.setString(5, username);
            pstmt.setInt(4, rid);
            pstmt.executeUpdate();
            System.out.println("Account created successfully!");
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        String sql = "SELECT  COUNT(distinct userid) as commentUser from Feedback ";
        
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
    
    public int totalCommentByRid(int rid) {
        int count = 0;
        String sql = "SELECT  COUNT(*)  as comment from Feedback\n"
                + "where roomid=?";
        
        try  {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, rid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("comment");
            }
            
        } catch (SQLException e) {
            // Handle exception appropriately (log, notify user, etc.)
            e.printStackTrace();
        }
        
        return count;
    }
    
    public int totalCommentSearch(String des) {
        int count = 0;
        String sql = "SELECT COUNT(*) as totalS from [Feedback]\n"
                + "where [description] LIKE ?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + des + "%");
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                count = rs.getInt(1);
            }
            
        } catch (SQLException e) {
            // Handle exception appropriately (log, notify user, etc.)
            e.printStackTrace();
        }
        
        return count;
    }
    
    public List<Count> topAccountFeedback() {
        
        List<Count> t = new ArrayList<>();
        String sql = "select top(5) a.username ,count(*) as comment_count  from Feedback f\n"
                + "join Account a on f.username=a.username\n"
                + "group by a.username\n"
                + "order by comment_count desc;";
        
        try (
                PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery();) {
            
            while (rs.next()) {
                Count c = new Count();
                Account a = new Account();
                a.setUsername(rs.getString(1));
                c.setAcc(a);
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
//        List<Feedback> list = dao.pagingFeedbackByRid(1, 604);
//        for (Feedback f : list) {
//            System.out.println(f);
//        }
//dao.insertFeedback("https://www.shutterstock.com/shutterstock/photos/2157520005/display_1500/stock-photo-empty-interior-room-d-illustration-2157520005.jpg", "asvsabvsab", "admin", 602);
int c=dao.totalCommentByRid(602);
        System.out.println(c);
    }
}
