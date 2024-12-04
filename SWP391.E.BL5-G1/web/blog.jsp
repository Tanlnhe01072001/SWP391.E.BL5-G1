

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Quản lý blog | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="admin/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <!--<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>-->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->
        
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


                </c:if>
            </ul>
        </aside>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="blogmanager"><b>Danh sách blog</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="blogmanager?action=insert" title="Thêm"><i class="fas fa-plus"></i>
                                        Tạo mới blog</a>
                                </div>
                            </div>


                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Ảnh bìa</th>
                                        <th>Tiêu đề</th>
                                        <th>Tóm tắt</th>
                                        <th>Ngày tạo</th>
                                        <th>Chỉnh sửa lần cuối</th>
                                        <th>Tạo bởi</th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${blogs}" var="blog" varStatus="loop">
                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td><img src="${blog.images}" width="60px" height="40px"/></td>
                                            <td>${blog.title}</td>
                                            <td>${blog.summary}</td>
                                            <td>${blog.created_at}</td>
                                            <td>${blog.updated_at}</td>
                                            <td>${blog.user.user_name}</td>
                                            <td>
                                                <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" value="${blog.blog_id}"><i
                                                        class="fas fa-trash-alt"></i>
                                                </button>
                                                <form action="blogmanager" method="POST">
                                                    <input type="hidden" name="action" value="update">
                                                    <input type="hidden" name="blog_id" value="${blog.blog_id}">
                                                    <button class="btn btn-primary btn-sm edit" type="submit" title="Sửa"><i class="fas fa-edit"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Essential javascripts for application to work-->
        <script src="admin/js/jquery-3.2.1.min.js"></script>
        <script src="admin/js/popper.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="admin/js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="admin/js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="admin/js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="admin/js/plugins/dataTables.bootstrap.min.js"></script>

        <script>
        $(document).ready(function () {
            $('#sampleTable').DataTable();

            // Event delegation for delete button
            jQuery(document).on("click", ".trash", function () {
                swal({
                    title: "Cảnh báo",
                    text: "Bạn có chắc chắn muốn xóa blog này?",
                    buttons: ["Hủy bỏ", "Đồng ý"],
                }).then((willDelete) => {
                    if (willDelete) {
                        var blogId = $(this).val();
                        window.location = "blogmanager?action=delete&blog_id=" + $(this).attr("value");
                        // Optionally show a success message after deletion
                        swal("Đã xóa thành công!", {
                            icon: "success",
                        });
                    }
                });
            });
        });

        </script>
    </body>
</html>
