/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.BillDAO;
import dao.BlogDAO;
import dao.MenuDAO;
import dao.RoomDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import model.Booking;
//import model.User;

/**
 *
 * @author HUNG
 */
public class Dashboard extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
//            HttpSession session = request.getSession(); ///////////////////////////////////////////////////////////////////////////////////////////////////////
//            model.User user = (User) session.getAttribute("user");
//            if (user.getIsAdmin().equalsIgnoreCase("true")) {

//             
    UserDAO udao = new UserDAO();
    BillDAO bidao = new BillDAO();
    BlogDAO bldao = new BlogDAO();
    MenuDAO mdao = new MenuDAO();
    RoomDAO rdao = new RoomDAO();

    // Retrieve counts
    int countUser = udao.countUsers();
    int countBill = bidao.countBill();
    int countBlog = bldao.countBlog();
    int countFood = mdao.countFood();
    int countRoom = rdao.countRoom();
    int countReparingRoom = rdao.countRepairingRoom();
    int countEmptyRoom = rdao.countEmptyRoom();
    int countBookingRoom = rdao.countBookingRoom();
    int countUsingRoom = rdao.countUsingRoom();

 
    
    
    
    
    System.out.println("Total Users: " + countUser);
    System.out.println("Total Bills: " + countBill); 
    System.out.println("Total Blogs: " + countBlog); 
    System.out.println("Total Foods: " + countFood);
    System.out.println("Total Rooms: " + countRoom);
    System.out.println("Repairing Rooms: " + countReparingRoom);
    System.out.println("Empty Rooms: " + countEmptyRoom); 
    System.out.println("Booking Rooms: " + countBookingRoom); 
    System.out.println("Using Rooms: " + countUsingRoom);
    
    
    // Set attributes in the request scope
    request.setAttribute("totalUser", countUser);
    request.setAttribute("totalBill", countBill);
    request.setAttribute("totalBlog", countBlog);
    request.setAttribute("totalFood", countFood);
    request.setAttribute("totalRoom", countRoom);
    request.setAttribute("reRoom", countReparingRoom);
    request.setAttribute("emRoom", countEmptyRoom);
    request.setAttribute("boRoom", countBookingRoom);
    request.setAttribute("usRoom", countUsingRoom);

    
           // Retrieve booking details
            List<Booking> bookings = bidao.getAllBookings(); // Implement getAllBookings method in BillDAO
            request.setAttribute("bookings", bookings);
            
             List<Booking> bookingByDay = bidao.getBookingsByDay(LocalDate.now()); // Implement getAllBookings method in BillDAO
            request.setAttribute("bookingByDay", bookingByDay);
    
    
    // Forward the request to the admin JSP page
    request.getRequestDispatcher("admin/admin.jsp").forward(request, response);

          
//            } else {
//                response.sendRedirect("login");
//            }
        } catch (ServletException | IOException e) {
            response.sendRedirect("404.jsp");
        }

    }

    public static void main(String[] args) {

        UserDAO udao = new UserDAO();
    BillDAO bidao = new BillDAO();
    BlogDAO bldao = new BlogDAO();
    MenuDAO mdao = new MenuDAO();
    RoomDAO rdao = new RoomDAO();

    // Retrieve counts
    int countUser = udao.countUsers();
    int countBill = bidao.countBill();
    int countBlog = bldao.countBlog();
    int countFood = mdao.countFood();
    int countRoom = rdao.countRoom();
    int countReparingRoom = rdao.countRepairingRoom();
    int countEmptyRoom = rdao.countEmptyRoom();
    int countBookingRoom = rdao.countBookingRoom();
    int countUsingRoom = rdao.countUsingRoom();

 
    
    
    
    
    System.out.println("Total Users: " + countUser);
    System.out.println("Total Bills: " + countBill); 
    System.out.println("Total Blogs: " + countBlog); 
    System.out.println("Total Foods: " + countFood);
    System.out.println("Total Rooms: " + countRoom);
    System.out.println("Repairing Rooms: " + countReparingRoom);
    System.out.println("Empty Rooms: " + countEmptyRoom);
    System.out.println("Booking Rooms: " + countBookingRoom); 
    System.out.println("Using Rooms: " + countUsingRoom);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
