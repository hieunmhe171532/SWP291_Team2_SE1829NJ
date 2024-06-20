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
import java.util.List;
import model.Account;

/**
 *
 * @author HUNG
 */
public class accountManagement extends HttpServlet {

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
  
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        try {
            HttpSession session = request.getSession(); 
            model.Account acc = (Account) session.getAttribute("acc");
            if (acc.getRole_id().equalsIgnoreCase("1")) {

//             
                AccountDAO udao = new AccountDAO();

                // Retrieve counts
                List<Account> Accounts = udao.getAllAccWithUser();

                // Retrieve booking details
                request.setAttribute("accountusers", Accounts);

                
//                     UserAccountDAO udao = new UserAccountDAO();
//
//                // Retrieve counts
//                List<UserAccount> Accounts = udao.getAllUserAccount();
//
//                // Retrieve booking details
//                request.setAttribute("accountusers", Accounts);
//                
                // Forward the request to the admin JSP page
                request.getRequestDispatcher("/admin/accountManager.jsp").forward(request, response);

            } else {
                response.sendRedirect("login");
            }
        } catch (ServletException | IOException e) {
            response.sendRedirect("404.jsp");
        }

    }

    public static void main(String[] args) {
  AccountDAO udao = new AccountDAO();

                // Retrieve counts
 
        
        
        
        
        
        
        
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
