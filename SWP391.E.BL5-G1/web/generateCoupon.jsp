<%-- 
    Document   : generateCoupon
    Created on : Dec 3, 2024, 7:48:10 PM
    Author     : BOTMark
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Generate Coupon</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                color: #333;
                margin: 20px;
            }
            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }
            form {
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
            }
            select, input[type="date"], input[type="number"] {
                width: 100%;
                padding: 8px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin-top: 10px;
                border-radius: 5px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            a {
                color: #007bff;
                text-decoration: none;
            }
            a.btn {
                display: inline-block;
                background-color: #007bff;
                color: white;
                padding: 10px 15px;
                text-align: center;
                border-radius: 5px;
                text-decoration: none;
                font-size: 16px;
                margin-top: 10px;
            }
            a.btn:hover {
                background-color: #0056b3;
            }
        </style> <script>
            function setTodayDate() {
                const today = new Date().toISOString().split('T')[0];
                document.getElementById('startDate').value = today;
            }
            window.onload = setTodayDate;
        </script>
    </head>
    <body>
        <h1>Tạo Mã Giảm Giá</h1>
        <form action="couponmanager" method="post">
            <input type="hidden" name="action" value="create" />

            <label for="couponTypeId">Coupon Type:</label>
            <select id="couponTypeId" name="couponTypeId" required>
                <c:forEach var="type" items="${couponTypes}">
                    <option value="${type.couponTypeId}">${type.couponDescription}</option>
                </c:forEach>
            </select>
            <br />

            <label for="startDate">Ngày bắt đầu:</label>
            <input type="date" id="startDate" name="startDate" required />
            <br />

            <label for="endDate">Ngày kết thúc:</label>
            <input type="date" id="endDate" name="endDate" required />
            <br />

            <label for="usageLimit">Số lượng:</label>
            <input type="number" id="usageLimit" name="usageLimit" required />
            <br />

            <input type="submit" value="Tạo" />
            <a href="couponmanager?action=list" class="btn btn-back">Trở lại</a>
        </form>

    </body>
</html>