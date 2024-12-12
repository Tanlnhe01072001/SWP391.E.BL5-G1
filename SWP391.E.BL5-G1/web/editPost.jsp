

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Post</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f2f5;
                margin: 0;
                padding: 20px;
            }
            .container {
                max-width: 600px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h2 {
                text-align: center;
                color: #1877f2;
            }
            label {
                display: block;
                margin-bottom: 8px;
                color: #333;
            }
            input[type="text"],
            textarea,
            select {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
            .button-container {
                text-align: center;
                margin-top: 20px;
            }
            button {
                padding: 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                color: #fff;
                margin: 5px;
            }
            .submit-btn {
                background-color: #1877f2;
                width: auto;
            }
            .submit-btn:hover {
                background-color: #145dbf;
            }
            .cancel-btn {
                background-color: #ccc;
                width: auto;
            }
            .cancel-btn:hover {
                background-color: #999;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Chỉnh sửa bài viết</h2>
            <form action="editPost" method="post">
                <input type="hidden" name="postId" value="${post.postId}">

                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="${post.title}" required>

                <label for="content">Content:</label>
                <textarea id="content" name="content" rows="4" required>${post.content}</textarea>

                <label for="postTypeId">Post Type:</label>
                <select id="postTypeId" name="postTypeId">
                    <c:forEach var="type" items="${postTypes}">
                        <option value="${type.id}" <c:if test="${type.id == post.postTypeId}">selected</c:if>>${type.type}</option>
                    </c:forEach>
                </select>

                <div class="button-container">
                    <button type="submit" class="submit-btn">Sửa</button>
                    <button type="button" class="cancel-btn" onclick="window.location.href = 'listPosts'">Hủy</button>
                </div>
            </form>
        </div>
    </body>
</html>


