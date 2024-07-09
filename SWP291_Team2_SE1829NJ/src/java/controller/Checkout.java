package Controller;

import dao.BillDAO;
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

public class Checkout extends HttpServlet {

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
            processPayment(request, response, session, acc, cart, address, phone, paymentMethod);
        } catch (Exception e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("404.jsp").forward(request, response);
        }
    }

   protected  void processPayment(HttpServletRequest request, HttpServletResponse response, HttpSession session, Account acc, Cart cart, String address, String phone, String paymentMethod) throws Exception {
        BillDAO dao = new BillDAO();
        String payment = "COD".equals(paymentMethod) ? "COD" : paymentMethod.toUpperCase();
        int phonenumber = Integer.parseInt(phone);

        int userId = dao.getUserIdByAccountUsername(acc.getUsername());
        if (userId == -1) {
            throw new Exception("User ID not found for username: " + acc.getUsername());
        }

        Bill bill = createBill(userId, cart, payment, address, phonenumber);
        dao.addBill(bill);

        session.removeAttribute("cart");
        session.setAttribute("size", 0);

        response.sendRedirect("home");
    }

  protected  Bill createBill(int userId, Cart cart, String payment, String address, int phone) {
        Bill bill = new Bill();
        bill.setDiscount(0); // Add logic for discount if needed
        bill.setPaymentDate(new Date());
        bill.setPaymentMode("COD".equals(payment));
        bill.setTotal((float) cart.getTotalCost());
        bill.setBooking_id(userId);
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
