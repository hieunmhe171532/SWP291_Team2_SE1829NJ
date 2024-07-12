<%-- 
    Document   : wedding
    Created on : Jun 10, 2024, 4:26:51 PM
    Author     : Linh Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Showcase</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Include your CSS here */
        body {
            font-family: 'Arial', sans-serif;
            color: #333;
        }
        .event-section {
            margin: 50px 0;
        }
        .event-section h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.5em;
            color: #333;
            position: relative;
        }
        .event-section h2::after {
            content: '';
            width: 100px;
            height: 4px;
            background: #007bff;
            display: block;
            margin: 10px auto;
        }
        .event-card {
            margin-bottom: 30px;
            transition: transform 0.3s;
        }
        .event-card:hover {
            transform: translateY(-10px);
        }
        .event-card img {
            width: 100%;
            height: auto;
            border-radius: 5px;
            transition: opacity 0.3s;
        }
        .event-card img:hover {
            opacity: 0.8;
        }
        .event-card h3 {
            margin-top: 15px;
            font-size: 1.5em;
            color: #007bff;
        }
        .event-card p {
            font-size: 1em;
            color: #666;
        }
        .event-card a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            margin-top: 10px;
        }
        .event-card a:hover {
            text-decoration: underline;
        }
        .event-intro img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .event-intro p {
            font-size: 1.1em;
            color: #666;
        }
    </style>
</head>
<body>

<!-- Section 1 -->
<div class="container event-section">
    <h2>Lễ cưới & Hội nghị</h2>
    <div class="row">
        <div class="col-md-6">
            <div class="event-card">
                <img src="path/to/your/image1.png" alt="Wedding Party">
                <h3>Tiệc cưới</h3>
                <p>Vì quý vị là người đẹp nhất, chúng tôi đã chuẩn bị mọi thứ cho những khoảnh khắc hạnh phúc nhất của quý vị...</p>
                <a href="#">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
        <div class="col-md-6">
            <div class="event-card">
                <img src="path/to/your/image2.png" alt="Conference">
                <h3>Địa điểm tổ chức tiệc</h3>
                <p>Lotte Hotel được trang bị phòng tiệc và cơ sở vật chất hiện đại cho các sự kiện khác nhau...</p>
                <a href="#">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
    </div>
</div>

<!-- Section 2 -->
<div class="container event-section">
    <h2>Giới thiệu</h2>
    <div class="text-center event-intro">
        <img src="path/to/your/image3.png" alt="Introduction" class="img-fluid">
        <p>Ban sắp bắt đầu ngày lễ quan trọng nhất trong cuộc đời bạn. Bạn muốn tạo ra những khoảnh khắc tuyệt vời và lãng mạn không thể nào quên...</p>
    </div>
</div>

<!-- Section 3 -->
<div class="container event-section">
    <h2>PHONG CÁCH CƯỚI TẠI LOTTE HOTEL</h2>
    <div class="row">
        <div class="col-md-6">
            <div class="event-card">
                <img src="path/to/your/image4.png" alt="Lotte Family Club">
                <h3>LOTTE Family Club</h3>
                <p>Nơi được chuẩn bị đặc biệt sang cho bạn những ngày vui nhất của bạn...</p>
                <a href="#">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
        <div class="col-md-6">
            <div class="event-card">
                <img src="path/to/your/image5.png" alt="Table Decoration">
                <h3>Trang trí bàn</h3>
                <p>Các chuyên gia của chúng tôi sẽ trang trí bàn của quý vị như sự nguyên vẹn...</p>
                <a href="#">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
        <div class="col-md-6">
            <div class="event-card">
                <img src="path/to/your/image6.png" alt="Limousine Service">
                <h3>Dịch vụ limousine</h3>
                <p>Một dịch vụ limousine đầy đủ được cung cấp cho các dịch vụ đặc biệt...</p>
                <a href="#">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
        <div class="col-md-6">
            <div class="event-card">
                <img src="path/to/your/image7.png" alt="Food Service">
                <h3>Dịch vụ thứ đồ ăn</h3>
                <p>Một dịch vụ thứ đồ ăn trên menu chọn lọc được cung cấp cho các khách hàng...</p>
                <a href="#">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
