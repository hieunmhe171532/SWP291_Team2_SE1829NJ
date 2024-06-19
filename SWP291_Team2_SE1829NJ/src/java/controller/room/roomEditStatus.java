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

/**
 *
 * @author HUNG
 */
public class roomEditStatus extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

      response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    HttpSession session = request.getSession();
    model.Account acc = (model.Account) session.getAttribute("acc");

    if (acc != null && acc.getRole_id().equalsIgnoreCase("1")) { // Ensure admin role
       
    try {
        int roomId = Integer.parseInt(request.getParameter("id"));
        int statusId = Integer.parseInt(request.getParameter("status_id"));

        RoomDAO roomDAO = new RoomDAO();
        boolean success = roomDAO.updateRoomStatus(roomId, statusId);

        if (success) {
            // Redirect or notify of success
            response.sendRedirect("roommanagement"); // Redirect to the list showing the update
        } else {
            // Handle failure
            request.setAttribute("errorMessage", "Unable to update room status.");
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        }
    } catch (NumberFormatException e) {
        // Handle parsing errors
        request.setAttribute("errorMessage", "Invalid room ID or status.");
        request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
    } catch (Exception e) {
        // General error handling
        request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
        request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
    }
    } else {
        response.sendRedirect("login");
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
