package controller;

import dao.AccountDAO;
import dao.BillDAO;
import dao.RoomDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bill;
import model.Cart;
import model.Account;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import model.Booking;
import model.BookingItem;
import model.Room;

public class CheckoutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // Lấy session
        HttpSession session = request.getSession(true);

        // Lấy giá trị từ session
        Cart cart = (Cart) session.getAttribute("cart");
        Account acc = (Account) session.getAttribute("acc");

        if (cart == null || acc == null) {
            response.sendRedirect("homepage");
            return;
        }

        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String paymentMethod = request.getParameter("payment_method");

        try {
            BillDAO dao = new BillDAO();
            String payment = "COD".equals(paymentMethod) ? "COD" : paymentMethod.toUpperCase();

            int userId = dao.getUserIdByAccountUsername(acc.getUsername());
            if (userId == -1) {
                throw new Exception("User ID not found for username: " + acc.getUsername());
            }

            Bill bill = createBill(userId, acc.getEmail(), phone, address, cart, payment);
           dao.addBill(bill);
//            
  
int bill_id = dao.getLastBillId();


       dao.addBooking(cart, userId, bill_id);

  
  
            session.removeAttribute("cart");
            session.setAttribute("size", 0);

            response.sendRedirect("homepage");
        } catch (Exception e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("404.jsp").forward(request, response);
        }
    }

    
    
    public static void main(String[] args) {
        // Database connection parameters
 
     
         
        
    }

    
    private static Bill createBill(int userId, String email, String phone, String address, Cart cart, String payment) {
        Bill bill = new Bill();
        bill.setDiscount(0); // Add logic for discount if needed
        bill.setPaymentDate(new Date());
        bill.setPaymentMode(false);
        bill.setPaymentMethod(payment);
        bill.setTotal((float) cart.getTotalCost());
        bill.setBooking_id(userId);
        bill.setPhone(phone);
        bill.setEmail(email);
        bill.setAddress(address);
        bill.setCreateAt(new Date());
        bill.setUpdateAt(new Date());
        bill.setDeleteAt(null);
        bill.setIsDelete(false);
        return bill;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Object u = session.getAttribute("acc");
        if (u != null) {
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else {
            response.sendRedirect("user?action=login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
