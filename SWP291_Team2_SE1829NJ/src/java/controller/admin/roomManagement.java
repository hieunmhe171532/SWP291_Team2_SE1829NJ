/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.billDAO;
import DAO.productDAO;
import Entity.Bill;
import Entity.Category;

import Entity.Product;

import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * 
 */
public class ProductManagement extends HttpServlet {

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
        try {
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            Entity.User user = (User) session.getAttribute("user");
            if (user.getIsAdmin().equalsIgnoreCase("true")) {
                if (action.equalsIgnoreCase("allproduct") && action != null && !"".equals(action)) {

                    productDAO dao = new productDAO();
                    List<Product> allProduct = dao.getProduct();
                    int count = dao.countProduct();

                    int countproductlow = dao.CountProductLow();
           
                    List<Category> category = dao.getCategory();
                    request.setAttribute("CategoryData", category);
                    request.setAttribute("product", count);
                    request.setAttribute("allProduct", allProduct);
               
                    request.setAttribute("low", countproductlow);

                    request.getRequestDispatcher("/admin/productinsert.jsp").forward(request, response);

                }
                if (action.equalsIgnoreCase("insert")) {
                    productDAO c = new productDAO();
                    List<Category> category = c.getCategory();
                    request.setAttribute("CategoryData", category);
                    request.getRequestDispatcher("/admin/productinsert.jsp").forward(request, response);
                }

                if (action.equalsIgnoreCase("insertcategory")) {
                    String name = request.getParameter("name");
                    productDAO dao = new productDAO();
                    Entity.Category c = dao.getCategoryByName(name);
                    if (c != null) {
                        request.setAttribute("error", name + " already");
                        request.getRequestDispatcher("admin/productinsert.jsp").forward(request, response);
                    } else {
                        dao.insertCategory(name);
                        request.getRequestDispatcher("productmanager?action=insert").forward(request, response);

                    }
                }
                
                                if (action.equalsIgnoreCase("updateproduct")) {

//               String product_id = "MOU03";
//        String category_id = "2";
//        String product_name = "Mousepad steelseries";
//        String product_price = "600.00";
//        String product_size = "S, M, L";
//        String product_color = "Black";
//        String product_quantity = "10";
//        String product_img = "images/" + "MOU03.png";
//        String product_describe = "đế chống trượt, mặt control đỉnh cao của fps";
                    
                   String product_id = request.getParameter("product_id");
                   String category_id = request.getParameter("category_id");
                    String product_name = request.getParameter("product_name");
                   String product_price = request.getParameter("price");
       
                   
                    String product_quantity = request.getParameter("quality");
                   String product_img = "images/"+request.getParameter("product_img");
                  String product_describe = request.getParameter("describe");

                    int quantity = Integer.parseInt(product_quantity);
                    Float price = Float.valueOf(product_price);
                    int cid = Integer.parseInt(category_id);

                    // Creating necessary objects
                    productDAO dao = new productDAO();
                    Category cate = new Category(cid);

    




                    // Creating Product object and setting values
                    Product product = new Product();
                    product.setCate(cate);
                    product.setProduct_id(product_id);
                    product.setProduct_name(product_name);
                    product.setProduct_price(price);
                    product.setProduct_description(product_describe);
                    product.setQuantity(quantity);
                    product.setImg(product_img);
    
                    

                    // Inserting product using DAO
                    dao.updateProduct(product);

                    response.sendRedirect("ProductManagement?action=allproduct");
                }
                
                
                
                if (action.equalsIgnoreCase("insertproduct")) {

//               String product_id = "MOU03";
//        String category_id = "2";
//        String product_name = "Mousepad steelseries";
//        String product_price = "600.00";
//        String product_size = "S, M, L";
//        String product_color = "Black";
//        String product_quantity = "10";
//        String product_img = "images/" + "MOU03.png";
//        String product_describe = "đế chống trượt, mặt control đỉnh cao của fps";
                    
                   String product_id = request.getParameter("product_id");
                   String category_id = request.getParameter("category_id");
                    String product_name = request.getParameter("product_name");
                   String product_price = request.getParameter("price");

                    String product_quantity = request.getParameter("quality");
                   String product_img = "images/"+request.getParameter("product_img");
                  String product_describe = request.getParameter("describe");

                    int quantity = Integer.parseInt(product_quantity);
                    Float price = Float.valueOf(product_price);
                    int cid = Integer.parseInt(category_id);

                    // Creating necessary objects
                    productDAO dao = new productDAO();
                    Category cate = new Category(cid);

                    
                    // Creating Product object and setting values
                    Product product = new Product();
                    product.setCate(cate);
                    product.setProduct_id(product_id);
                    product.setProduct_name(product_name);
                    product.setProduct_price(price);
                    product.setProduct_description(product_describe);
                    product.setQuantity(quantity);
                    product.setImg(product_img);

                    

                    // Inserting product using DAO
                    dao.insertProduct(product);

                    response.sendRedirect("ProductManagement?action=allproduct");
                }

                if (action.equalsIgnoreCase("insert")) {
                    productDAO c = new productDAO();
                    List<Category> category = c.getCategory();
                    request.setAttribute("CategoryData", category);
                    request.getRequestDispatcher("/admin/productinsert.jsp").forward(request, response);
                }

                if (action.equals("deleteproduct")) {
                    String product_id = request.getParameter("product_id");
//                    int id = Integer.parseInt(product_id);
                    productDAO dao = new productDAO();
                    dao.ProductDelete(product_id);
                    response.sendRedirect("ProductManagement?action=allproduct");
                }
                  if (action.equalsIgnoreCase("insertprod")) {
        String product_id = "MOU03";
        String category_id = "2";
        String product_name = "Mousepad steelseries";
        String product_price = "600.00";
        String product_size = "S, M, L";
        String product_color = "Black";
        String product_quantity = "10";
        String product_img = "images/" + "MOU03.png";
        String product_describe = "đế chống trượt, mặt control đỉnh cao của fps";
//                        String product_id = request.getParameter("product_id");
//                        String category_id = request.getParameter("category_id");
//                        String product_name = request.getParameter("product_name");
//                        String product_price = request.getParameter("price");
//
//                        String product_quantity = request.getParameter("quality");
//                        String product_img = "images/" + request.getParameter("product_img");
//                        String product_describe = request.getParameter("describe");
                        int quality = Integer.parseInt(product_quantity);
                        Float price = Float.valueOf(product_price);
                        int cid = Integer.parseInt(category_id);
                        productDAO dao = new productDAO();
                        Category cate = new Category(cid);

                        // color
                        Product product = new Product();
                        product.setCate(cate);
                        product.setProduct_id(product_id);
                        product.setProduct_name(product_name);
                        product.setProduct_price(price);
                        product.setProduct_description(product_describe);
                        product.setQuantity(quality);
                        product.setImg(product_img);

                        dao.insertProduct(product);
                        response.sendRedirect("productmanager?action=allproduct");
                if (action.equals("createnew")) {
                  
                    }
                    response.sendRedirect("ProductManagement?action=allproduct");
                }

            } else {
                response.sendRedirect("login");
            }
        } catch (ServletException | IOException | NumberFormatException e) {

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
//    public static void main(String[] args) {
//        // Simulating request parameters
//        String product_id = "MOU03";
//        String category_id = "2";
//        String product_name = "Mousepad steelseries";
//        String product_price = "600.00";
//        String product_size = "S, M, L";
//        String product_color = "Black";
//        String product_quantity = "10";
//        String product_img = "images/" + "MOU03.png";
//        String product_describe = "đế chống trượt, mặt control đỉnh cao của fps";
//
//        // Parsing parameters
//        int quantity = Integer.parseInt(product_quantity);
//        Float price = Float.valueOf(product_price);
//        int cid = Integer.parseInt(category_id);
//
//        // Creating necessary objects
//        productDAO dao = new productDAO();
//        Category cate = new Category(cid);
//
//        // Splitting size and color values
//        String[] size_rw = product_size.split("\\s*,\\s*");
//        String[] color_rw = product_color.split("\\s*,\\s*");
//
//        // Creating arrays for size and color
//        int[] size = new int[size_rw.length];
//        int[] color = new int[color_rw.length];
//
//        // Creating Size objects and adding to list
//        List<Size> list = new ArrayList<>();
//        try {
//            for (int i = 0; i < size_rw.length; i++) {
//                Size s = new Size(product_id, size_rw[i]);
//                list.add(s);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        // Creating Color objects and adding to list
//        List<Color> list2 = new ArrayList<>();
//        try {
//            for (int i = 0; i < color_rw.length; i++) {
//                Color s1 = new Color(product_id, color_rw[i]);
//                list2.add(s1);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        // Creating Product object and setting values
//        Product product = new Product();
//        product.setCate(cate);
//        product.setProduct_id(product_id);
//        product.setProduct_name(product_name);
//        product.setProduct_price(price);
//        product.setProduct_description(product_describe);
//        product.setQuantity(quantity);
//        product.setImg(product_img);
//        product.setSize(list);
//        product.setColor(list2);
//
//        // Inserting product using DAO
//        dao.insertProduct(product);
//
//        // Redirecting to a page (simulation)
//        System.out.println("Product inserted successfully. Redirecting...");
//    }

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
