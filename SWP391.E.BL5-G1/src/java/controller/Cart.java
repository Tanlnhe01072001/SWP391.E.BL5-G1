/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.productDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Item;


/**
 *
 * @author BOTMark
 */
@WebServlet(name = "Cart", urlPatterns = {"/cart"})
public class Cart extends HttpServlet {

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
        String action = request.getParameter("action");
        model.User user = (model.User) session.getAttribute("user");
        if (user != null && ("TRUE".equalsIgnoreCase(user.getIsAdmin()) || "TRUE".equalsIgnoreCase(user.getIsStoreStaff()))) {
            session.setAttribute("errorMessage", "Quản trị viên và nhân viên cửa hàng không thể thêm hoặc mua sản phẩm.");
            request.getRequestDispatcher("search?action=productdetail&product_id=" + request.getParameter("product_id")).forward(request, response);
            return;
        }
        model.Cart cart = null;
        Object o = session.getAttribute("cart");

        if (o != null) {
            cart = (model.Cart) o;
        } else {
            cart = new model.Cart();
        }
        if (action == null || action.equalsIgnoreCase("addtocart")) {
            addToCart(request, cart);
            List<Item> list = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("total", cart.getTotalMoney());
            session.setAttribute("size", list.size());
            session.setAttribute("successMessageAdd", "Sản phẩm đã được thêm vào giỏ hàng thành công.");
            request.getRequestDispatcher("search?action=productdetail&product_id=" + request.getParameter("product_id")).forward(request, response);
        } else if (action.equalsIgnoreCase("buynow")) {
            addToCart(request, cart);
            List<Item> list = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("total", cart.getTotalMoney());
            session.setAttribute("size", list.size());
            response.sendRedirect("cart?action=showcart");
        } else if (action.equalsIgnoreCase("showcart")) {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else if (action.equals("deletecart")) {
            String product_id = request.getParameter("product_id");
            cart.removeItem(product_id);
            List<Item> list = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("total", cart.getTotalMoney());
            session.setAttribute("size", list.size());
            session.setAttribute("successMessageDelete", "Sản phẩm đã được xóa khỏi giỏ hàng thành công");
            response.sendRedirect("cart.jsp");
        } else if (action.equalsIgnoreCase("update")) {
            String productId = request.getParameter("product_id");
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            cart.updateQuantity(productId, quantity);
            session.setAttribute("cart", cart);
            double total = cart.getTotalMoney();
            session.setAttribute("total", total);

            // Trả về JSON response
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"total\":" + total + "}");
            return;
        }
    }

    private void addToCart(HttpServletRequest request, model.Cart cart) {
        String Squantity = request.getParameter("quantity");
        String product_id = request.getParameter("product_id");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        try {
            int quantity = Integer.parseInt(Squantity);
            productDAO pdao = new productDAO();
            model.Product product = pdao.getProductByID(product_id);
            Item item = new Item(product, quantity, size, color);
            cart.addItem(item);
        } catch (Exception e) {
            e.printStackTrace();
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