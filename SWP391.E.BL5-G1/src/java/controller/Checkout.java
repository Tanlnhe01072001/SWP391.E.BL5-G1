/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.billDAO;
import dal.couponDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import model.CheckBill;

/**
 *
 * @author BOTMark
 */
@WebServlet(name = "Checkout", urlPatterns = {"/checkout"})
public class Checkout extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        try {
            HttpSession session = request.getSession(true);
            model.Cart cart = (model.Cart) session.getAttribute("cart");
            String paymentMethod = request.getParameter("payment_method");
            String couponCode = request.getParameter("coupon_code");

            model.User acc = (model.User) session.getAttribute("user");
            if (acc != null) {
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                String payment = paymentMethod.equals("vnpay") ? "VNPAY" : "COD";

                double discount = 0;
                boolean couponValid = true;

                if (couponCode != null && !couponCode.isEmpty()) {
                    couponDAO couponDAO = new couponDAO();
                    model.Coupon coupon = couponDAO.getCouponByCode(couponCode);

                    if (coupon == null) {
                        couponValid = false;
                        request.setAttribute("couponError", "Mã giảm giá không tồn tại.");
                    } else if (coupon.getEndDate().before(new java.util.Date())) {
                        couponValid = false;
                        request.setAttribute("couponError", "Mã giảm giá đã hết hạn.");
                    } else if (coupon.getUsageLimit() <= 0) {
                        couponValid = false;
                        request.setAttribute("couponError", "Mã giảm giá đã hết số lần sử dụng.");
                    } else {
                        if (paymentMethod.equals("vnpay")) {
                            discount = coupon.getDiscountAmount();
                            coupon.setUsageLimit(coupon.getUsageLimit() - 1);
                            couponDAO.updateCouponUsage(coupon);
                        } else {
                            couponValid = false;
                            request.setAttribute("couponError", "Mã giảm giá chỉ áp dụng cho thanh toán online.");
                        }
                    }
                }

                if (couponValid) {
                    double totalAmount = cart.getTotalMoney();
                    double discountedTotal = totalAmount * (1 - discount);

                    CheckBill bill = createBill(acc, cart, payment, address, phone);
                    bill.setTotalAmount(discountedTotal);
                    bill.setCouponCode(couponCode);

                    billDAO dao = new billDAO();
                    if (paymentMethod.equals("cod")) {
                        dao.addOrder(acc, cart, payment, address, Integer.parseInt(phone));
                        session.removeAttribute("cart");
                        session.setAttribute("size", 0);
                        request.getSession().setAttribute("orderSuccessMessage", "Đơn hàng của bạn đã được đặt thành công!");
                        response.sendRedirect("home");
                    } 
                } else {
                    request.getRequestDispatcher("checkout.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("user?action=login");
            }
        } catch (Exception e) {
            request.getRequestDispatcher("404.jsp").forward(request, response);
        }
    }

    private CheckBill createBill(model.User u, model.Cart c, String pay, String add, String phone) {
        CheckBill bill = new CheckBill();
        bill.setUser(u);
        bill.setCart(c);
        bill.setPayment(pay);
        bill.setAddress(add);
        bill.setPhone(phone);
        return bill;
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Object u = session.getAttribute("user");
        if (u != null) {
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else {
            response.sendRedirect("user?action=login");
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
