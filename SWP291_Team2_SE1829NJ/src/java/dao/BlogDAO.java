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
public class BlogDAO  {
    DBContext dbContext;

    public BlogDAO() {
        dbContext = DBContext.getInstance();
    }

    public void insertBlog(String title, String detail, String briefinfo, String image, int flag, String username) {
        LocalDateTime curDate = java.time.LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String date = curDate.format(formatter);
        String sql = "INSERT INTO [dbo].[Blog]\n"
                + "(title,detail,briefinfo,[Image],createAt,flag,username)\n"
                + "VALUES\n"
                + "( \n"
                + " ?, ?, ?,?,?,?,?\n"
                + ")";
        try (Connection conn = dbContext.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
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
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Blog getBlogById(String id) {
        List<Blog> t = new ArrayList<>();

        try {
            String sql = "SELECT * from Blog\n"
                    + "where id=?";
            Connection conn = dbContext.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
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
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
//    public List<Blog> getAllBlog() {
//        LocalDateTime curDate = java.time.LocalDateTime.now();
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
//        String date = curDate.format(formatter);
//        List<Blog> t = new ArrayList<>();
//        xSql = "select * from Blog";
//        try {
//            
//            ps = con.prepareStatement(xSql);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Blog b = new Blog();
//                Account a=new Account();
//                b.setId(rs.getInt(1));
//                b.setTitle(rs.getString(2));
//                b.setDetail(rs.getString(3));
//                b.setBriefinfo(rs.getString(4));
//                b.setImage(rs.getString(5));
//                b.setCreateAt(rs.getString(6));
//                b.setFlag(rs.getInt(7));
//                a.setUsername(rs.getString(8));
//                b.setAccount(a);
//                t.add(b);
//            }
//            rs.close();
//            ps.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return (t);
//    }
//    public List<Blog> searchByTitle(String title) {
//        List<Blog> t = new ArrayList<>();
//        xSql = "SELECT * FROM Blog\n"
//                + "WHERE title LIKE ?;";
//        try {
//            
//            ps = con.prepareStatement(xSql);
//            ps.setString(1, "%" + title + "%");
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Blog b = new Blog();
//                Account a = new Account();
//                b.setId(rs.getInt(1));
//                b.setTitle(rs.getString(2));
//                b.setDetail(rs.getString(3));
//                b.setBriefinfo(rs.getString(4));
//                b.setImage(rs.getString(5));
//                b.setCreateAt(rs.getString(6));
//                b.setFlag(rs.getInt(7));
//                a.setUsername(rs.getString(8));
//                b.setAccount(a);
//                t.add(b);
//            }
//            rs.close();
//            ps.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return (t);
//    }
//    public Blog getBlogById(String id) {
//        LocalDateTime curDate = java.time.LocalDateTime.now();
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
//        String date = curDate.format(formatter);
//        List<Blog> t = new ArrayList<>();
//        xSql = "SELECT * from Blog\n"
//                + "where id=?";
//
//        try {
//
//            ps = con.prepareStatement(xSql);
//            ps.setString(1, id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Blog b = new Blog();
//                Account a = new Account();
//                b.setId(rs.getInt(1));
//                b.setTitle(rs.getString(2));
//                b.setDetail(rs.getString(3));
//                b.setBriefinfo(rs.getString(4));
//                b.setImage(rs.getString(5));
//                b.setCreateAt(date);
//                b.setFlag(rs.getInt(7));
//                a.setUsername(rs.getString(8));
//                b.setAccount(a);
//                t.add(b);
//                return b;
//            }
//            rs.close();
//            ps.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//    public void Insert(String title, String detail,String briefinfo,String image,int flag,String username
//    ) {
//        LocalDateTime curDate = java.time.LocalDateTime.now();
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
//        String date = curDate.format(formatter);
//        xSql = "INSERT INTO [dbo].[Blog]\n"
//                + "(title,detail,briefinfo,[Image],createAt,flag,username)\n"
//                + "VALUES\n"
//                + "( \n"
//                + " ?, ?, ?,?,?,?,?\n"
//                + ")";
//        try {
//            ps = con.prepareStatement(xSql);
//            ps.setString(1, title);
//            ps.setString(2, detail);
//            ps.setString(3, briefinfo);
//            ps.setString(4, image);
//            ps.setString(5, date);
//            ps.setInt(6, flag);
//            ps.setString(7, username);
//
//            ps.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//    public void Edit(String title, String detail, String briefinfo, String image, String flag,String id
//    ) {
//        LocalDateTime curDate = java.time.LocalDateTime.now();
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
//        String date = curDate.format(formatter);
//        xSql = "UPDATE [dbo].[Blog]\n"
//                + "SET\n"
//                + "    [title] = ?,\n"
//                + "    [detail] = ?,\n"
//                + "    [briefinfo] = ?,\n"
//                + "    [Image] = ?,\n"
//                + "    [flag] = ?,\n"
//                + "    [createAt] = ?\n"
//                + "WHERE id=?";
//        try {
//            ps = con.prepareStatement(xSql);
//            ps.setString(1, title);
//            ps.setString(2, detail);
//            ps.setString(3, briefinfo);
//            ps.setString(4, image);
//            ps.setString(5, flag);
//            ps.setString(6, date);
//            ps.setString(7, id);
//
//            ps.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//    public void Delete(String id
//    ) {
//        LocalDateTime curDate = java.time.LocalDateTime.now();
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
//        String date = curDate.format(formatter);
//        xSql = "DELETE FROM [dbo].[Blog]\n"
//                + "WHERE id=?";
//        try {
//            ps = con.prepareStatement(xSql);
//            ps.setString(1, id);
//            ps.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
    public static void main(String[] args) {
        BlogDAO dao = new BlogDAO();
//        dao.Insert("", "", "psfaklfsf", "https://product.hstatic.net/200000642007/product/07ivs_3ashcrb3n_1_4d2076ec43ee4588a7900e5f9f2f08ee_0a04685a3fc44c93aa755447465fd67c_master.jpg", 0, "hieplh");
//        dao.Edit("aaaaaaaaaaaa", "vdfvdfbfb", "psfaklfsf", "https://product.hstatic.net/200000642007/product/07ivs_3ashcrb3n_1_4d2076ec43ee4588a7900e5f9f2f08ee_0a04685a3fc44c93aa755447465fd67c_master.jpg", "1", "2");
//        List<Blog> b=dao.searchByTitle("k");
//        for (Blog blog : b) {
//            System.out.println(blog);
//        }
    }
}
