package controller;

import dao.BillDAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 * Servlet implementation class ViewOrder
 * Author: HUNG
 */
public class ViewOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Retrieve user ID from session
        HttpSession session = request.getSession();
        
        
        Account acc = (Account) session.getAttribute("acc");
        
        
            BillDAO dao = new BillDAO();
        
            int userId = dao.getUserIdByAccountUsername(acc.getUsername());
      
        
        
        
        // Fetch orders for the user
        BillDAO billDAO = new BillDAO();
        List<Map<String, Object>> orderList = billDAO.getBookingSummaryByUserId(userId);
        
        // Format dates
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm:ss.SSS dd-MM-yyyy");
        
                SimpleDateFormat inputFormatDate = new SimpleDateFormat("yyyy-MM-dd");
  SimpleDateFormat outputFormatDate = new SimpleDateFormat("dd-MM-yyyy");
        
        List<Map<String, Object>> formattedOrderList = new ArrayList<>();
        
        for (Map<String, Object> order : orderList) {
            Map<String, Object> formattedOrder = new HashMap<>(order);
            try {
               formattedOrder.put("daycreate", formatDate(order.get("daycreate").toString(), inputFormat, outputFormat));
                formattedOrder.put("startdate", formatDate(order.get("startdate").toString(), inputFormatDate, outputFormatDate));
                formattedOrder.put("endate", formatDate(order.get("endate").toString(), inputFormatDate, outputFormatDate));
            } catch (Exception e) {
                e.printStackTrace();
            }
            formattedOrderList.add(formattedOrder);
        }
        
        // Set order list in request scope
        request.setAttribute("orderList", formattedOrderList);
        
        // Forward to JSP
        request.getRequestDispatcher("viewListOrder.jsp").forward(request, response);
    }
       private String formatDate(String dateStr, SimpleDateFormat inputFormat, SimpleDateFormat outputFormat) throws Exception {
        return outputFormat.format(inputFormat.parse(dateStr));
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
        return "Servlet to view orders";
    }
}