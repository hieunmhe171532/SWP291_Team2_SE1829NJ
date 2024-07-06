package controller;

import dao.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String action = request.getParameter("action");
        
        if (action == null || action.isEmpty()) {
            action = "default";
        }

        if ("register".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String fullname = request.getParameter("fullname");
            String dobString = request.getParameter("dob");
            boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
            String address = request.getParameter("address");

            // Convert dobString to Date
            Date dob = null;
            try {
                dob = new SimpleDateFormat("yyyy-MM-dd").parse(dobString);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            // Validate form data (example, you can add more validations)
            if (username == null || password == null || phone == null || email == null || fullname == null || dob == null || address == null) {
                request.setAttribute("registrationError", "Please fill in all the required fields.");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
                return;
            }

            // Create the AccountDAO object
            AccountDAO accountDAO = new AccountDAO();

            // Call the register method
            accountDAO.register(username, password, phone, email, 5, true, fullname, dob, gender, address);

            // Redirect to a success page or login page
            response.sendRedirect("login");
        } else {
            request.setAttribute("registrationError", "Invalid action.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "RegisterController handles user registration";
    }
}
