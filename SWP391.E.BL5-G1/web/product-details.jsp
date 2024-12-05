<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Thông Tin Sản Phẩm  |  You&Me</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS -->
        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
    </head>
    <style>.product-buttons {
            display: flex;
            gap: 10px;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;  /* Adjust padding as needed */
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            white-space: nowrap;  /* Prevent text wrapping */
        }

        .button:hover {
            background-color: #0056b3;
        }

        .button:active {
            background-color: #003d82;
        }

        .button-secondary {
            background-color: #28a745;
        }

        .button-secondary:hover {
            background-color: #218838;
        }

        .button-secondary:active {
            background-color: #1e7e34;
        }
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            color: #333;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }



        /* Product Name */
        h1 {
            font-size: 3em;
            margin-bottom: 20px;
            color: #2c3e50;
            font-weight: bold;
            text-align: center;
        }

        /* Product Price */
        .product_price {
            font-size: 1.5em;
            margin-bottom: 20px;
            color: #e74c3c;
            text-align: center;
            font-weight: bold;
        }
        .product_price label {
            font-weight: bold;
            color: #555;
        }
        .product_price .current_price {
            font-size: 2em;
            color: #e74c3c;
            font-weight: bold;
        }

        /* Product Description */
        .product_desc {
            margin-top: 20px;
            padding: 20px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .product_desc label {
            display: block;
            font-size: 1.5em;
            font-weight: bold;
            color: #555;
            margin-bottom: 10px;
        }
        .product_desc p {
            margin: 0;
            font-size: 1.2em;
            color: #34495e;
            font-weight: bold;
        }

        .product_reviews {
            margin-top: 30px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }
        .rating, .comment {
            margin-bottom: 15px;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        }
        .rating p, .comment p {
            margin: 5px 0;
        }
    </style>
    <style>
        /* Form container style */
        .form-container {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        /* Form heading style */
        .form-container h3 {
            font-size: 1.5em;
            margin-bottom: 10px;
            color: #333;
        }

        /* Select input style for rating */
        .form-container select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        /* Textarea input style for comment */
        .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        /* Submit button style */
        .form-container button {
            padding: 10px 20px;
            font-size: 1em;
            font-weight: bold;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }

        .form-container button:active {
            background-color: #003d82;
        }
        body {
            font-family: Arial, sans-serif;
        }

        .features-list {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-wrap: wrap;
        }

        .features-list li {
            flex: 1 1 calc(33.333% - 20px);
            box-sizing: border-box;
            padding: 20px;
            margin: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
        }

        .features-list .icon img {
            width: 50px;
            height: auto;
            margin-bottom: 10px;
        }

        .features-list .text {
            font-size: 14px;
        }

        .features-list .text strong {
            display: block;
            font-size: 16px;
            margin-bottom: 5px;
        }
        .size-selection-container {
            display: flex;
            align-items: center;
            gap:250px;
        }

        #size {
            margin-right: 200px; /* Add a right margin of 200px to the select element */
        }

        #size-guide-link {
            text-decoration: underline; /* Underline the text */
            color: black;
            font-weight: bold;
            transition: color 0.3s ease;
            display: flex;
            align-items: center;
        }

        #size-guide-link i {
            margin-right: 5px; /* Add some space between the icon and the text */
        }

        #size-guide-link:hover {
            color: orange;
        }
        #size-guide-popup {
            display: none;
            position: fixed;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border: 1px solid black;
            z-index: 1000;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow for depth */
            width: 80%; /* Adjust width as needed */
            max-width: 600px; /* Set maximum width to avoid stretching on larger screens */
            text-align: center; /* Center align content */
        }

        #size-guide-popup h3 {
            font-size: 1.5em;
            margin-bottom: 10px;
            color: #333;
        }

        #size-guide-popup table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }

        #size-guide-popup table, #size-guide-popup th, #size-guide-popup td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #size-guide-popup th {
            background-color: #f2f2f2;
        }

        #size-guide-popup p {
            margin-bottom: 10px;
            font-style: italic;
            color: #666;
        }

        #size-guide-popup button {
            padding: 10px 20px;
            font-size: 1em;
            font-weight: bold;
            color: white;
            background-color: black;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #size-guide-popup button:hover {
            background-color: orange;
        }
        .star {
            color: gold; /* Màu vàng */
        }
        .product_thumb {
            position: relative;
            overflow: hidden;
            aspect-ratio: 1 / 1; /* Tạo khung hình vuông */
        }

        .product_thumb img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Đảm bảo ảnh lấp đầy khung mà không bị méo */
            object-position: center; /* Căn giữa ảnh trong khung */
        }

        .single_product {
            margin-bottom: 20px; /* Tạo khoảng cách giữa các sản phẩm */
        }
        a, a:hover, a:focus {
            text-decoration: none;
        }

        .product_content h3 a,
        .banner_content a,
        .slider_content a {
            text-decoration: none;
        }

        .highlight {
            color: gold; /* Or any other style you want to apply */
        }

        .btn .highlight{
            color: gold;
        }

    </style>
    <body>


        <!-- Main Wrapper Start -->
        <div class="off_canvars_overlay"></div>
        <jsp:include page="menu.jsp"/>

        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area product_bread">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">Trang chủ</a></li>
                                <li>/</li>
                                <li>Chi tiết sản phẩm</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--breadcrumbs area end-->

        <!--product details start-->
        <div class="product_details">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4">
                        <div class="product-details-tab">
                            <div id="img-1" class="zoomWrapper single-zoom">
                                <a href="#">
                                    <img id="zoom1" src="${ProductData.img}" data-zoom-image="${ProductData.img}" alt="product">
                                </a>
                            </div>
                        </div>
                    </div>``

                    <div class="col-lg-7 col-md-7">
                        <div class="product_d_right">
                            <form id="productForm" action="cart" method="POST">
                                <input type="hidden" name="action" id="action" value="addtocart">
                                <input type="hidden" name="product_id" value="${ProductData.product_id}">
                                <div class="product_container">                               
                                    <h1>${ProductData.product_name}</h1>
                                    <div class="product_price">
                                        <label >Giá tiền: </label>
                                        <fmt:formatNumber value="${ProductData.product_price != null ? ProductData.product_price : 0}" minFractionDigits="0" maxFractionDigits="2" var="formattedPrice"/>
                                        <span class="current_price">${formattedPrice} VNĐ</span>
                                    </div>
                                    <div class="product_desc">
                                      
                                        <label>Mô tả sản phẩm: </label>
                                        <p>${ProductData.product_describe}</p>
                                    </div>
                                </div>


                                <div class="product_variant color">
                                    <h3>Chọn màu sắc :</h3>
                                    <select class="niceselect_option" id="color" name="color">
                                        <c:forEach items="${ColorData}" var="c">
                                            <option value="${c.color}">${c.color}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="product_variant size">
                                    <h3>Chọn size :</h3>
                                    <div class="size-selection-container">
                                        <select class="niceselect_option" id="size" name="size">
                                            <c:forEach items="${SizeData}" var="s">
                                                <option value="${s.size}">${s.size}</option>
                                            </c:forEach>
                                        </select>
                                        <a href="#size-guide-popup" id="size-guide-link">
                                            <i class="fas fa-ruler"></i> Hướng dẫn chọn size
                                        </a>
                                    </div>
                                </div>


                                <div class="product_variant quantity">
                                    <label>Số lượng :</label>
                                    <input min="1" max="${ProductData.quantity}" name="quantity" type="number" value="1">
                                    <div class="product-buttons">
                                        <button class="button" type="submit">Thêm vào giỏ hàng</button>
                                        <button class="button button-secondary" type="button" onclick="setActionAndSubmit('buynow')">Mua ngay</button>
                                    </div>
                                </div>
                            </form> 

                            <c:if test="${not empty AlbumData}">
                                <div  class="product_variant quantity" style="width: 100%">
                                    <div class="product-buttons">
                                        <button type="button" data-toggle="modal" data-target="#ModalAddAlbum${ProductData.product_id}" class="button" title="Thêm">Thêm vào Album</button>

                                    </div>
                                </div>
                            </c:if>

                        </div>
                    </div>
                    <ul class="features-list">
                        <li>
                            <div class="icon"><img src="https://routine.vn/static/version1718856864/frontend/Magenest/routine/vi_VN/images/free.png" alt="Freeship toàn quốc từ 399k"></div>
                            <div class="text">
                                <strong>Miễn phí vận chuyển</strong>

                            </div>
                        </li>
                        <li>
                            <div class="icon"><img src="https://routine.vn/static/version1718856864/frontend/Magenest/routine/vi_VN/images/order.png" alt="Theo dõi đơn hàng dễ dàng"></div>
                            <div class="text">
                                <strong>Theo dõi đơn hàng <br>một cách dễ dàng</strong>
                            </div>
                        </li>
                        <li>
                            <div class="icon"><img src="https://routine.vn/static/version1718856864/frontend/Magenest/routine/vi_VN/images/returns.png" alt="Đổi trả tận nơi"></div>
                            <div class="text">
                                <strong>Đổi trả linh hoạt</strong>
                                <p>Với sản phẩm không áp dụng khuyến mãi</p>
                            </div>
                        </li>
                        <li>
                            <div class="icon"><img src="https://routine.vn/static/version1718856864/frontend/Magenest/routine/vi_VN/images/pay.png" alt="Thanh toán dễ dàng"></div>
                            <div class="text">
                                <strong>Thanh toán dễ dàng <br>nhiều hình thức</strong>
                            </div>
                        </li>
                        <li>
                            <div class="icon"><img src="https://routine.vn/static/version1718856864/frontend/Magenest/routine/vi_VN/images/hotline.png" alt="Hotline hỗ trợ Routine"></div>
                            <div class="text"><strong>Hotline hỗ trợ</strong>
                                <h3>0387104105</h3>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--product details end-->
        <!-- Form for adding rating -->
        <c:if test="${haveCmt}">
            <div class="product_reviews">
                <h3>Đánh giá và Bình luận</h3>
                <div class="dropdown" style="width: 100%; text-align: right;">            
                    <a class="${comment_filter == '6' ? 'highlight' : ''}" style="margin-right: 10px;" href="search?action=productdetail&product_id=${ProductData.product_id}">
                        Tất cả (${numberOfComments})
                    </a>
                    <a class="${comment_filter == '1' ? 'highlight' : ''}" style="margin-right: 10px;" href="search?action=productdetail&product_id=${ProductData.product_id}&comment_filter=1">
                        1&#9733; (${numberOfComments1})
                    </a>
                    <a class="${comment_filter == '2' ? 'highlight' : ''}" style="margin-right: 10px;" href="search?action=productdetail&product_id=${ProductData.product_id}&comment_filter=2">
                        2&#9733;&#9733; (${numberOfComments2})
                    </a>
                    <a class="${comment_filter == '3' ? 'highlight' : ''}" style="margin-right: 10px;" href="search?action=productdetail&product_id=${ProductData.product_id}&comment_filter=3">
                        3&#9733;&#9733;&#9733; (${numberOfComments3})
                    </a>
                    <a class="${comment_filter == '4' ? 'highlight' : ''}" style="margin-right: 10px;" href="search?action=productdetail&product_id=${ProductData.product_id}&comment_filter=4">
                        4&#9733;&#9733;&#9733;&#9733; (${numberOfComments4})
                    </a>
                    <a class="${comment_filter == '5' ? 'highlight' : ''}" style="margin-right: 10px;" href="search?action=productdetail&product_id=${ProductData.product_id}&comment_filter=5">
                        5&#9733;&#9733;&#9733;&#9733;&#9733; (${numberOfComments5})
                    </a>
                </div>
                <h5>Bình luận:</h5>
                <c:forEach items="${comments}" var="c">
                    <div class="comment" style="position: relative; display: flex">
                        <div style="width: 90%; text-align: left">
                            <p>Bởi: ${c.user_name}</p> 
                            <p>Đánh giá: ${c.rating}&#9733</p>
                            <p>Ngày: <fmt:formatDate value="${c.createdAt}" pattern="dd/MM/yyyy"/></p>
                            <p>${c.comment}</p>
                        </div>
                        <c:if test="${c.user_name == user.user_name}">
                            <div style="width:10%; text-align: right; display: flex;">
                                <button class="btn btn-primary btn-sm edit" style="margin-right: 10px;  max-height: 34px; background-color: green" type="button" data-toggle="modal" data-target="#ModalEditComment${c.user_name}" class="edit-icon" title="Chỉnh sửa">
                                    <i class="fas fa-edit"></i></button>
                                <button class="btn btn-primary btn-sm trash" style="max-height: 34px; background-color: red" type="button" title="xóa" value="${c.id}">
                                    <i class="fas fa-trash"></i></button>
                            </div>

                        </c:if>
                    </div>

                </c:forEach>
            </div>
            <div class="modal fade" id="ModalEditComment${c.user_name}" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-body" style="padding:0 1rem">
                            <form action="search?action=updatecmt&product_id=${ProductData.product_id}" method="POST">
                                <input type="hidden" name="action" value="updatecmt">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <span class="thong-tin-thanh-toan">
                                            <h5>Chỉnh sửa đánh giá</h5>
                                        </span>
                                    </div>
                                </div>
                                <div class="row" style="padding: 0 1rem">
                                    <h5>Đánh giá sản phẩm <b>#${ProductData.product_id}</b></h5>
                                    <!--                                        <select name="rating_filter" id="star-rating">     
                                                                                <option value="1">1&#9733;</option>
                                                                                <option value="2">2&#9733;&#9733;</option>
                                                                                <option value="3">3&#9733;&#9733;&#9733;</option>
                                                                                <option value="4">4&#9733;&#9733;&#9733;&#9733;</option>
                                                                                <option value="5">5&#9733;&#9733;&#9733;&#9733;&#9733;</option>
                                                                            </select>-->
                                    <input name="idproduct" value="${c.id}" hidden="true">
                                    <textarea name="comment-update" style="margin-top: 10px" rows="4" cols="50" placeholder="Nhập bình luận của bạn"></textarea>
                                </div>
                                <div style="margin-top: 10px; text-align: right">
                                    <button class="btn btn-save" style="background-color:green" type="submit">Lưu lại</button>
                                    <a class="btn btn-cancel"  style="background-color:red" data-dismiss="modal" href="#">Hủy bỏ</a>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        
        <c:if test="${user_comment}">
            <div class="form-container">
                <form action="search?action=addComment&product_id=${ProductData.product_id}" method="POST">
                    <input type="hidden" name="action" value="addComment">
                    <input type="hidden" name="product_id" value="${ProductData.product_id}">
                    <input type="hidden" name="user_id" value="${user.user_id}">                
                    <input type="hidden" name="user_name" value="${user.user_name}">  
                    <h3>Đánh giá sản phẩm</h3>
                    <select name="rating" id="star-rating">

                        <option value="1">1&#9733;</option>
                        <option value="2">2&#9733;&#9733;</option>
                        <option value="3">3&#9733;&#9733;&#9733;</option>
                        <option value="4">4&#9733;&#9733;&#9733;&#9733;</option>
                        <option value="5">5&#9733;&#9733;&#9733;&#9733;&#9733;</option>
                    </select>
                    <textarea name="comment" rows="4" cols="50" placeholder="Nhập bình luận của bạn"></textarea>
                    <button type="submit">Gửi bình luận</button>
                </form>
            </div>
        </c:if>
        <!--product section area end-->

        <!--footer area start-->
        <jsp:include page="footer.jsp"/>
        <!--footer area end-->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
        <script>
                                            function setActionAndSubmit(action) {
                                                document.getElementById('action').value = action;
                                                document.getElementById('productForm').submit();
                                            }
        </script>
      <div id="size-guide-popup" style="display: none; position: fixed; left: 50%; top: 50%; transform: translate(-50%, -50%); background-color: white; padding: 20px; border: 2px solid black; border-radius: 8px; z-index: 1000; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); font-family: Arial, sans-serif;">
    <h3 style="text-align: center; color: #333;">Bảng size</h3>
    <table border="1" style="width: 100%; border-collapse: collapse; text-align: center; font-size: 14px;">
        <thead style="background-color: #f2f2f2;">
            <tr>
                <th style="padding: 10px; border: 1px solid #ccc;">SIZE</th>
                <th style="padding: 10px; border: 1px solid #ccc;">CHIỀU CAO (CM)</th>
                <th style="padding: 10px; border: 1px solid #ccc;">CÂN NẶNG (KG)</th>
                <th style="padding: 10px; border: 1px solid #ccc;">NGANG VAI</th>
                <th style="padding: 10px; border: 1px solid #ccc;">VÒNG NGỰC</th>
                <th style="padding: 10px; border: 1px solid #ccc;">VÒNG EO</th>
                <th style="padding: 10px; border: 1px solid #ccc;">DÀI TAY</th>
                <th style="padding: 10px; border: 1px solid #ccc;">DÀI ÁO</th>
            </tr>
        </thead>
        <tbody>
            <tr style="background-color: #ffffff;">
                <td style="padding: 10px; border: 1px solid #ccc;">S</td>
                <td style="padding: 10px; border: 1px solid #ccc;">&lt; 168</td>
                <td style="padding: 10px; border: 1px solid #ccc;">&lt; 62</td>
                <td style="padding: 10px; border: 1px solid #ccc;">44.5</td>
                <td style="padding: 10px; border: 1px solid #ccc;">100</td>
                <td style="padding: 10px; border: 1px solid #ccc;">96</td>
                <td style="padding: 10px; border: 1px solid #ccc;">19.5</td>
                <td style="padding: 10px; border: 1px solid #ccc;">67.5</td>
            </tr>
            <tr style="background-color: #f9f9f9;">
                <td style="padding: 10px; border: 1px solid #ccc;">M</td>
                <td style="padding: 10px; border: 1px solid #ccc;">169 - 172</td>
                <td style="padding: 10px; border: 1px solid #ccc;">63 - 69</td>
                <td style="padding: 10px; border: 1px solid #ccc;">46</td>
                <td style="padding: 10px; border: 1px solid #ccc;">104</td>
                <td style="padding: 10px; border: 1px solid #ccc;">100</td>
                <td style="padding: 10px; border: 1px solid #ccc;">21</td>
                <td style="padding: 10px; border: 1px solid #ccc;">69</td>
            </tr>
            <tr style="background-color: #ffffff;">
                <td style="padding: 10px; border: 1px solid #ccc;">L</td>
                <td style="padding: 10px; border: 1px solid #ccc;">173 - 176</td>
                <td style="padding: 10px; border: 1px solid #ccc;">70 - 76</td>
                <td style="padding: 10px; border: 1px solid #ccc;">47.5</td>
                <td style="padding: 10px; border: 1px solid #ccc;">108</td>
                <td style="padding: 10px; border: 1px solid #ccc;">104</td>
                <td style="padding: 10px; border: 1px solid #ccc;">22.5</td>
                <td style="padding: 10px; border: 1px solid #ccc;">71</td>
            </tr>
            <tr style="background-color: #f9f9f9;">
                <td style="padding: 10px; border: 1px solid #ccc;">XL</td>
                <td style="padding: 10px; border: 1px solid #ccc;">177 - 180</td>
                <td style="padding: 10px; border: 1px solid #ccc;">77 - 83</td>
                <td style="padding: 10px; border: 1px solid #ccc;">49.5</td>
                <td style="padding: 10px; border: 1px solid #ccc;">114</td>
                <td style="padding: 10px; border: 1px solid #ccc;">110</td>
                <td style="padding: 10px; border: 1px solid #ccc;">24</td>
                <td style="padding: 10px; border: 1px solid #ccc;">73</td>
            </tr>
            <tr style="background-color: #ffffff;">
                <td style="padding: 10px; border: 1px solid #ccc;">XXL</td>
                <td style="padding: 10px; border: 1px solid #ccc;">&gt; 180</td>
                <td style="padding: 10px; border: 1px solid #ccc;">&gt; 83</td>
                <td style="padding: 10px; border: 1px solid #ccc;">51.5</td>
                <td style="padding: 10px; border: 1px solid #ccc;">120</td>
                <td style="padding: 10px; border: 1px solid #ccc;">116</td>
                <td style="padding: 10px; border: 1px solid #ccc;">25.5</td>
                <td style="padding: 10px; border: 1px solid #ccc;">75</td>
            </tr>
        </tbody>
    </table>
    <p style="text-align: center; margin-top: 10px; color: #666;">97% khách hàng của chúng tôi đã chọn đúng size theo bảng này</p>
    <button id="close-popup" style="display: block; margin: 10px auto 0; padding: 8px 16px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer;">Đóng</button>
