/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.acc;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;

/**
 *
 * @author HUNG
 */
public class accCreate extends HttpServlet {
   
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

  request.getRequestDispatcher("/admin/accountCreate.jsp").forward(request, response);
    
    
    
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
          try (PrintWriter out = response.getWriter()) {
        HttpSession session = request.getSession(); 
        model.Account acc = (model.Account) session.getAttribute("acc");

        if (acc != null && acc.getRole_id().equalsIgnoreCase("1")) {
            // Retrieve form data
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            int role = Integer.parseInt(request.getParameter("role")); // Assuming role is stored as integer in DB
            boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
            String fullname = request.getParameter("fullname");
            Date dob = Date.valueOf(request.getParameter("dob")); // Conversion to Date
            boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
            String address = request.getParameter("address");

            // Create an AccountDAO instance and call the method to create an account
            AccountDAO accountDAO = new AccountDAO();
            try {
                accountDAO.createAccountWithUser(username, password, phone, email, role, isActive, fullname, dob, gender, address);
                out.println("<html><body>");
                out.println("<h2>Account successfully created for: " + username + "</h2>");
                out.println("<a href='login.jsp'>Login Now</a>");
                out.println("</body></html>");
            } catch (Exception e) {
                out.println("<html><body>");
                out.println("<h2>Error creating account for: " + username + "</h2>");
                out.println("<p>Error details: " + e.getMessage() + "</p>");
                out.println("<a href='createAccount.jsp'>Try Again</a>");
                out.println("</body></html>");
            }

            request.getRequestDispatcher("accountmanagement").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    } catch (ServletException | IOException e) {
        response.sendRedirect("404.jsp");
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