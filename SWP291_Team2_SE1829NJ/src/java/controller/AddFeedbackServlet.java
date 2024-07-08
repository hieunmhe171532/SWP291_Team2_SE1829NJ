/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.*;
import java.nio.file.*;
import java.util.List;
import model.Feedback;

@MultipartConfig()
/**
 *
 * @author admin
 */

public class AddFeedbackServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddFeedbackServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddFeedbackServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        PrintWriter out = response.getWriter();
        FeedbackDAO daof = new FeedbackDAO();
//        HttpSession session = request.getSession();
//        session.setAttribute("acc", acc);
        try {
            String id = request.getParameter("id");
            int rid = Integer.parseInt(id);
            String c = request.getParameter("comment");
            Part part = request.getPart("img");
            String filename = part.getSubmittedFileName();
            String path = "/Users/admin/web/Git/clon2/SWP391-Project/SWP291_Team2_SE1829NJ/web/bootstrap/images/" + filename;
            String datapath = "bootstrap/images/" + filename;

            int count = daof.totalComment();
            int endpage = count / 5;
            if (count % 5 != 0) {
                endpage++;
            }

            InputStream is = part.getInputStream();
            boolean succs = uploadFile(is, path);
            if (succs) {
                daof.insertFeedback(datapath, c, 8, rid);

            } else {
                daof.insertFeedback(null, c, 8, rid);

            }
            request.getRequestDispatcher("viewroom?rid=" + rid).forward(request, response);

        } catch (Exception e) {
        }
    }

    public boolean uploadFile(InputStream is, String path) {
        boolean test = false;
        try {
            byte[] byt = new byte[is.available()];
            is.read();
            FileOutputStream fops = new FileOutputStream(path);
            fops.write(byt);
            fops.flush();
            fops.close();

            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
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