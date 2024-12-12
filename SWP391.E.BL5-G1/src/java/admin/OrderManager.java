/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import dal.billDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Bill;
import model.BillDetail;
import model.User;

/**
 *
 * @author BOTMark
 */
@WebServlet(name = "OrderManager", urlPatterns = {"/ordermanager"})
public class OrderManager extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("user?action=login");
        return;
    }

    if ((user.getIsAdmin() == null || !Boolean.parseBoolean(user.getIsAdmin())) 
     && (user.getIsStoreStaff() == null || !Boolean.parseBoolean(user.getIsStoreStaff()))) {
        response.sendRedirect("home");
        return;
    }

    String page = "order.jsp";
    String action = request.getParameter("action");
    billDAO dao = new billDAO();

    if (action == null) {
        String paymentFilter = request.getParameter("paymentFilter");
        List<Bill> bill = dao.getBillInfo(paymentFilter);
        request.setAttribute("bill", bill);
        page = "order.jsp";

    } else if (action.equals("showdetail")) {
        String bill_id = request.getParameter("bill_id");
        int id = Integer.parseInt(bill_id);
        List<BillDetail> detail = dao.getDetail(id);
        request.setAttribute("detail", detail);
        page = "orderdetail.jsp";
    }

    RequestDispatcher dd = request.getRequestDispatcher(page);
    dd.forward(request, response);
       
       
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
