<%-- 
    Document   : Checkout
    Created on : Dec 10, 2024, 1:59:37 AM
    Author     : BOTMark
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Checkout Page</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo/LOGO_FASHION_TOUR.png">

    <!-- CSS -->
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="assets/css/plugins.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

    <!-- Main Wrapper Start -->
    <!-- Offcanvas menu area start -->
    <div class="off_canvars_overlay"></div>
    <!-- Breadcrumbs area start -->
    <div class="breadcrumbs_area other_bread">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb_content">
                        <ul>
                            <li><a href="home">Trang chủ</a></li>
                            <li>/</li>
                            <li>Checkout</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumbs area end -->

    <!-- Checkout page section -->
    <div class="Checkout_section" id="accordion">
        <div class="container">
            <div class="checkout_form">
                <form action="checkout" method="POST">
                    <div class="row">
                        <div class="col-lg-5 col-md-5">
                            <h3>Chi tiết đơn hàng</h3>
                            <div class="row">
                                <div class="col-lg-12 mb-20">
                                    <label>Tên khách hàng<span>*</span></label>
                                    <input readonly="" value="${sessionScope.user.user_name}" type="text">
                                </div>
                                <div class="col-lg-12 mb-20">
                                    <label>Email <span>*</span></label>
                                    <input readonly="" value="${sessionScope.user.user_email}" type="text">
                                </div>
                                <div class="col-lg-12 mb-20">
                                    <label>Địa chỉ<span>*</span></label>
                                    <input required name="address" type="text">
                                </div>
                                <div class="col-lg-12 mb-20">
                                    <label>Số điện thoại<span>*</span></label>
                                    <input required name="phone" type="number">
                                </div>
                                <!-- Thêm trường mã giảm giá -->
                                <div class="col-lg-12 mb-20">
                                    <label>Mã giảm giá (nếu có)</label>
                                    <input name="coupon_code" type="text" value="${not empty param.coupon_code ? param.coupon_code : ''}">
                                    <c:if test="${not empty requestScope.couponError}">
                                        <p style="color: red;">${requestScope.couponError}</p>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7">
                            <h3>Sản phẩm</h3>
                            <div class="order_table table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Size</th>
                                            <th>Color</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="o" value="${sessionScope.cart}"/>
                                        <c:forEach items="${o.items}" var="i">
                                            <tr>
                                                <td> ${i.product.product_name} <strong> × ${i.quantity}</strong></td>
                                                <td> ${i.size}</td>
                                                <td> ${i.color}</td>
                                                <fmt:formatNumber value="${i.product.product_price * i.quantity}" minFractionDigits="0" maxFractionDigits="2" var="sessionScope_total_quantity"/>
                                                <td> ${sessionScope_total_quantity}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <c:if test="${sessionScope.cart != null}">
                                        <tfoot>
                                            <tr>
                                                <th>Tổng giá</th>
                                                <fmt:formatNumber value="${sessionScope.cart.totalMoney}" minFractionDigits="0" maxFractionDigits="2" var="sessionScope_total"/>
                                                <td>${sessionScope_total}</td>
                                            </tr>
                                            <tr class="order_total">
                                                <th>Tổng đơn</th>
                                                <fmt:formatNumber value="${sessionScope.cart.totalMoney * (1 - sessionScope.discountAmount)}" minFractionDigits="0" maxFractionDigits="2" var="sessionScope_total_after_discount"/>
                                                <td><strong>${sessionScope_total_after_discount}</strong></td>
                                            </tr>
                                        </tfoot>
                                    </c:if>
                                </table>
                            </div>
                            <div class="panel-default">
                                <input id="payment_cod" value="cod" name="payment_method" type="radio" />
                                <label for="payment_cod">COD(Thanh toán khi nhận hàng) <img src="assets/img/icon/COD.jpg" alt="" style="margin-left: 50px"></label>
                            </div>
                            <div class="order_button">
                                <button type="submit">Đặt hàng</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Checkout page section end -->


    <!-- JS -->
    <!-- Plugins JS -->
    <script src="assets/js/plugins.js"></script>
    <!-- Main JS -->
    <script src="assets/js/main.js"></script>
</body>

</html>
