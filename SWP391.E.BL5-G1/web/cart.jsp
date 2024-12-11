<%-- 
    Document   : cart
    Created on : Dec 5, 2024, 8:33:32 AM
    Author     : BOTMark
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Giỏ hàng</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <!-- CSS 
        ========================= -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .breadcrumbs_area {
            background-color: #e9ecef;
            padding: 20px 0;
        }

        .breadcrumb_content ul {
            list-style: none;
            padding: 0;
            display: flex;
        }

        .breadcrumb_content ul li {
            margin-right: 10px;
            font-size: 16px;
        }

        .breadcrumb_content ul li a {
            color: #007bff;
            text-decoration: none;
        }

        .breadcrumb_content ul li a:hover {
            text-decoration: underline;
        }

        .shopping_cart_area {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .table_desc {
            margin-top: 20px;
        }

        .cart_page table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        .cart_page table th,
        .cart_page table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .cart_page table th {
            background-color: #f8f9fa;
            color: #333;
            font-weight: 600;
        }

        .cart_page table td {
            vertical-align: middle;
        }

        .cart_page table .product_thumb img {
            max-width: 80px;
            border-radius: 5px;
        }

        .cart_page table .product_remove a {
            color: #ff4d4f;
            font-size: 18px;
            text-decoration: none;
        }

        .cart_page table .product_remove a:hover {
            color: #ff1a1a;
        }

        .cart_page table .product_name a {
            color: #333;
            font-weight: 600;
            text-decoration: none;
        }

        .cart_page table .product_name a:hover {
            text-decoration: underline;
        }

        .cart_page table .product-price,
        .cart_page table .product_total {
            font-weight: 600;
        }

        .cart_page table input[type="number"] {
            width: 60px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .cart_page .cart_submit button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .cart_page .cart_submit button:hover {
            background-color: #0056b3;
        }

        .empty-cart img {
            width: 200px;
            margin-bottom: 20px;
        }

        .empty-cart p {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .empty-cart .button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
        }

        .empty-cart .button:hover {
            background-color: #0056b3;
        }

        .coupon_area {
            margin-top: 30px;
        }

        .coupon_code h3 {
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: 700;
            color: #333;
        }

        .coupon_inner {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
        }

        .cart_subtotal {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 18px;
        }

        .cart_subtotal p {
            margin: 0;
            color: #333;
        }

        .checkout_btn a {
            display: inline-block;
            background-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
        }

        .checkout_btn a:hover {
            background-color: #218838;
        }

        .empty-cart {
            text-align: center;
            padding: 50px 0;
        }

        .empty-cart img {
            width: 150px;
            margin-bottom: 20px;
        }

        .empty-cart p {
            font-size: 20px;
            color: #333;
        }
    </style>
    <body>

        <!-- Main Wrapper Start -->
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">Trang chủ</a></li>
                                <li>/</li>
                                <li>Giỏ hàng</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->
        <!-- shopping cart area start -->
        <div class="shopping_cart_area">
            <div class="container">  
                <c:choose>
                    <c:when test="${empty sessionScope.cart.items}">
                        <div class="empty-cart">
                            <img src="assets/img/logo/no-products-found.jpg" alt="Không có sản phẩm trong giỏ hàng">
                            <p>Không có sản phẩm nào trong giỏ hàng</p>
                            <a href="product" class="button">MUA NGAY</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="row">
                            <div class="col-12">
                                <div class="table_desc">
                                    <div class="cart_page table-responsive">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th class="product_remove">Xóa</th>
                                                    <th class="product_thumb">Ảnh</th>
                                                    <th class="product_name">Sản phẩm</th>
                                                    <th class="product-price">Giá</th>
                                                    <th class="product_quantity">Kích thước</th>
                                                    <th class="product-price">Màu</th>
                                                    <th class="product_quantity">Số lượng</th>
                                                    <th class="product_total">Tổng tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="o" value="${sessionScope.cart}" />
                                                <c:forEach items="${o.items}" var="i">
                                                    <tr>
                                                        <td class="product_remove"><a href="cart?action=deletecart&product_id=${i.product.product_id}">Delete</a></td>
                                                        <td class="product_thumb"><a href="product?action=productdetail&product_id=${i.product.product_id}"><img src="${i.product.img}" alt=""></a></td>
                                                        <td class="product_name"><a href="product?action=productdetail&product_id=${i.product.product_id}">${i.product.product_name}</a></td>
                                                         <fmt:formatNumber value="${i.product.product_price}" minFractionDigits="0" maxFractionDigits="2" var="i_product_product_price"/>
                                                        <td class="product-price">${i_product_product_price}</td>
                                                        <td class="product-price">${i.size}</td>
                                                        <td class="product-price">${i.color}</td>
                                                        <td class="product_quantity">
                                                            <input name="quantity" min="1" max="100" value="${i.quantity}" type="number" 
                                                                   onchange="updateQuantity('${i.product.product_id}', this.value, ${i.product.product_price})">
                                                        </td>
                                                        <fmt:formatNumber value="${i.product.product_price * i.quantity}" minFractionDigits="0" maxFractionDigits="2" var="i_product_product_price_quantity"/>
                                                        <td class="product_total" id="total_${i.product.product_id}">
                                                            ${i_product_product_price_quantity} VNĐ
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                        <!-- <div class="cart_submit">
                                            <button type="submit">update cart</button>
                                        </div> -->
                                    </div>
                                </div>
                            </div>
                            <!-- Coupon code area start -->
                            <c:if test="${sessionScope.cart != null}">
                                <div class="coupon_area">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                            <div class="coupon_code right">
                                                <h3>Hóa đơn</h3>
                                                <div class="coupon_inner">
                                                    <div class="cart_subtotal">
                                                        <p>Tổng đơn hàng</p>
                                                        <fmt:formatNumber value="${sessionScope.total}" minFractionDigits="0" maxFractionDigits="2" var="sessionScope_total"/>
                                                        <p class="cart_amount" id="subtotal">${sessionScope_total} VNĐ</p>
                                                    </div>
                                                    <div class="cart_subtotal ">
                                                        <p>Phí vận chuyển </p>
                                                        <p class="cart_amount" id="shipping">0 VNĐ</p>
                                                    </div>
                                                    <div class="cart_subtotal">
                                                        <p>Tổng tiền</p>
                                                        <fmt:formatNumber value="${sessionScope.total + 0}" minFractionDigits="0" maxFractionDigits="2" var="sessionScope_total_0"/>
                                                        <p class="cart_amount" id="total">${sessionScope_total_0} VNĐ</p>
                                                    </div>
                                                    <div class="checkout_btn">
                                                        <a href="checkout">Thanh toán</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <!-- Coupon code area end -->
                        </c:otherwise>
                    </c:choose>
                    <!--coupon code area end-->
                    </form> 
                </div>     
            </div>
            <!-- shopping cart area end -->

            <!-- JS
            ============================================ -->
            <!--map js code here-->
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdWLY_Y6FL7QGW5vcO3zajUEsrKfQPNzI"></script>
            <script  src="https://www.google.com/jsapi"></script>
            <script src="assets/js/map.js"></script>
            <!-- Plugins JS -->
            <script src="assets/js/plugins.js"></script>
            <!-- Main JS -->
            <script src="assets/js/main.js"></script>
            
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script>
                                           function updateQuantity(productId, newQuantity, price) {
                                               // Cập nhật tổng tiền cho sản phẩm
                                               var newTotal = newQuantity * price;
                                               $('#total_' + productId).text(newTotal.toLocaleString() + ' VNĐ');

                                               // Gửi yêu cầu AJAX để cập nhật server
                                               $.ajax({
                                                   url: 'cart',
                                                   type: 'POST',
                                                   data: {
                                                       action: 'update',
                                                       product_id: productId,
                                                       quantity: newQuantity
                                                   },
                                                   success: function (response) {
                                                       // Cập nhật tổng tiền giỏ hàng
                                                       $('#total_amount').text(response.total.toLocaleString() + ' VNĐ');
                                                   },
                                                   error: function () {
                                                       alert('Có lỗi xảy ra khi cập nhật giỏ hàng');
                                                   }
                                               });
                                           }
            </script><script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script>
                               let cartTotal = ${sessionScope.total}; // Lưu tổng tiền ban đầu

                               function updateQuantity(productId, newQuantity, price) {
                                   // Cập nhật tổng tiền cho sản phẩm
                                   var newTotal = newQuantity * price;
                                   $('#total_' + productId).text(newTotal.toLocaleString() + ' VNĐ');

                                   // Gửi yêu cầu AJAX để cập nhật server
                                   $.ajax({
                                       url: 'cart',
                                       type: 'POST',
                                       data: {
                                           action: 'update',
                                           product_id: productId,
                                           quantity: newQuantity
                                       },
                                       success: function (response) {
                                           // Cập nhật tổng tiền giỏ hàng
                                           cartTotal = response.total;
                                           updateInvoice();
                                       },
                                       error: function () {
                                           alert('Có lỗi xảy ra khi cập nhật giỏ hàng');
                                       }
                                   });
                               }

                               function updateInvoice() {
                                   // Cập nhật tổng đơn hàng
                                   $('#subtotal').text(cartTotal.toLocaleString() + ' VNĐ');

                                   // Cập nhật tổng tiền (giả sử phí vận chuyển là 0)
                                   $('#total').text(cartTotal.toLocaleString() + ' VNĐ');

                                   // Cập nhật tổng tiền ở phần trên của giỏ hàng nếu có
                                   $('#total_amount').text(cartTotal.toLocaleString() + ' VNĐ');
                               }
            </script>
    </body>
</html>