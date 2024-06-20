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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Blog;

/**
 *
 * @author admin
 */
public class BlogDAO {

     DBContext dbContext;
    Connection connection;

    public BlogDAO() {
         dbContext = DBContext.getInstance();
        connection = dbContext.getConnection();
    }
    
    

    public void insertBlog(String title, String detail, String briefinfo, String image, int flag, String username) {
//        Connection conn = dbContext.getConnection();
        LocalDateTime curDate = java.time.LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String date = curDate.format(formatter);
        String sql = "INSERT INTO [dbo].[Blog]\n"
                + "(title,detail,briefinfo,[Image],createAt,flag,username)\n"
                + "VALUES\n"
                + "( \n"
                + " ?, ?, ?,?,?,?,?\n"
                + ")";
        try ( PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, detail);
            pstmt.setString(3, briefinfo);
            pstmt.setString(4, image);
            pstmt.setString(5, date);
            pstmt.setInt(6, flag);
            pstmt.setString(7, username);
            pstmt.executeUpdate();
            System.out.println("Account created successfully!");
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editBlog(String title, String detail, String briefinfo, String image, String flag, String id) {
//        Connection conn = dbContext.getConnection();
        LocalDateTime curDate = java.time.LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String date = curDate.format(formatter);
        String sql = "UPDATE [dbo].[Blog]\n"
                + "SET\n"
                + "    [title] = ?,\n"
                + "    [detail] = ?,\n"
                + "    [briefinfo] = ?,\n"
                + "    [Image] = ?,\n"
                + "    [flag] = ?\n"
                + "WHERE id=?";
        try ( PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, detail);
            pstmt.setString(3, briefinfo);
            pstmt.setString(4, image);
            pstmt.setString(5, flag);
            pstmt.setString(6, id);
            pstmt.executeUpdate();
            System.out.println("Account created successfully!");
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteBlog(String id) {
//        Connection conn = dbContext.getConnection();

        LocalDateTime curDate = java.time.LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String date = curDate.format(formatter);
        String sql = "DELETE FROM [dbo].[Blog]\n"
                + "WHERE id=?";
        try ( PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, id);

            pstmt.executeUpdate();
            System.out.println("Account created successfully!");
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Blog getBlogById(String id) {
//        Connection conn = dbContext.getConnection();

        List<Blog> t = new ArrayList<>();

        try {
            String sql = "SELECT * from Blog\n"
                    + "where id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);

            ResultSet result = stm.executeQuery();

            while (result.next()) {
                Blog b = new Blog();
                Account a = new Account();
                b.setId(result.getInt(1));
                b.setTitle(result.getString(2));
                b.setDetail(result.getString(3));
                b.setBriefinfo(result.getString(4));
                b.setImage(result.getString(5));
                b.setCreateAt(result.getString(6));
                b.setFlag(result.getInt(7));
                a.setUsername(result.getString(8));
                b.setAccount(a);
                t.add(b);
                return b;
            }
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public List<Blog> getAllBlog() {
//        Connection conn = dbContext.getConnection();
        List<Blog> t = new ArrayList<>();

        try {
            String sql = "select * from Blog";
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet result = stm.executeQuery();

            while (result.next()) {
                Blog b = new Blog();
                Account a = new Account();
                b.setId(result.getInt(1));
                b.setTitle(result.getString(2));
                b.setDetail(result.getString(3));
                b.setBriefinfo(result.getString(4));
                b.setImage(result.getString(5));
                b.setCreateAt(result.getString(6));
                b.setFlag(result.getInt(7));
                a.setUsername(result.getString(8));
                b.setAccount(a);
                t.add(b);
            }
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return t;
    }

    public List<Blog> getBlogByTitle(String title) {
//        Connection conn = dbContext.getConnection();

        List<Blog> t = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Blog\n"
                    + "WHERE title LIKE ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + title + "%");

            ResultSet result = stm.executeQuery();

            while (result.next()) {
                Blog b = new Blog();
                Account a = new Account();
                b.setId(result.getInt(1));
                b.setTitle(result.getString(2));
                b.setDetail(result.getString(3));
                b.setBriefinfo(result.getString(4));
                b.setImage(result.getString(5));
                b.setCreateAt(result.getString(6));
                b.setFlag(result.getInt(7));
                a.setUsername(result.getString(8));
                b.setAccount(a);
                t.add(b);
            }
        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return t;
    }

//    public static void main(String[] args) {
//        BlogDAO dao = new BlogDAO();
////       dao.insertBlog("", "", "psfaklfsf", "https://product.hstatic.net/200000642007/product/07ivs_3ashcrb3n_1_4d2076ec43ee4588a7900e5f9f2f08ee_0a04685a3fc44c93aa755447465fd67c_master.jpg", 0, "hieplh");
////        dao.editBlog("aaaaaaaaaaaa", "vdfvdfbfb", "psfaklfsf", "https://product.hstatic.net/200000642007/product/07ivs_3ashcrb3n_1_4d2076ec43ee4588a7900e5f9f2f08ee_0a04685a3fc44c93aa755447465fd67c_master.jpg", "0", "4007");
////        List<Blog> b=dao.searchByTitle("k");
//        List<Blog> b = dao.getAllBlog();
////        b.stream().forEach(c -> {
////            System.out.println(c);
////        });
//        for (Blog blog : b) {
//            System.out.println(blog);
//        }
////        dao.deleteBlog("6005");
//    }
    
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
