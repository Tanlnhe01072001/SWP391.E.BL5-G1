<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Giới Thiệu</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 0;
            }

            header {
                padding: 1rem;
                text-align: center;
            }

            header nav ul {
                list-style: none;
                padding: 0;
            }

            header nav ul li {
                display: inline;
                margin: 0 1rem;
            }

            header nav ul li a {
                color: #fff;
                text-decoration: none;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 2rem;
            }

            section {
                margin-bottom: 2rem;
            }

            section img {
                max-width: 100%;
                height: auto;
                border-radius: 8px;
                margin-bottom: 1rem;
            }

            section h2 {
                border-bottom: 2px solid #333;
                padding-bottom: 0.5rem;
                margin-bottom: 1rem;
            }

            footer {
                text-align: center;
                padding: 1rem;
                width: 100%;
                bottom: 0;
                background-color: #f4f4f4;
            }

            .content-wrapper {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
                gap: 20px;
                flex-wrap: wrap;
            }

            .content-text, .content-image {
                flex: 1;
                min-width: 300px;
            }

            .content-text {
                padding: 10px;
            }

            .content-image img {
                width: 100%;
                height: auto;
                border-radius: 8px;
            }

            .c-odd .content-wrapper {
                flex-direction: row-reverse;
            }

            .c-even .content-wrapper {
                flex-direction: row;
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
                                <li>Giới thiệu</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>

        <header>
            <h1>Giới Thiệu</h1>
        </header>
        <div class="container">
            <section id="about">
                <h2>Chào Mừng Đến Với Cửa Hàng Quần Áo Của Chúng Tôi</h2> 
                 <p>Với hơn nhiều năm kinh nghiệm trong ngành thời trang, chúng tôi tự hào là một trong những cửa hàng thời trang lâu đời, nơi mỗi sản phẩm đều chứa đựng sự tinh tế và đẳng cấp vượt thời gian. Chuyên cung cấp các bộ sưu tập quần áo và phụ kiện được chế tác với sự tỉ mỉ, cửa hàng của chúng tôi không chỉ là nơi bạn mua sắm, mà còn là không gian để bạn khám phá những giá trị nghệ thuật vĩnh cửu của thời trang.</p> 
                 <p>Với sự am hiểu sâu sắc về lịch sử và sự phát triển của thời trang, chúng tôi luôn cập nhật những xu hướng mới nhất mà vẫn giữ vững được cái hồn cổ điển. Chúng tôi cam kết mang đến cho bạn những bộ sưu tập độc đáo, nơi mỗi chi tiết đều được chăm chút tỉ mỉ, và mỗi món đồ là một tác phẩm nghệ thuật riêng biệt. Đến với chúng tôi, bạn không chỉ tìm thấy sản phẩm thời trang mà còn cảm nhận được sự tinh tế trong từng đường nét thiết kế.</p> 
                 <p>Sự hài lòng của khách hàng chính là niềm tự hào và động lực để chúng tôi không ngừng phát triển. Cùng với đội ngũ thiết kế dày dặn kinh nghiệm, chúng tôi hy vọng sẽ đồng hành cùng bạn trên hành trình khám phá phong cách cá nhân của mình, trong mỗi bộ trang phục là một tuyên ngôn của sự sang trọng và khác biệt.</p>
            </section>

            <c:forEach var="item" items="${listAbout}">
                <c:set var="counter" value="${counter + 1}" />
                <section id="${item.aboutId}" class="${(counter % 2 == 0) ? 'c-even' : 'c-odd'}">
                    <h2>${item.title}</h2>
                    <div class="content-wrapper">
                        <div class="content-text">
                            <p>${item.content}</p>
                        </div>
                        <div class="content-image">
                            <img src="${item.img}" alt="${item.title}">
                        </div>
                    </div>
                </section>
            </c:forEach>

        </div>


        <jsp:include page="footer.jsp"/>

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
    </body>
</html>

