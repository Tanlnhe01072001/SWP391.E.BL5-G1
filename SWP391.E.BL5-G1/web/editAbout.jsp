<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh Sửa</title>
    <link rel="stylesheet" href="css/about.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        form {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        form label {
            display: block;
            margin-bottom: 10px;
        }
        form input, form textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        form input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        form input[type="submit"]:hover {
            background-color: #218838;
        }
        form input[type="button"] {
                background-color: #dc3545;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 16px;
            }
            form input[type="button"]:hover {
                background-color: #c82333;
            }
        img {
            max-width: 150px;
            height: auto;
        }
    </style>
</head>
<body>
    <header>
        <h1>Chỉnh Sửa Giới Thiệu</h1>
    </header>

    <div class="container">
        <form action="editAbout" method="post">
            <input type="hidden" name="aboutId" value="${aboutId}">
            
            <label for="title">Tiêu Đề:</label>
            <input type="text" id="title" name="title" value="${title}" required>
            
            <label for="img">Ảnh:</label>
            <input type="file" id="img" name="img" required="">
            <img src="${img}" alt="${title}" style="max-width: 150px; height: auto;">
            
            <label for="content">Nội Dung:</label>
            <textarea id="content" name="content" rows="4" required>${content}</textarea>
            
            <input type="submit" value="Cập Nhật">
            <input type="button" value="Hủy" onclick="window.location.href='aboutmanager';">
        </form>
    </div>

    <footer>
        <jsp:include page="footer.jsp"/>
    </footer>
</body>
</html>