</div>

        <script>
            // Lấy các phần tử DOM
            const sizeGuideLink = document.getElementById('size-guide-link');
            const sizeGuidePopup = document.getElementById('size-guide-popup');
            const closePopupButton = document.getElementById('close-popup');

            // Khi người dùng nhấp vào liên kết "Hướng dẫn chọn size"
            sizeGuideLink.addEventListener('click', function (event) {
                event.preventDefault(); // Ngăn chặn hành động mặc định của liên kết
                sizeGuidePopup.style.display = 'block'; // Hiển thị popup
            });

            // Khi người dùng nhấp vào nút "Đóng"
            closePopupButton.addEventListener('click', function () {
                sizeGuidePopup.style.display = 'none'; // Đóng popup
            });
        </script>
        <script>
            function showNotification(message, isSuccess) {
                Swal.fire({
                    title: isSuccess ? 'Thành công!' : 'Lỗi!',
                    text: message,
                    icon: isSuccess ? 'success' : 'error',
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 6000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                });
            }

            // Kiểm tra và hiển thị thông báo khi trang được tải
            document.addEventListener('DOMContentLoaded', function () {
                var successMessage = "${sessionScope.successMessageAdd}";
                var errorMessage = "${sessionScope.errorMessage}";

                if (successMessage) {
                    showNotification(successMessage, true);
                    // Xóa thông báo khỏi session
            <% session.removeAttribute("successMessageAdd"); %>
                } else if (errorMessage) {
                    showNotification(errorMessage, false);
                    // Xóa thông báo khỏi session
            <% session.removeAttribute("errorMessage"); %>
                }
            });
        </script>
    </body>
</html>
