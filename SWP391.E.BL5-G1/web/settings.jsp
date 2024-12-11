<%-- 
    Document   : Settings
    Created on : Dec 11, 2024, 11:08:14 AM
    Author     : BOT Mark
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Setting | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/mainAdmin.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    </head>
    <body class="app sidebar-mini rtl">
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="dashboard"><i class='bx bx-log-out bx-rotate-180'></i> </a>

                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="admin/images/User.png" width="50px"
                                                alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>${sessionScope.user.user_name}</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="categorymanager"><i class='app-menu__icon bx bxs-category'></i><span class="app-menu__label">Quản lý danh mục</span></a></li>
                <li><a class="app-menu__item" href="productmanager"><i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a></li>
                <li><a class="app-menu__item" href="blogmanager"><i class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản lý blog</span></a></li>

                <!-- Conditionally Display Menu Items -->
                <c:if test="${sessionScope.user.isAdmin}">
                    <li><a class="app-menu__item" href="customermanager"><i class='app-menu__icon bx bx-user-voice'></i><span class="app-menu__label">Quản lý khách hàng</span></a></li>
                    <li><a class="app-menu__item" href="couponmanager"><i class='app-menu__icon bx bx-receipt'></i><span class="app-menu__label">Quản lý coupon</span></a></li>
                <li><a class="app-menu__item" href="reportmanager"><i class='app-menu__icon bx bx-receipt'></i><span class="app-menu__label">Quản lý phản hồi</span></a></li>
                <li><a class="app-menu__item" href="settings"><i class='app-menu__icon bx bx-receipt'></i><span class="app-menu__label">Cài đặt hệ thống</span></a></li>

                </c:if>
            </ul>
        </aside>
        <main class="app-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <!-- Button tạo mới -->
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a href="settings?action=backup" class="btn btn-primary btn-sm">
                                        <i class="fas fa-plus"></i> Lưu trữ dữ liệu
                                    </a>
                                    <a href="settings?action=restore" class="btn btn-primary btn-sm">
                                        <i class="fas fa-plus"></i> Khôi phục dữ liệu
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
