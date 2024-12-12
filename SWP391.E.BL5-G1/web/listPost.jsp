

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bài Đăng | 2001Store</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f2f5;
                margin: 0;
                padding: 20px;
            }
            .post-container {
                max-width: 600px;
                margin: 20px auto;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 15px;
                position: relative;
            }
            .post-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 10px;
            }
            .post-user {
                font-weight: bold;
                margin-right: auto;
            }
            .post-actions {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .post-actions a {
                display: inline-flex;
                width: 24px;
                height: 24px;
                text-align: center;
                line-height: 24px;
                color: #007bff;
                font-size: 16px;
                text-decoration: none;
                background-color: transparent;
                border: none;
            }
            .post-actions a:hover {
                color: #0056b3;
            }
            .post-time {
                margin-left: 10px;
                color: #666;
                font-size: 0.9em;
            }
            .post-title {
                font-size: 1.2em;
                font-weight: bold;
                margin-bottom: 10px;
            }
            .post-content {
                margin-bottom: 10px;
            }
        </style>

    </head>
    <body>
        <div class="off_canvars_overlay"></div>
        <jsp:include page="menu.jsp"/>

        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">Trang chủ</a></li>
                                <li>/</li>
                                <li>Bài đăng</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>

        <div class="container">
            <h2>Danh sách bài viết</h2>
            <a href="addPost" class="button">Thêm bài viết</a>
            <c:forEach var="post" items="${posts}">
                <div class="post-container">
                    <div class="post-header">
                        <span class="post-user">${post.username}</span>
                        <div class="post-actions">
                            <c:if test="${user.user_id == post.userid}">
                                <a href="editPost?postId=${post.postId}" class="button">✎</a> 
                            </c:if>
                            <c:if test="${user.user_id == post.userid || user.isAdmin == 'TRUE'}">
                                <a href="deletePost?postId=${post.postId}"  class="button" onclick="return confirm('Bạn có chắc chắn muốn xóa bài viết này?');">🗑️</a> <!-- Xóa -->
                            </c:if>
                            <span class="post-time">${post.createAt}</span>
                        </div>
                    </div>
                    <div class="post-title">
                       <span>${post.type}</span> - ${post.title}
                    </div>
                    <div class="post-content">
                        <p>${post.content}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </body>
    <jsp:include page="footer.jsp"/>

    <!-- Plugins JS -->
    <script src="assets/js/plugins.js"></script>

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>
</html>
