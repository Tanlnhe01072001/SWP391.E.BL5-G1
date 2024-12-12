/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import dal.billDAO;
import dal.categoryDAO;
import dal.productDAO;
import dal.userDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Bill;
import model.Category;
import model.User;

/**
 *
 * @author BOTMark
 */
@WebServlet(name = "Dashboard", urlPatterns = {"/dashboard"})
public class Dashboard extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

      
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("user?action=login");
                return;
            }
            if ((user.getIsAdmin() == null || !Boolean.parseBoolean(user.getIsAdmin()))
                    && (user.getIsStoreStaff() == null || !Boolean.parseBoolean(user.getIsStoreStaff()))) {    //Nếu ko phải admin và Store Staff
                //Role còn lại: Client
                response.sendRedirect("home");
                return;
            }
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("404.jsp");
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
    }// </editor-fold>

}
