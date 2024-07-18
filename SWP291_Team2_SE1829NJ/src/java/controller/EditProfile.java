/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import controller.acc.accEdit;
import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author HUNG
 */
public class EditProfile extends HttpServlet {

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
        // Retrieve the account and user details and set them as request attributes
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");

        if (acc != null) {
            AccountDAO accountDAO = new AccountDAO();
            Account fullAccount = accountDAO.getAllAccWithUserByUseName(acc.getUsername());

            request.setAttribute("Account", fullAccount);
            request.getRequestDispatcher("/profile.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            model.Account acc = (model.Account) session.getAttribute("acc");

            if (acc != null) {
                // Retrieve form data
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                int role = Integer.parseInt(request.getParameter("role")); // Assuming role is stored as integer in DB
                boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
                String fullname = request.getParameter("fullname");
                java.sql.Date dob = java.sql.Date.valueOf(request.getParameter("dob")); // Conversion to Date
                boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
                String address = request.getParameter("address");

                // Create an AccountDAO instance and call the method to create an account
                AccountDAO accountDAO = new AccountDAO();

                accountDAO.updateAccountAndUser(username, password, phone, email, role, isActive, fullname, dob, gender, address, gender);

                response.sendRedirect("editprofile");
            } else {
                response.sendRedirect("login");
            }
        } catch (IOException e) {
            response.sendRedirect("404.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(accEdit.class.getName()).log(Level.SEVERE, null, ex);
        }

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
