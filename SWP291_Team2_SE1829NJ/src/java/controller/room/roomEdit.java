/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.room;


import dao.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Hotel;
import model.Room;
import model.TypeRoom;

/**
 *
 * @author HUNG
 */
public class roomEdit extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
           request.setCharacterEncoding("UTF-8"); // Support for Unicode data sent from the form
         response.setContentType("text/html; charset=UTF-8");
        // Parsing form data
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String roomFloor = request.getParameter("room_floor");
    
        int userQuantity = Integer.parseInt(request.getParameter("userQuantity"));
        float area = Float.parseFloat(request.getParameter("area"));
        float price = Float.parseFloat(request.getParameter("price"));
        int statusId = Integer.parseInt(request.getParameter("status_id"));
        int hotelId = Integer.parseInt(request.getParameter("hotel_id"));
        int typeId = Integer.parseInt(request.getParameter("type_id"));
        String description = request.getParameter("description");
        boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));

        // Creating a room object from the data
        Room room = new Room();
        room.setId(id);
        room.setName(name);
        room.setRoom_floor(roomFloor);
    
        room.setUserQuantity(userQuantity);
        room.setArea(area);
        room.setPrice(price);
        room.setStatus(statusId);
        room.setDescription(description);
        room.setIsActive(isActive);
        room.setHotel(new Hotel(hotelId)); // Assuming Hotel class has a constructor to set id
        room.setTypeRoom(new TypeRoom(typeId)); // Assuming TypeRoom class has a constructor to set id

        RoomDAO roomDAO = new RoomDAO();
        boolean result = roomDAO.editRoomById(room);
       
        if (result) {
            response.sendRedirect("roommanagement"); // Redirect to the room list if successful
        } else {
            request.setAttribute("errorMessage", "Error updating room");
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response); // Forward to error page if not successful
        }
    
    
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
