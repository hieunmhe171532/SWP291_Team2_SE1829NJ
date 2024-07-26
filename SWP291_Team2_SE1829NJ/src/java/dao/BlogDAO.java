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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
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
        LocalDateTime curDate = java.time.LocalDateTime.now();
        Timestamp timestamp = Timestamp.valueOf(curDate);
        String sql = "INSERT INTO [dbo].[Blog] (title, detail, briefinfo, image, createAt, flag, username) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, detail);
            pstmt.setString(3, briefinfo);
            pstmt.setString(4, image);
            pstmt.setTimestamp(5, timestamp);
            pstmt.setInt(6, flag);
            pstmt.setString(7, username);
            pstmt.executeUpdate();
            System.out.println("Blog created successfully!");
        } catch (SQLException ex) {
            System.err.println("Error inserting blog: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void editBlog(String title, String detail, String briefinfo, String image, String flag, String id) {
        String sql = "UPDATE [dbo].[Blog]\n"
                + "SET\n"
                + "    [title] = ?,\n"
                + "    [detail] = ?,\n"
                + "    [briefinfo] = ?,\n"
                + "    [Image] = ?,\n"
                + "    [flag] = ?\n"
                + "WHERE id=?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, detail);
            pstmt.setString(3, briefinfo);
            pstmt.setString(4, image);
            pstmt.setString(5, flag);
            pstmt.setString(6, id);
            pstmt.executeUpdate();
            System.out.println("Account created successfully!");
        } catch (SQLException ex) {
        }
    }

    public void deleteBlog(String id) {

        String sql = "DELETE FROM [dbo].[Blog]\n"
                + "WHERE id=?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, id);

            pstmt.executeUpdate();
            System.out.println("Account created successfully!");
        } catch (SQLException ex) {
        }
    }

    public Blog getBlogById(String id) {
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
        }

        return null;
    }

    public Blog getBlogTop1() {
        List<Blog> t = new ArrayList<>();

        try {
            String sql = "select top(1) * from Blog\n"
                    + "order by flag desc,createAt desc";
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
                return b;
            }
        } catch (SQLException ex) {
        }

        return null;
    }

    public List<Blog> getAllBlog() {
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
        }

        return t;
    }

    public List<Blog> getRecentBlog(int id) {
        List<Blog> t = new ArrayList<>();

        try {
            String sql = "SELECT top(5) * from Blog\n"
                    + "where id <> ?\n"
                    + "ORDER BY createAt DESC,flag desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
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
        }

        return t;
    }

    public List<Blog> getBlogByTitle(String title) {

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
        }

        return t;
    }

    public List<Blog> getBlogPage(int index) {

        List<Blog> t = new ArrayList<>();

        try {
            String sql = "select * from blog\n"
                    + "ORDER BY flag DESC\n"
                    + "OFFSET ? rows FETCH NEXT 6 ROWS ONLY;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 6);

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
        }

        return t;
    }

    public int countBlog() {
        int count = 0;
        String sql = "SELECT COUNT(*) AS countBlog FROM Blog";

        try (
                PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            if (rs.next()) {
                count = rs.getInt("countBlog");
            }

        } catch (SQLException e) {
            // Handle exception (e.g., log error, notify user, etc.)
            e.printStackTrace();
        }

        return count;
    }

    public static void main(String[] args) {
        BlogDAO dao = new BlogDAO();
        Blog l = dao.getBlogTop1();
        System.out.println(l);
//int c=dao.countBlog();
//        System.out.println(c);
    }
}
