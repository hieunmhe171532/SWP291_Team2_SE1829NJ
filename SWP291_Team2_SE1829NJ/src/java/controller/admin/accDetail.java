/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

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
public class accDetail extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    try {
        HttpSession session = request.getSession(); 
        model.Account acc = (Account) session.getAttribute("acc");
        
        // Kiểm tra vai trò của người dùng (ví dụ: admin là role_id = 1)
        if (acc.getRole_id().equalsIgnoreCase("1")) {
            // Lấy username từ request parameter
            String username = request.getParameter("username");
            
            // Sử dụng AccountDAO để lấy thông tin chi tiết của tài khoản theo username
            AccountDAO udao = new AccountDAO();
            Account acc1 = udao.getAnAccountByUsername(username);

            // Đặt thuộc tính vào request để truyền sang accountDetail.jsp
            request.setAttribute("acc1", acc1);

            // Chuyển hướng (forward) request đến trang accountDetail.jsp
            request.getRequestDispatcher("/admin/accountDetail.jsp").forward(request, response);
        } else {
            // Nếu không phải admin, chuyển hướng đến trang login
            response.sendRedirect("login");
        }
    } catch (ServletException | IOException e) {
        response.sendRedirect("404.jsp");
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
