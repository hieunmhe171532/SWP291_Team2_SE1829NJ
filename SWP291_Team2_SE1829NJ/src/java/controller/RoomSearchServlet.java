/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RoomDAO;
import dao.TypeRoomDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Room;
import model.TypeRoom;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
//@WebServlet(name = "RoomSearchServlet", urlPatterns = {"/searchRooms"})
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
@WebServlet(name = "RoomSearchServlet", urlPatterns = {"/searchRooms"})
public class RoomSearchServlet extends HttpServlet {
    
    private static final Logger logger = Logger.getLogger(RoomSearchServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TypeRoomDAO typeRoomDAO = new TypeRoomDAO();
        List<TypeRoom> typeRooms = typeRoomDAO.listAllTypeRooms();
        for(TypeRoom t : typeRooms){
            logger.info(t.toString());
        }
        
        String userQuantity = request.getParameter("userQuantity");
        String priceRange = request.getParameter("priceRange");
        String typeRoomIdStr = request.getParameter("typeRoomId");
        Integer typeRoomId = null;

        logger.info(userQuantity + " " + priceRange + " " + typeRoomIdStr);
        
        try {
            if (typeRoomIdStr != null && !typeRoomIdStr.trim().isEmpty()) {
                typeRoomId = Integer.valueOf(typeRoomIdStr);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID loại phòng không hợp lệ.");
            request.getRequestDispatcher("rooms.jsp").forward(request, response);
            return;
        }

        RoomDAO roomDAO = new RoomDAO();
        List<Room> rooms = roomDAO.getAllByParam(userQuantity, priceRange, typeRoomId);

        if (rooms.isEmpty()) {
            request.setAttribute("message", "Không tìm thấy phòng nào phù hợp.");
        }

        logger.info("Số lượng phòng tìm thấy: " + rooms.size());
        request.setAttribute("rooms", rooms);
        request.setAttribute("typeRooms", typeRooms);
        request.getRequestDispatcher("rooms.jsp").forward(request, response);
    }
}
