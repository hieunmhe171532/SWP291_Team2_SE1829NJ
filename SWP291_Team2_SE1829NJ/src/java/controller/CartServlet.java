package controller;


import dao.RoomDAO;
import model.BookingItem;
import model.Cart;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Room;

/**
 *
 * @author HUNG
 */
public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("add")) {
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }

            String roomIdStr = request.getParameter("room_id");
            String startDateStr = request.getParameter("start_date");
            String endDateStr = request.getParameter("end_date");
            String quantityStr = request.getParameter("quantity");

            try {
                int roomId = Integer.parseInt(roomIdStr);
                LocalDate startDate = LocalDate.parse(startDateStr);
                LocalDate endDate = LocalDate.parse(endDateStr);
                int quantity = Integer.parseInt(quantityStr);

                RoomDAO roomDAO = new RoomDAO();
                Room room = roomDAO.getRoomByRid(roomId);

                BookingItem bookingItem = new BookingItem(room, startDate, endDate, quantity);
                cart.addBookingItem(bookingItem);

                session.setAttribute("cart", cart);
                session.setAttribute("total", cart.getTotalCost());
                session.setAttribute("size", cart.getItems().size());
                response.sendRedirect("viewroom?rid=" + roomId);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (action.equalsIgnoreCase("showcart")) {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }

        if (action.equalsIgnoreCase("delete")) {
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }

            String roomIdStr = request.getParameter("room_id");
            String startDateStr = request.getParameter("start_date");
            String endDateStr = request.getParameter("end_date");

            try {
                int roomId = Integer.parseInt(roomIdStr);
                LocalDate startDate = LocalDate.parse(startDateStr);
                LocalDate endDate = LocalDate.parse(endDateStr);

                cart.removeBookingItem(roomId, startDate, endDate);

                session.setAttribute("cart", cart);
                session.setAttribute("total", cart.getTotalCost());
                session.setAttribute("size", cart.getItems().size());
                response.sendRedirect("cart.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

//    
//    public static void main(String[] args) {
//        // Create instances of the necessary objects
//        CartServlet servlet = new CartServlet();
////  HttpSession session = request.getSession(true);
//    Cart cart = (Cart) session.getAttribute("cart");
//            if (cart == null) {
//                cart = new Cart();
//            }
//        // Set up the request parameters
// 
//            String roomIdStr = request.getParameter("room_id");
//            String startDateStr = request.getParameter("start_date");
//            String endDateStr = request.getParameter("end_date");
//            String quantityStr = request.getParameter("quantity");
//
//            try {
//                int roomId = Integer.parseInt(roomIdStr);
//                LocalDate startDate = LocalDate.parse(startDateStr);
//                LocalDate endDate = LocalDate.parse(endDateStr);
//                int quantity = Integer.parseInt(quantityStr);
//
//                RoomDAO roomDAO = new RoomDAO();
//                Room room = roomDAO.getRoomByRid(roomId);
//
//                BookingItem bookingItem = new BookingItem(room, startDate, endDate, quantity);
//                cart.addBookingItem(bookingItem);
//        // Mock the RoomDAO to return a test Room object
//   
//
//    
//        // Verify the results
//        Cart cart = (Cart) session.getAttribute("cart");
//        System.out.println("Total cost: " + cart.getTotalCost());
//        System.out.println("Cart size: " + cart.getItems().size());
//    }
//            
//            
//    }

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
        return "Short description";
    }
}
