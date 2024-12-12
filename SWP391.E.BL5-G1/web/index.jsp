<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="vi">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Trang Chủ</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">



        <!-- Chart.js Library -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


        <style>
            .product_thumb {
                position: relative;
                overflow: hidden;
                aspect-ratio: 1 / 1;
            }

            .product_thumb img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                object-position: center;
            }

            .single_product {
                margin-bottom: 20px;
            }
            a, a:hover, a:focus {
                text-decoration: none;
            }

            .product_content h3 a,
            .banner_content a,
            .slider_content a {
                text-decoration: none;
            }
        </style>
    </head>

    <body>
        <!-- Main Wrapper Start -->
        <!--Offcanvas menu area start-->
        <c:if test="${not empty sessionScope.orderSuccessMessage}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${sessionScope.orderSuccessMessage}
                <a href="user?action=myaccount" class="alert-link">Kiểm tra lịch sử đặt hàng của bạn tại đây.</a>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <c:remove var="orderSuccessMessage" scope="session"/>
        </c:if>
        <div class="off_canvars_overlay"></div>

        <jsp:include page="menu.jsp"/>

        <!--slider area start-->
        <div class="slider_area slider_style home_three_slider owl-carousel">
            <div class="slider_area slider_style home_three_slider owl-carousel">
                <div class="single_slider" style="background-image: url('assets/img/slider/anhbia1.jpg'); background-size: cover; background-position: center; height: 100vh;">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-12">
                                <div class="slider_content content_one" style="text-align: center;">
                                <br />
                                    <a style="margin-top: 470px; display: inline-block; text-decoration: none; background: #000; color: #fff; padding: 10px 20px; border-radius: 5px;" href="product">
                                        Khám Phá Ngay
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="product_section womens_product bottom">
            <div class="container">
                <div class="row">   
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Sản phẩm của chúng tôi</h2>
                            <p>Sản phẩm dành cho bạn</p>
                        </div>
                    </div> 
                </div>    
                <div class="product_area"> 
                    <div class="row">
                        <div class="product_carousel product_three_column4 owl-carousel">
                            <c:forEach items="${top10}" var="top10">
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a class="primary_img" href="search?action=productdetail&product_id=${top10.product_id}"><img src="${top10.img}" width="10px;" alt=""></a>
                                            <div class="quick_button">
                                                <a href="search?action=productdetail&product_id=${top10.product_id}" title="quick_view">Xem sản phẩm</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <fmt:formatNumber value="${top10.product_price}" minFractionDigits="0" maxFractionDigits="2" var="formattedPrice"/>
                                            <h3><a href="search?action=productdetail&product_id=${top10.product_id}">${top10.product_name}</a></h3>
                                            <span class="current_price">${formattedPrice} VND</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="product_section womens_product bottom">
            <div class="container">
                <div class="row">   
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Sản phẩm thịnh hành</h2>
                            <p>Sản phẩm ấn tượng và bán chạy nhất</p>
                        </div>
                    </div> 
                </div>    
                <div class="product_area"> 
                    <div class="row">
                        <div class="product_carousel product_three_column4 owl-carousel">
                            <c:forEach items="${topTrend}" var="td">
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a class="primary_img" href="search?action=productdetail&product_id=${td.product_id}"><img src="${td.img}" width="10px;" alt=""></a>
                                            <div class="quick_button">
                                                <a href="search?action=productdetail&product_id=${td.product_id}" title="quick_view">Xem sản phẩm</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <fmt:formatNumber value="${td.product_price}" minFractionDigits="0" maxFractionDigits="2" var="td_product_price"/>
                                            <h3><a href="search?action=productdetail&product_id=${td.product_id}">${td.product_name}</a></h3>
                                            <span class="current_price">${td_product_price} VND</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="banner_section banner_section_three">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-lg-6 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="product"><img src="assets/img/bg/16.jpg" alt="#"></a>
                                <div class="banner_content">                                  
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="product"><img src="assets/img/bg/17.jpg" alt="#"></a>
                                <div class="banner_content">                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="elfsight-app-94027198-7458-4351-8ca9-9bf86706a713" data-elfsight-app-lazy></div>


        <section class="product_section womens_product bottom">
            <div class="container">
                <div class="row">   
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Sản phẩm mới</h2>
                            <p>Sản phẩm thời trang mới</p>
                        </div>
                    </div> 
                </div>    
                <div class="product_area"> 
                    <div class="row">
                        <div class="product_carousel product_three_column4 owl-carousel">
                            <c:forEach items="${newProducts}" var="newProducts">
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a class="primary_img" href="search?action=productdetail&product_id=${newProducts.product_id}"><img src="${newProducts.img}" width="10px;" alt=""></a>
                                            <div class="quick_button">
                                                <a href="search?action=productdetail&product_id=${newProducts.product_id}" title="quick_view">Xem sản phẩm</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <fmt:formatNumber value="${newProducts.product_price}" minFractionDigits="0" maxFractionDigits="2" var="newProducts_product_price"/>


                                            <h3><a href="search?action=productdetail&product_id=${newProducts.product_id}">${newProducts.product_name}</a></h3>
                                            <span class="current_price">${newProducts_product_price} VND</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="elfsight-app-94027198-7458-4351-8ca9-9bf86706a713" data-elfsight-app-lazy></div>

        <jsp:include page="footer.jsp"/>
        <!--footer area end-->
        <!-- JS
        ============================================ -->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            function showNotification(message, isSuccess) {
                Swal.fire({
                    title: isSuccess ? 'Thành công!' : 'Lỗi!',
                    text: message,
                    icon: isSuccess ? 'success' : 'error',
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                });
            }

            // Kiểm tra và hiển thị thông báo khi trang được tải
            document.addEventListener('DOMContentLoaded', function () {
                var loginMessage = "${sessionScope.loginMessage}";
                var logoutMessage = "${sessionScope.logoutMessage}";
                var errorMessage = "${sessionScope.errorMessage}";

                if (loginMessage) {
                    showNotification(loginMessage, true);
            <% session.removeAttribute("loginMessage"); %>
                }
                if (logoutMessage) {

                    showNotification(logoutMessage, true);
            <% session.removeAttribute("logoutMessage"); %>
                } else if (errorMessage) {
                    showNotification(errorMessage, false);
            <% session.removeAttribute("errorMessage"); %>
                }
            });
        </script>
    </body>

</html>
