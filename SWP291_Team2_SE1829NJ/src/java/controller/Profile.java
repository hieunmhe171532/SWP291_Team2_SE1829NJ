package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.UserAccount;
import dao.AccountDAO;
import dao.UserAccountDAO;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Profile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accountIdStr = request.getParameter("account_id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String isActiveStr = request.getParameter("is_active");
        String fullname = request.getParameter("fullname");
        String dobStr = request.getParameter("dob");
        String genderStr = request.getParameter("gender");
        String address = request.getParameter("address");
        String isDeleteStr = request.getParameter("is_delete");

        int accountId = Integer.parseInt(accountIdStr);
        boolean isActive = Boolean.parseBoolean(isActiveStr);
        boolean gender = Boolean.parseBoolean(genderStr);
        boolean isDelete = Boolean.parseBoolean(isDeleteStr);

        Date dob = null;
        try {
            dob = new SimpleDateFormat("yyyy-MM-dd").parse(dobStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Account account = new Account(accountId, username, password, phone, email, role, isActive, null, null);
        UserAccount userAccount = new UserAccount(0, accountId, fullname, dob, gender, address, isDelete);

        AccountDAO accountDAO = new AccountDAO();
        UserAccountDAO userAccountDAO = new UserAccountDAO();

        boolean updateSuccessful = accountDAO.updateAccount(account);
        boolean userUpdateSuccessful = userAccountDAO.updateUserAccount(userAccount);

        try (PrintWriter out = response.getWriter()) {
            if (updateSuccessful && userUpdateSuccessful) {
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Profile Servlet";
    }
}
