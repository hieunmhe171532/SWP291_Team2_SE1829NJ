/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.room;


import dao.AccountDAO;
import dao.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.Timestamp;
import java.sql.Date;
import java.time.LocalDateTime;
import model.Hotel;
import model.Room;
import model.TypeRoom;

/**
 *
 * @author HUNG
 */
public class roomCreate extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

  request.getRequestDispatcher("/admin/roomCreate.jsp").forward(request, response);
    
    
    
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
    response.setContentType("text/html;charset=UTF-8");
    HttpSession session = request.getSession();
    PrintWriter out = response.getWriter();

    try {
        // Retrieve user object from session to check user role or login status
        model.Account acc = (model.Account) session.getAttribute("acc");
        if (acc == null || !acc.getRole_id().equals("1")) { // Assuming '1' is the role ID for admins
            response.sendRedirect("login"); // Redirect to login page if not authorized
            return;
        }

        // Extract room data from the form submission
  int id  = Integer.parseInt(request.getParameter("id"));     
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

// Creating a new Room object
Room room = new Room(); // Assume constructor and setters are available
 room.setId(id); // Assuming ID is manually set for testing
room.setName(name);
room.setRoom_floor(roomFloor);

room.setUserQuantity(userQuantity);
room.setArea(area);
room.setPrice(price);
room.setStatus(statusId);
room.setHotel(new Hotel(hotelId)); // Correct instantiation
room.setTypeRoom(new TypeRoom(typeId)); // Correct instantiation
room.setDescription(description);
room.setIsActive(isActive);



        RoomDAO roomDAO = new RoomDAO();
        boolean result = roomDAO.insertRoom(room);

        if (result) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Room has been added successfully');");
            out.println("window.location.href = 'roomList';"); // Redirect to room list or appropriate page
            out.println("</script>");
            
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Failed to add room');");
            out.println("window.location.href = 'roomCreate';"); // Stay on the create page for correction
            out.println("</script>");
        }
        
          request.getRequestDispatcher("roommanagement").forward(request, response);

    } catch (ServletException | IOException | NumberFormatException e) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Error: " + e.getMessage() + "');");
        out.println("window.location.href = 'roomCreate';"); // Redirect back to the form page on error
        out.println("</script>");
    } finally {
        out.close();
    }
}

    public static void main(String[] args) {
        RoomDAO roomDAO = new RoomDAO();  // Assuming RoomDAO has a default constructor and does not require a servlet context

        // Create a new Room object manually for testing
        Room room = new Room();
        room.setId(12); // Assuming ID is manually set for testing
        room.setName("Deluxe Room");
        room.setRoom_floor("1st");
     
        room.setUserQuantity(2);
        room.setArea(30.5f);
        room.setPrice(150.0f);
        room.setStatus(1); // Assuming status '1' is for 'Available'
        room.setDescription("A luxurious room with ocean view.");
        room.setIsActive(true);

        // Mock Hotel and TypeRoom data
        Hotel hotel = new Hotel();
        hotel.setId(1); // Assuming an existing hotel ID
        room.setHotel(hotel);

        TypeRoom typeRoom = new TypeRoom();
        typeRoom.setId(1); // Assuming an existing type ID
        room.setTypeRoom(typeRoom);

        // Try to insert the room using the RoomDAO
        boolean result = roomDAO.insertRoom(room);
        if (result) {
            System.out.println("Room has been added successfully.");
        } else {
            System.out.println("Failed to add room.");
        }
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
