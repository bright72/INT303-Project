/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FLR.controller;

import FLR.model.Account;
import FLR.model.Product;
import FLR.model.ShoppingCart;
import FLR.model.controller.ProductJpaController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author Dell
 */
public class AddToCartServlet extends HttpServlet {

    @PersistenceUnit(unitName = "FarmLungRunPU")
    EntityManagerFactory emf;

    @Resource
    UserTransaction utx;

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
        HttpSession session = request.getSession(true);
        String page = request.getParameter("page");
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("cart", cart);
        }
        String productCode = request.getParameter("productCode"); //ดักมาจาก request
        String quantity = request.getParameter("quantity");

        ProductJpaController pjc = new ProductJpaController(utx, emf);
        Product product = pjc.findProduct(productCode); //เอา product code ไปหา product
        for (int i = 0; i < Integer.parseInt(quantity); i++) {
            cart.add(product);
        }
        //getServletContext().getRequestDispatcher("/ProductList").forward(request, response);
        if (page.equals("shop")) {
          response.sendRedirect("Shop");  
        } else if (page.equals("vegetable")){
            response.sendRedirect("Shop?catagories=vegetable");
        } else if (page.equals("fruit")){
            response.sendRedirect("Shop?catagories=fruit");
        } else if (page.equals("meat")){
            response.sendRedirect("Shop?catagories=meat");
        } else if (page.equals("Dairy Product")){
            response.sendRedirect("Shop?catagories=Dairy Product");
        } else if (page.equals("egg")){
            response.sendRedirect("Shop?catagories=egg");
        } else if (page.equals("mushroom")){
            response.sendRedirect("Shop?catagories=mushroom");
        } else if (page.equals("all")){
            response.sendRedirect("Shop");
        } else if (page.equals("cart")){
            response.sendRedirect("Cart");
        } else {
            response.sendRedirect("Product?productCode="+page);
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
