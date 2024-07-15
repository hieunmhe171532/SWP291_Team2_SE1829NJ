/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Room;
import model.TypeRoom;

/**
 *
 * @author HUNG
 */
public class ListRoomForCus extends HttpServlet {
   
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
        String action = request.getParameter("action");
        RoomDAO roomDAO = new RoomDAO();
        List<TypeRoom> typeRooms = roomDAO.getTypeRooms();
        List<Room> roomList = null;
        int page, numperpage = 9;

        if (action == null || action.equalsIgnoreCase("all")) {
            roomList = roomDAO.getAllRoomsWithStatusOne();
        } else if (action.equalsIgnoreCase("listByCategory")) {
            String typeRoomId = request.getParameter("typeRoom_id");
            int typeRoomIdInt = Integer.parseInt(typeRoomId);
            roomList = roomDAO.getRoomsByType(typeRoomIdInt);
        } else if (action.equalsIgnoreCase("filterByFloor")) {
            String roomFloor = request.getParameter("room_floor");
            roomList = roomDAO.getRoomsByFloor(roomFloor);
        } else if (action.equalsIgnoreCase("sort")) {
            String type = request.getParameter("type");
            if (type.equals("low")) {
                roomList = roomDAO.getRoomLowCost();
            } else if (type.equals("high")) {
                roomList = roomDAO.getRoomHighCost();
            }
        }

        int size = roomList.size();
        int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage)) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start = (page - 1) * numperpage;
        int end = Math.min(page * numperpage, size);
        List<Room> rooms = roomDAO.getListByPage(roomList, start, end);

        List<String> floorList = roomDAO.getAllFloors();
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("TypeRoomData", typeRooms);
        request.setAttribute("RoomData", rooms);
        request.setAttribute("floorList", floorList);
        request.getRequestDispatcher("listAllRooms.jsp").forward(request, response);
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
