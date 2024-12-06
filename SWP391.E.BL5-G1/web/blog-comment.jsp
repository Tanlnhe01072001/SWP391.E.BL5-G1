<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sản Phẩm  | 2001Store</title>
        <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link rel="stylesheet" href="assets/css/style.css">


    </head>
    <body>
        <%--<jsp:include page="layout/menu.jsp"/>--%>
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>


        <div class="container my-5">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-white">
                    <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Cửa hàng</li>
                </ol>
            </nav>


            <div class="row">
                <div class="col-lg-12" style="margin-top:1rem">
                    <c:forEach items="${BlogData}" var="p">
                        <h1 style="text-align: left">
                            ${p.title}

                        </h1>
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <p class="mb-0">Lượt xem Blog (1000)</p>
                            <div class="dropdown">
                                <!-- <c:if test="${sessionScope.user.isAdmin}">
                                    <button type="button" data-toggle="modal" data-target="#ModalUpdate${blogId}" class="btn btn-save"  title="Thêm">
                                        <i class="fas fa-edit"></i>Chỉnh sửa nội dung Blog</button>
                                </c:if>-->
                                <div class="modal fade" id="ModalUpdate${blogId}" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-body" style="padding:0.5rem 1rem">
                                                <form id="contact-form2" action="blog?action=addBlog" method="POST">
                                                    <input type="hidden" name="action" value="addBlog">
                                                    <div class="row">   
                                                        <div class="form-group col-md-12">
                                                            <span class="thong-tin-thanh-toan">
                                                                <h4>Thêm mới chủ đề</h4>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="padding: 0.5rem 1rem; width:100%">
                                                        <input style="font-weight: bolder" name="user_id" readonly type="text" hidden="true">
                                                        <input style="font-weight: bolder" name="blog_id" readonly type="text" hidden="true" value="${blogId}">
                                                        Tiêu đề Blog:
                                                        <input style="font-weight: bolder; margin-bottom: 10px" name="title"  type="text">
                                                        Tóm tắt chung:
                                                        <textarea  style="margin-top: 10px; width:100%" rows="4" cols="50" name="summary" type="text"></textarea>
                                                        Nội dung:
                                                        <textarea  style="margin-top: 10px; width:100%" rows="4" cols="50" name="content" type="text"></textarea>
                                                        <input style="font-weight: bolder" name="blog_img" readonly type="text" hidden="true">
                                                    </div>
                                                    <div style="margin-top: 10px; text-align: center">
                                                        <button class="btn btn-save" style="background-color: green; color:white" type="submit">Gửi</button>
                                                        <a class="btn btn-cancel" style="background-color: red; color:white"  data-dismiss="modal">Hủy bỏ</a>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div style="border: 0.5px solid; margin-bottom: 30px">
                                <div class="card-body">
                                    <p class="card-text product-price">${p.content}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </div>
                <c:if test="${not empty CommentData}">
                    <div>
                        <h4 style="text-align: left">Thảo luận đề tài:</h4>
                        <c:forEach items="${CommentData}" var="c">
                            <div style="width: 100%;margin-top: 10px;">
                                <h5 class="card-title product-title ${c.userId == idUser ? 'boldTitle' : ''}">Người dùng #${c.userId}</h5>
                            </div>
                            <div class="col-md-9 mb-9" style="display: flex; border: 0.5px solid; border-radius: 5px;">


                                <div class="card-body" style="width: 80%; color: black">
                                    <p class="card-text product-price">${c.commentText}</p>
                                </div>
                                <c:if test="${c.userId == idUser}">
                                    <div style="width:9%; text-align: right; display: flex;">
                                        <button class="btn" style="max-height: 30px" type="button" data-toggle="modal" data-target="#ModalEditComment${c.userId}" class="edit-icon" title="Chỉnh sửa">
                                            <i class="fas fa-edit"></i></button>
                                        <a href="blog-comment?action=deleteBlogComment&blog_id=${c.blogId}&comment_id=${c.commentId}" class="btn"><i class="fas fa-trash"></i></a>

                                    </div>
                                    <div class="modal fade" id="ModalEditComment${c.userId}" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body" style="padding:0.5rem 1rem">
                                                    <form id="contact-form2" action="blog-comment?action=updateBlogComment" method="POST">
                                                        <input type="hidden" name="action" value="addBlog">
                                                        <div class="row">   
                                                            <div class="form-group col-md-12">
                                                                <span class="thong-tin-thanh-toan">
                                                                    <h4 style="color: black">Chỉnh sửa nội dung</h4>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="padding: 0.5rem 1rem; width:100%">
                                                            <input style="font-weight: bolder" name="comment_id" readonly type="text" hidden="true" value="${c.commentId}">
                                                            <input style="font-weight: bolder" name="blog_id" readonly type="text" hidden="true" value="${blogId}">
                                                            <textarea  style="margin-top: 10px; width:100%" rows="4" cols="50" placeholder="${c.commentText}" name="comment_text" type="text" value="commentText"></textarea>
                                                        </div>
                                                        <div style="margin-top: 10px; text-align: center">
                                                            <button class="btn btn-save" style="background-color: green; color:white" type="submit">Gửi</button>
                                                            <a class="btn btn-cancel" style="background-color: red; color:white"  data-dismiss="modal">Hủy bỏ</a>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${sessionScope.user}">
            <div class="form-container" style="margin-top: 10px">
                <form action="blog-comment?action=addBlogComment&blog_id=${blogId}" method="POST">
                    <input type="hidden" name="action" value="addBlogComment">
                    <h3>Góc bình luận</h3>
                    <textarea name="comment_text" rows="4" cols="50" placeholder="Nhập bình luận của bạn"></textarea>
                    <c:if test="${not empty sessionScope.user}">
                        <button type="submit">Gửi bình luận</button>
                    </c:if>
                </form>
            </div>
            </c:if>
        </div>

        <%--<jsp:include page="layout/footer.jsp"/>--%>

        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
        <script>
            jQuery(document).ready(function () {
                // Event delegation for delete buttons
                jQuery(document).on('click', '.aaa', function () {
                    var id = $(this).attr("value");
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có chắc chắn là muốn xóa phản hồi này?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    }).then((willDelete) => {
                        if (willDelete) {
                            window.location = "blog-comment?action=deleteBlogComment&blog_id=" + id;
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