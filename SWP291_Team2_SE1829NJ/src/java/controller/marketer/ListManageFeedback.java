/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketer;

import dao.AccountDAO;
import dao.FeedbackDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Count;
import model.Feedback;

/**
 *
 * @author admin
 */
public class ListManageFeedback extends HttpServlet {

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
        FeedbackDAO daof = new FeedbackDAO();
        UserDAO daou = new UserDAO();
        AccountDAO daoa=new AccountDAO();
        String indexP = request.getParameter("index");
        String search = request.getParameter("search");
        if (indexP == null) {
            indexP = "1";
        }
        int index = Integer.parseInt(indexP);

        int totalAccount = daoa.countAcc();
        int totalAccComment = daoa.totalAccComment();
        int totalComment = daof.totalComment();
        int totalSearch = daof.totalCommentSearch(search);
        int endpage;

        List<Feedback> listp;
        if (search == null) {
            endpage = totalComment / 5;
            if (totalComment % 5 != 0) {
                endpage++;
            }
            listp = daof.pagingFeedback(index);
        } else {
            endpage = totalSearch / 5;
            if (totalSearch % 5 != 0) {
                endpage++;
            }
            listp = daof.pagingFeedbackSearch(index, search);
        }
        List<Feedback> listf = daof.getAllFeedback();
        List<Count> listaf = daof.topAccountFeedback();
        List<Count> listgf=daoa.genderFeedback();

        request.setAttribute("listp", listp);
        request.setAttribute("endP", endpage);
        request.setAttribute("tag", index);
        request.setAttribute("search", search);
        request.setAttribute("listgf", listgf);

        request.setAttribute("listf", listf);
        request.setAttribute("totalAcc", totalAccount);
        request.setAttribute("totalAccComment", totalAccComment);
        request.setAttribute("totalComment", totalComment);
        request.setAttribute("listaf", listaf);
        request.getRequestDispatcher("managerfeedback.jsp").forward(request, response);

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
        return "Short description";
    }// </editor-fold>

}