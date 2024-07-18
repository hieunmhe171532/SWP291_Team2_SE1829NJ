package controller.dashboard;

import dao.BillDAO;
import dao.BlogDAO;
import dao.MenuDAO;
import dao.RoomDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Booking;
import model.Room;

public class Dashboard extends HttpServlet {

    private BillDAO bidao;

    @Override
    public void init() throws ServletException {
        bidao = new BillDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("acc");
            if (acc != null && acc.getRole_id().equalsIgnoreCase("1")) {

                UserDAO udao = new UserDAO();
                BlogDAO bldao = new BlogDAO();
                MenuDAO mdao = new MenuDAO();
                RoomDAO rdao = new RoomDAO();

                // Retrieve counts
                int countUser = udao.countUsers();
                int countBill = bidao.countBill();
                int countBlog = bldao.countBlog();
                int countFood = mdao.countFood();
                int countRoom = rdao.countRoom();
                int countReparingRoom = rdao.countRepairingRoom();
                int countEmptyRoom = rdao.countEmptyRoom();
                int countBookingRoom = rdao.countBookingRoom();
                int countUsingRoom = rdao.countUsingRoom();

                // Set attributes in the request scope
                request.setAttribute("totalUser", countUser);
                request.setAttribute("totalBill", countBill);
                request.setAttribute("totalBlog", countBlog);
                request.setAttribute("totalFood", countFood);
                request.setAttribute("totalRoom", countRoom);
                request.setAttribute("reRoom", countReparingRoom);
                request.setAttribute("emRoom", countEmptyRoom);
                request.setAttribute("boRoom", countBookingRoom);
                request.setAttribute("usRoom", countUsingRoom);

                // Retrieve booking details
                List<Map<String, Object>> bookingsToday = bidao.getAllBillsToday();
                List<Map<String, Object>> allBookings = bidao.getAllBills();

                List<Map<String, Object>> bookingsGroupToday = bidao.getAllBillsTodayGroup();
                List<Map<String, Object>> allBookingsGroup = bidao.getAllBillsGroup();
                
                request.setAttribute("bookingsTodayGroup", bookingsGroupToday);
                request.setAttribute("allBookingsGroup", allBookingsGroup);
 
                
                request.setAttribute("bookingsToday", bookingsToday);
                request.setAttribute("allBookings", allBookings);
                // Forward the request to the admin JSP page
                request.getRequestDispatcher("/admin/admin.jsp").forward(request, response);
                
                
                
                
                
                
                
            } else {
                response.sendRedirect("login");
            }
        } catch (ServletException | IOException e) {
            response.sendRedirect("404.jsp");
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
        int billId = Integer.parseInt(request.getParameter("billId"));
        boolean newPaymentMode = Boolean.parseBoolean(request.getParameter("newPaymentMode"));
 
        bidao.updatePaymentModeByUserId(billId, newPaymentMode);

        response.sendRedirect("dashboard"); // Redirect back to the dashboard
    }

 @Override
    public String getServletInfo() {
        return "Dashboard servlet";
    }

    private static class Gson {

        public Gson() {
        }

        private String toJson(Map<String, List<Booking>> of) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }
    }
}
