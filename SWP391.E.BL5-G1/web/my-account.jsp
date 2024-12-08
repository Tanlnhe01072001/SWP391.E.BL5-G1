<%-- 
    Document   : my-account
    Created on : Dec 4, 2024, 8:57:44 PM
    Author     : Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Tài Khoản Của Tôi</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
        <style>
            body {
                background-color: #f4f7f6;
                color: #333;
                font-family: 'Roboto', sans-serif;
            }

            .account_dashboard {
                background-color: #ffffff;
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                padding: 30px;
                margin-top: 50px;
            }

            .dashboard_tab_button ul {
                background-color: #f8f9fa;
                border-radius: 10px;
                overflow: hidden;
            }

            .dashboard_tab_button ul li {
                margin-bottom: 10px;
            }

            .dashboard_tab_button ul li a {
                color: #ffffff;
                padding: 15px 20px;
                transition: all 0.3s ease;
                border-radius: 8px;
                display: block;
                background-color: black;
            }

            .dashboard_tab_button ul li a:hover,
            .dashboard_tab_button ul li a.active {
                background-color: #ff6a28;
                color: #ffffff;
                transform: translateX(5px);
            }

            .tab-content {
                background-color: #ffffff;
                border-radius: 15px;
                padding: 30px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            }

            .table {
                border-collapse: separate;
                border-spacing: 0 15px;
            }

            .table thead th {
                background-color: #007bff;
                color: #ffffff;
                border: none;
                padding: 15px;
                font-weight: 500;
            }

            .table tbody tr {
                background-color: #ffffff;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
                transition: all 0.3s ease;
            }

            .table tbody tr:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }

            .table td {
                border: none;
                padding: 20px 15px;
                vertical-align: middle;
            }

            .view {
                color: #007bff;
                text-decoration: none;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .view:hover {
                color: #0056b3;
                text-decoration: underline;
            }

            .account_login_form input {
                border: 2px solid #e9ecef;
                border-radius: 8px;
                padding: 15px;
                margin-bottom: 20px;
                transition: all 0.3s ease;
            }

            .account_login_form input:focus {
                border-color: orange;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }

            .account_login_form button {
                background-color: black;
                color: #ffffff;
                border: none;
                padding: 15px 30px;
                border-radius: 8px;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .account_login_form button:hover {
                background-color: #ff6a28;
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(0, 123, 255, 0.3);
            }

            h3 {
                color: #007bff;
                margin-bottom: 30px;
                font-weight: 700;
            }

            .success {
                color: #28a745;
                font-weight: 500;
            }
        </style>
    </head>

    <body>

        <!-- Main Wrapper Start -->
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay">

        </div>
        <jsp:include page="menu.jsp"/>
        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">home</a></li>
                                <li>/</li>
                                <li>my account</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->

        <!-- my account start  -->
        <section class="main_content_area">
            <div class="container">   
                <div class="account_dashboard">
                    <div class="row">
                        <div class="col-sm-12 col-md-3 col-lg-3">
                            <!-- Nav tabs -->
                            <div class="dashboard_tab_button">
                                <ul role="tablist" class="nav flex-column dashboard-list">
                                    <li><a href="#account-details" data-toggle="tab" class="nav-link">Tài khoản của tôi</a></li>
                                    <li><a href="#" data-toggle="tab" class="nav-link">Xem BST</a></li>
                                    <li><a href="#edit-profile" data-toggle="tab" class="nav-link">Chỉnh sửa hồ sơ</a></li>
                                    <li><a href="#password" data-toggle="tab" class="nav-link">Đổi mật khẩu</a></li>
                                    <li><a href="user?action=logout" class="nav-link">Đăng xuất</a></li>
                                </ul>
                            </div>  
                        </div>
                        <div class="col-sm-12 col-md-9 col-lg-9">
                            <!-- Tab panes -->
                            <div class="tab-content dashboard_content">
                                <div class="tab-pane fade" id="orders">
                                    <h3>Đơn hàng</h3>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Ngày khởi tạo</th>
                                                    <th>Hình thức GD</th>
                                                    <th>Địa chỉ</th>
                                                    <th>Tổng đơn</th>
                                                    <th>Actions</th>	 	 	 	
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${bill}" var="b">
                                                    <tr>
                                                        <td>${b.bill_id}</td>
                                                        <td>${b.date}</td>
                                                        <td><span class="success">${b.payment}</span></td>
                                                        <td>${b.address}</td>
                                                        <td><fmt:formatNumber value="${b.total}" minFractionDigits="0" maxFractionDigits="2" var="b_total"/>
                                                        <span class="current_price">${b_total} VND</span></td>
                                                        
                                                        <td><a href="user?action=showdetail&bill_id=${b.bill_id}" class="view">view</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade show active" id="account-details">
                                    <h3>Tài khoản của tôi </h3>
                                    <div class="login">
                                        <div class="login_form_container">
                                            <div class="account_login_form">
                                                <form action="user?action=updateinfo" method="POST">
                                                    <label><b>Tên người dùng</b></label>
                                                    <input type="text" name="user_name" value="${sessionScope.user.user_name}" placeholder="Nhập tên người dùng" readonly="">
                                                    <label><b>Email</b></label>
                                                    <input type="text" readonly name="user_email"  value="${sessionScope.user.user_email}" readonly="">
                                                    <!--                                                    <label><b>Mật khẩu</b></label>
                                                                                                        <input type="password" name="user_pass" value="${sessionScope.user.user_pass}" placeholder="Nhập mật khẩu A-Z 0-9">-->

                                                    <label><b>Ngày sinh</b></label>
                                                    <input type="Date" name="dateOfBirth" value="${sessionScope.user.dateOfBirth}" placeholder="Nhập ngày sinh(ngày/tháng/năm)" readonly="">

                                                    <label><b>Địa chỉ</b></label>
                                                    <input type="text" name="address" value="${sessionScope.user.address}" placeholder="Nhập địa chỉ (Xã,Huyện,Tỉnh)" readonly="">
                                                    <label><b>Số điện thoại</b></label>
                                                    <input type="number" name="phoneNumber" value="${sessionScope.user.phoneNumber}" placeholder="Nhập số điện thoại (10 số)" readonly="">
                                                    <div class="cart_submit">
                                                        <!--                                                        <button type="submit">Lưu</button>-->
                                                    </div> 
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="password">
                                    <h3>Đổi mật khẩu</h3>
                                    <div class="login">
                                        <div class="login_form_container">
                                            <div class="account_login_form">
                                                <form action="user?action=updatepassword" method="POST">
                                                    <label><b>Mật khẩu hiện tại</b></label>
                                                    <input type="password" name="current_password" placeholder="Nhập mật khẩu hiện tại">
                                                    <label><b>Mật khẩu mới</b></label>
                                                    <input type="password" name="new_password" placeholder="Nhập mật khẩu mới (A-Z, 0-9)">
                                                    <label><b>Xác nhận mật khẩu mới</b></label>
                                                    <input type="password" name="confirm_new_password" placeholder="Nhập lại mật khẩu mới">
                                                    <div class="cart_submit">
                                                        <button type="submit">Đổi mật khẩu</button>
                                                    </div> 
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="edit-profile">
                                    <h3>Chỉnh sửa hồ sơ</h3>
                                    <div class="login">
                                        <div class="login_form_container">
                                            <div class="account_login_form">
                                                <form action="user?action=updateinfo" method="POST">
                                                    <label><b>Tên người dùng</b></label>
                                                    <input type="text" name="user_name" value="${sessionScope.user.user_name}" placeholder="Nhập tên người dùng">
                                                    <label><b>Email</b></label>
                                                    <input type="text" readonly name="user_email" value="${sessionScope.user.user_email}">
                                                    <label><b>Ngày sinh</b></label>
                                                    <input type="Date" name="dateOfBirth" value="${sessionScope.user.dateOfBirth}" placeholder="Nhập ngày sinh(ngày/tháng/năm)">
                                                    <label><b>Địa chỉ</b></label>
                                                    <input type="text" name="address" value="${sessionScope.user.address}" placeholder="Nhập địa chỉ (Xã,Huyện,Tỉnh)">
                                                    <label><b>Số điện thoại</b></label>
                                                    <input type="number" name="phoneNumber" value="${sessionScope.user.phoneNumber}" placeholder="Nhập số điện thoại (10 số)">
                                                    <div class="cart_submit">
                                                        <button type="submit">Lưu thay đổi</button>
                                                    </div> 
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>        	
        </section>			
        <!-- my account end   --> 
        <!--footer area start-->
        <jsp:include page="footer.jsp"/>

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
                    timer: 3000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                });
            }

            // Kiểm tra và hiển thị thông báo khi trang được tải
            document.addEventListener('DOMContentLoaded', function () {
                var error_dob = "${sessionScope.error_dob}";
                var error_pass = "${sessionScope.error_pass}";
                var updateMessage = "${sessionScope.updateMessage}";
                if (error_dob) {
                    showNotification(error_dob, false);
            <% session.removeAttribute("error_dob"); %>
                }
                if (updateMessage) {
                    showNotification(updateMessage, true);
            <% session.removeAttribute("updateMessage"); %>
                } else if (error_pass) {

                    showNotification(error_pass, false);
            <% session.removeAttribute("error_pass"); %>
                }
            });
        </script>
    </body>
</html>
