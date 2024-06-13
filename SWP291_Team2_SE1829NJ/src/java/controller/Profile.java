package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account; // Assuming there's an Account model class
import dao.AccountDAO; // Assuming there's a DAO class for database operations

/**
 *
 * @author Linh
 */
public class Profile extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

        // Get parameters from the request
        String accountId = request.getParameter("accountId");
        String accountName = request.getParameter("account_name");
        String customerName = request.getParameter("customer_name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");

        // Create an Account object with the new details
        Account account = new Account();
        account.setAccountId(accountId);
        account.setAccountName(accountName);
        account.setCustomer_name(customerName);
        account.setPhone(phone);
        account.setAddress(address);
        account.setEmail(email);
        account.setName(name);
        account.setDob(dob);
        account.setGender(Integer.parseInt(gender));

        // Update the account details in the database using AccountDAO
        AccountDAO accountDAO = new AccountDAO();
        boolean updateSuccessful = accountDAO.updateAccount(account);

        try (PrintWriter out = response.getWriter()) {
            if (updateSuccessful) {
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Profile Updated</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Profile updated successfully!</h1>");
                out.println("</body>");
                out.println("</html>");
            } else {
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Profile Update Failed</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Failed to update profile.</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        }
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
        return "Profile Servlet";
    }// </editor-fold>
}
