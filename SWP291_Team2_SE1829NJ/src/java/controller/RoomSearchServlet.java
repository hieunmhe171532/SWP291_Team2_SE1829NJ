package controller;

import dao.RoomDAO;
import dao.TypeRoomDAO;
import model.Room;
import model.TypeRoom;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

<<<<<<< Updated upstream
/**
 *
 * @author ADMIN
 */
//@WebServlet(name = "RoomSearchServlet", urlPatterns = {"/client/searchRooms"})
//public class RoomSearchServlet extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        // Fetch all type rooms
//        TypeRoomDAO typeRoomDAO = new TypeRoomDAO();
//        List<TypeRoom> typeRooms = typeRoomDAO.listAllTypeRooms();
////        System.out.println(typeRooms.size());
//        // Set type rooms as request attribute
//        for(TypeRoom t : typeRooms){
//            System.out.println(t);
//        }
//        
//        
//        String userQuantity = request.getParameter("userQuantity");
//        String priceRange = request.getParameter("priceRange");
//        String typeRoomIdStr = request.getParameter("typeRoomId");
//        Integer typeRoomId = null;
//
//        System.out.println(userQuantity +" "+ priceRange +" "+ typeRoomIdStr);
//        // Convert typeRoomId to Integer if it's not null or empty
//        if (typeRoomIdStr != null && !typeRoomIdStr.trim().isEmpty()) {
//            typeRoomId = Integer.valueOf(typeRoomIdStr);
//        }
//
//        // Call the DAO method
//        RoomDAO roomDAO = new RoomDAO();
//        List<Room> rooms = roomDAO.getAllByParam(userQuantity, priceRange, typeRoomId);
//
//        // Fetch all type rooms again to re-populate the dropdown
//       
//
//        // Set the rooms and type rooms as request attributes
//        System.out.println(rooms.size());
//        request.setAttribute("rooms", rooms);
//        request.setAttribute("typeRooms", typeRooms);
//        // Forward to the search form JSP
//        request.getRequestDispatcher("rooms.jsp").forward(request, response);
//    }
//
//   
//}
@WebServlet(name = "RoomSearchServlet", urlPatterns = {"/client/searchRooms"})
=======
@WebServlet(name = "RoomSearchServlet", urlPatterns = {"/searchRooms"})
>>>>>>> Stashed changes
public class RoomSearchServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(RoomSearchServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch all type rooms
            TypeRoomDAO typeRoomDAO = new TypeRoomDAO();
            List<TypeRoom> typeRooms = typeRoomDAO.listAllTypeRooms();
            typeRooms.forEach(typeRoom -> logger.info(typeRoom.toString()));

            // Get parameters
            String userQuantity = request.getParameter("userQuantity");
            String priceRange = request.getParameter("priceRange");
            String typeRoomIdStr = request.getParameter("typeRoomId");

            // Log parameters
            logger.info(String.format("Search parameters - userQuantity: %s, priceRange: %s, typeRoomId: %s", 
                                      userQuantity, priceRange, typeRoomIdStr));

            // Convert typeRoomId to Integer if not null or empty
            Integer typeRoomId = null;
            if (typeRoomIdStr != null && !typeRoomIdStr.trim().isEmpty()) {
                typeRoomId = Integer.valueOf(typeRoomIdStr);
            }

            // Fetch rooms based on parameters
            RoomDAO roomDAO = new RoomDAO();
            List<Room> rooms = roomDAO.getAllByParam(userQuantity, priceRange, typeRoomId);

            // Check if rooms are found
            if (rooms.isEmpty()) {
                request.setAttribute("message", "No matching rooms found.");
            }

            // Log the number of rooms found
            logger.info(String.format("Number of rooms found: %d", rooms.size()));

            // Set attributes and forward to JSP
            request.setAttribute("rooms", rooms);
            request.setAttribute("typeRooms", typeRooms);
            request.getRequestDispatcher("rooms.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            // Handle invalid typeRoomId format
            logger.log(Level.SEVERE, "Invalid typeRoomId format", e);
            request.setAttribute("error", "Invalid room type ID.");
            request.getRequestDispatcher("rooms.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            // Handle any other exceptions
            logger.log(Level.SEVERE, "An unexpected error occurred", e);
            request.setAttribute("error", "An error occurred while searching for rooms.");
            request.getRequestDispatcher("rooms.jsp").forward(request, response);
        }
    }
}
