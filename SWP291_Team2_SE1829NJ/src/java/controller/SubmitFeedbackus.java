package controller;

import dao.FeedbackusDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Feedbackus;

@WebServlet(name = "SubmitFeedbackus", urlPatterns = {"/submitFeedback"})
public class SubmitFeedbackus extends HttpServlet {

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Lấy tham số từ form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String feedbackContent = request.getParameter("feedback");
        
        // Tạo đối tượng Feedbackus
        Feedbackus feedback = new Feedbackus(name, email, feedbackContent);
        
        // Tạo thể hiện của FeedbackusDAO
        FeedbackusDAO feedbackDAO = new FeedbackusDAO();
        
        // Gửi phản hồi vào cơ sở dữ liệu
        boolean feedbackSubmitted = feedbackDAO.submitFeedback(feedback);
        
        // Chuẩn bị phản hồi
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Feedback Submitted</title>");            
            out.println("</head>");
            out.println("<body>");
            if (feedbackSubmitted) {
                out.println("<h1>Cảm ơn bạn đã gửi phản hồi!</h1>");
                // Hiển thị dữ liệu feedback đã gửi ở đây nếu cần
                out.println("<p>Tên: " + feedback.getName() + "</p>");
                out.println("<p>Email: " + feedback.getEmail() + "</p>");
                out.println("<p>Nội dung phản hồi: " + feedback.getMessage() + "</p>");
            } else {
                out.println("<h1>Cảm ơn bạn phản hồi cho chúng tôi.</h1>");
            }
            out.println("</body>");
            out.println("</html>");
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
        return "Handles feedback submission";
    }
}
