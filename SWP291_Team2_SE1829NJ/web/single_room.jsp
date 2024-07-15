<%-- 
    Document   : single_room
    Created on : May 19, 2024, 10:40:31 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Harborlights - Free Bootstrap 4 Template by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="bootstrap/css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="bootstrap/css/animate.css">

        <link rel="stylesheet" href="bootstrap/css/owl.carousel.min.css">
        <link rel="stylesheet" href="bootstrap/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="bootstrap/css/magnific-popup.css">

        <link rel="stylesheet" href="bootstrap/css/aos.css">

        <link rel="stylesheet" href="bootstrap/css/ionicons.min.css">

        <link rel="stylesheet" href="bootstrap/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="bootstrap/css/jquery.timepicker.css">


        <link rel="stylesheet" href="bootstrap/css/flaticon.css">
        <link rel="stylesheet" href="bootstrap/css/icomoon.css">
        <link rel="stylesheet" href="bootstrap/css/style.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <style>
            /*-----------------------
  Room Details Section
-------------------------*/

            .room-details-section {
                padding-top: 0;
                padding-bottom: 80px;
            }
            .room-details-item {
                margin-bottom: 50px;
            }
            .room-details-item img {
                margin-bottom: 40px;
            }
            .room-details-item .rd-text .rd-title {
                overflow: hidden;
                margin-bottom: 8px;
            }
            .room-details-item .rd-text .rd-title h3 {
                color: #19191a;
                float: left;
            }
            .room-details-item .rd-text .rd-title .rdt-right {
                float: right;
                text-align: right;
            }
            .room-details-item .rd-text .rd-title .rdt-right .rating {
                display: inline-block;
                margin-right: 25px;
                margin-bottom: 10px;
            }
            .room-details-item .rd-text .rd-title .rdt-right .rating i {
                color: #f5b917;
            }
            .room-details-item .rd-text .rd-title .rdt-right a {
                display: inline-block;
                color: #ffffff;
                font-size: 13px;
                text-transform: uppercase;
                font-weight: 700;
                background: #dfa974;
                padding: 14px 28px 13px;
            }
            .room-details-item .rd-text h2 {
                color: #dfa974;
                font-weight: 700;
                margin-bottom: 25px;
            }
            .room-details-item .rd-text h2 span {
                font-family: "Cabin", sans-serif;
                font-size: 16px;
                font-weight: 400;
                color: #19191a;
            }
            .room-details-item .rd-text table {
                margin-bottom: 32px;
            }
            .room-details-item .rd-text table tbody tr td {
                font-size: 16px;
                color: #19191a;
                line-height: 36px;
            }
            .room-details-item .rd-text table tbody tr td.r-o {
                width: 120px;
                color: #707079;
            }
            .room-details-item .rd-text p {
                color: #707079;
            }
            .room-details-item .rd-text p.f-para {
                margin-bottom: 22px;
            }
            .rd-reviews {
                padding-top: 55px;
                border-top: 1px solid #e5e5e5;
                margin-bottom: 50px;
            }
            .rd-reviews h4 {
                color: #19191a;
                letter-spacing: 1px;
                margin-bottom: 45px;
            }
            .rd-reviews .review-item {
                margin-bottom: 32px;
            }
            .rd-reviews .review-item .ri-pic {
                float: left;
                margin-right: 30px;
            }
            .rd-reviews .review-item .ri-pic img {
                height: 70px;
                width: 70px;
                border-radius: 50%;
            }
            .rd-reviews .review-item .ri-text {
                overflow: hidden;
                position: relative;
                padding-left: 30px;
            }
            .rd-reviews .review-item .ri-text:before {
                position: absolute;
                left: 0;
                top: 0;
                width: 1px;
                height: 100%;
                background: #e9e9e9;
                content: "";
            }
            .rd-reviews .review-item .ri-text span {
                font-size: 12px;
                color: #dfa974;
                text-transform: uppercase;
                letter-spacing: 3px;
            }
            .rd-reviews .review-item .ri-text .rating {
                position: absolute;
                right: 0;
                top: 0;
            }
            .rd-reviews .review-item .ri-text .rating i {
                color: #f5b917;
            }
            .rd-reviews .review-item .ri-text h5 {
                color: #19191a;
                margin-top: 4px;
                margin-bottom: 8px;
            }
            .rd-reviews .review-item .ri-text p {
                color: #707079;
                margin-bottom: 0;
            }
            .review-add h4 {
                color: #19191a;
                letter-spacing: 1px;
                margin-bottom: 45px;
            }
            .review-add .ra-form input {
                width: 100%;
                height: 50px;
                border: 1px solid #e5e5e5;
                font-size: 16px;
                color: #aaaab3;
                padding-left: 20px;
                margin-bottom: 25px;
            }
            .review-add .ra-form input::-webkit-input-placeholder {
                color: #aaaab3;
            }
            .review-add .ra-form input::-moz-placeholder {
                color: #aaaab3;
            }
            .review-add .ra-form input:-ms-input-placeholder {
                color: #aaaab3;
            }
            .review-add .ra-form input::-ms-input-placeholder {
                color: #aaaab3;
            }
            .review-add .ra-form input::placeholder {
                color: #aaaab3;
            }
            .review-add .ra-form h5 {
                font-size: 20px;
                color: #19191a;
                margin-bottom: 24px;
                float: left;
                margin-right: 10px;
            }
            .review-add .ra-form .rating {
                padding-top: 3px;
                display: inline-block;
            }
            .review-add .ra-form .rating i {
                color: #f5b917;
                font-size: 16px;
            }
            .review-add .ra-form textarea {
                width: 100%;
                height: 132px;
                border: 1px solid #e5e5e5;
                font-size: 16px;
                color: #aaaab3;
                padding-left: 20px;
                padding-top: 12px;
                margin-bottom: 24px;
                resize: none;
            }
            .review-add .ra-form textarea::-webkit-input-placeholder {
                color: #aaaab3;
            }
            .review-add .ra-form textarea::-moz-placeholder {
                color: #aaaab3;
            }
            .review-add .ra-form textarea:-ms-input-placeholder {
                color: #aaaab3;
            }
            .review-add .ra-form textarea::-ms-input-placeholder {
                color: #aaaab3;
            }
            .review-add .ra-form textarea::placeholder {
                color: #aaaab3;
            }
            .review-add .ra-form button {
                font-size: 13px;
                font-weight: 700;
                text-transform: uppercase;
                color: #ffffff;
                letter-spacing: 2px;
                background: #dfa974;
                border: none;
                padding: 14px 34px 13px;
                display: inline-block;
            }
            .room-booking {
                padding: 0 30px 0 40px;
            }
            .room-booking h3 {
                color: #19191a;
                margin-bottom: 30px;
            }
            .room-booking form .check-date {
                position: relative;
                margin-bottom: 15px;
            }
            .room-booking form .check-date label {
                font-size: 14px;
                color: #707079;
                display: block;
                margin-bottom: 10px;
            }
            .room-booking form .check-date input {
                width: 100%;
                height: 50px;
                border: 1px solid #ebebeb;
                border-radius: 2px;
                font-size: 16px;
                color: #19191a;
                text-transform: uppercase;
                font-weight: 500;
                padding-left: 20px;
            }
            .room-booking form .check-date i {
                color: #dfa974;
                position: absolute;
                right: 18px;
                bottom: 17px;
            }
            .room-booking form .select-option {
                margin-bottom: 15px;
            }
            .room-booking form .select-option label {
                font-size: 14px;
                color: #707079;
                display: block;
                margin-bottom: 10px;
            }
            .room-booking form .select-option .nice-select {
                border-radius: 2px;
                border: 1px solid #ebebeb;
                height: 50px;
                line-height: 50px;
                outline: none;
                padding-left: 20px;
                width: 100%;
                float: none;
            }
            .room-booking form .select-option .nice-select:after {
                border-bottom: 2px solid #dfa974;
                border-right: 2px solid #dfa974;
                height: 10px;
                margin-top: 0;
                right: 20px;
                width: 10px;
                top: 36%;
            }
            .room-booking form .select-option .nice-select span {
                font-size: 16px;
                color: #19191a;
                text-transform: uppercase;
                font-weight: 500;
            }
            .room-booking form .select-option .nice-select .list {
                margin-top: 0;
                width: 100%;
            }
            .room-booking form button {
                display: block;
                font-size: 14px;
                text-transform: uppercase;
                border: 1px solid #dfa974;
                border-radius: 2px;
                color: #dfa974;
                font-weight: 500;
                background: transparent;
                width: 100%;
                height: 46px;
                margin-top: 30px;
            }
            .nice-select {
                -webkit-tap-highlight-color: transparent;
                background-color: #fff;
                border-radius: 5px;
                border: solid 1px #e8e8e8;
                box-sizing: border-box;
                clear: both;
                cursor: pointer;
                display: block;
                float: left;
                font-family: inherit;
                font-size: 14px;
                font-weight: normal;
                height: 42px;
                line-height: 40px;
                outline: none;
                padding-left: 18px;
                padding-right: 30px;
                position: relative;
                text-align: left !important;
                -webkit-transition: all 0.2s ease-in-out;
                transition: all 0.2s ease-in-out;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
                white-space: nowrap;
                width: auto;
            }
            .nice-select:hover {
                border-color: #dbdbdb;
            }
            .nice-select:active, .nice-select.open, .nice-select:focus {
                border-color: #999;
            }
            .nice-select:after {
                border-bottom: 2px solid #999;
                border-right: 2px solid #999;
                content: '';
                display: block;
                height: 5px;
                margin-top: -4px;
                pointer-events: none;
                position: absolute;
                right: 12px;
                top: 50%;
                -webkit-transform-origin: 66% 66%;
                -ms-transform-origin: 66% 66%;
                transform-origin: 66% 66%;
                -webkit-transform: rotate(45deg);
                -ms-transform: rotate(45deg);
                transform: rotate(45deg);
                -webkit-transition: all 0.15s ease-in-out;
                transition: all 0.15s ease-in-out;
                width: 5px;
            }
            .nice-select.open:after {
                -webkit-transform: rotate(-135deg);
                -ms-transform: rotate(-135deg);
                transform: rotate(-135deg);
            }
            .nice-select.open .list {
                opacity: 1;
                pointer-events: auto;
                -webkit-transform: scale(1) translateY(0);
                -ms-transform: scale(1) translateY(0);
                transform: scale(1) translateY(0);
            }
            .nice-select.disabled {
                border-color: #ededed;
                color: #999;
                pointer-events: none;
            }
            .nice-select.disabled:after {
                border-color: #cccccc;
            }
            .nice-select.wide {
                width: 100%;
            }
            .nice-select.wide .list {
                left: 0 !important;
                right: 0 !important;
            }
            .nice-select.right {
                float: right;
            }
            .nice-select.right .list {
                left: auto;
                right: 0;
            }
            .nice-select.small {
                font-size: 12px;
                height: 36px;
                line-height: 34px;
            }
            .nice-select.small:after {
                height: 4px;
                width: 4px;
            }
            .nice-select.small .option {
                line-height: 34px;
                min-height: 34px;
            }
            .nice-select .list {
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 0 1px rgba(68, 68, 68, 0.11);
                box-sizing: border-box;
                margin-top: 4px;
                opacity: 0;
                overflow: hidden;
                padding: 0;
                pointer-events: none;
                position: absolute;
                top: 100%;
                left: 0;
                -webkit-transform-origin: 50% 0;
                -ms-transform-origin: 50% 0;
                transform-origin: 50% 0;
                -webkit-transform: scale(0.75) translateY(-21px);
                -ms-transform: scale(0.75) translateY(-21px);
                transform: scale(0.75) translateY(-21px);
                -webkit-transition: all 0.2s cubic-bezier(0.5, 0, 0, 1.25), opacity 0.15s ease-out;
                transition: all 0.2s cubic-bezier(0.5, 0, 0, 1.25), opacity 0.15s ease-out;
                z-index: 9;
            }
            .nice-select .list:hover .option:not(:hover) {
                background-color: transparent !important;
            }
            .nice-select .option {
                cursor: pointer;
                font-weight: 400;
                line-height: 40px;
                list-style: none;
                min-height: 40px;
                outline: none;
                padding-left: 18px;
                padding-right: 29px;
                text-align: left;
                -webkit-transition: all 0.2s;
                transition: all 0.2s;
            }
            .nice-select .option:hover, .nice-select .option.focus, .nice-select .option.selected.focus {
                background-color: #f6f6f6;
            }
            .nice-select .option.selected {
                font-weight: bold;
            }
            .nice-select .option.disabled {
                background-color: transparent;
                color: #999;
                cursor: default;
            }

            .no-csspointerevents .nice-select .list {
                display: none;
            }

            .no-csspointerevents .nice-select.open .list {
                display: block;
            }
            /* Room Booking Section */
            .room-booking {
                background-color: #f8f8f8;
                padding: 30px;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-top: 20px;
            }

            .room-booking h3 {
                font-size: 22px;
                margin-bottom: 20px;
                color: #333;
                text-align: center;
            }

            .check-date,
            .select-option {
                margin-bottom: 20px;
            }

            .check-date label,
            .select-option label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #555;
            }

            .check-date input,
            .select-option select {
                width: 100%;
                padding: 10px;
                border: 1px solid #e8e8e8;
                border-radius: 5px;
                font-size: 16px;
                background-color: #fff;
            }

            .check-date input.date-input {
                position: relative;
                padding-right: 40px;
            }

            .check-date i.icon_calendar {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                color: #999;
            }

            .room-booking button {
                width: 100%;
                padding: 12px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }

            .room-booking button:hover {
                background-color: #0056b3;
            }





        </style>
    </head>
    <body>
        <jsp:include page="layout/navbarmenu.jsp"/>


        <!-- Room Details Section Begin -->
        <section class="room-details-section spad"  style="margin-top: 50px">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="room-details-item">

                            <div class="rd-text">
                                <div class="rd-title">
                                    <h3>${vr.name}</h3>
                                </div>
                                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                    </ol>
                                    <div class="carousel-inner">
                                        <%
                                            boolean isFirst = true;
                                        %>
                                        <c:forEach items="${listri}" var="ri">
                                            <div class="carousel-item <%= isFirst ? "active" : "" %>">
                                                <img src="${ri.img}" class="d-block w-100" alt="...">
                                            </div>
                                            <% isFirst = false; %>
                                        </c:forEach>

                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                                <div class="row">
                                    <div class="col-8 d-flex">
                                        <h2 id="price">${vr.price}</h2><h2><span>/Pernight</span></h2>
                                    </div>
                                    <div class="rdt-right">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bookingModal">
                                            Booking Now
                                        </button>
                                    </div>
                                </div>
                                <p class="f-para">${vr.description}</p>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="sidebar-box ftco-animate">
                            <h3>Similar rooms</h3>
                            <c:forEach items="${listsr}" var="sr">
                                <div class="block-21 mb-4 d-flex">
                                    <div class="text">
                                        <h3 class="heading"><a href="viewroom?rid=${sr.id}">${sr.name}</a></h3>
                                        <div class="meta">
                                            <div id="price">${sr.price}</div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="row">
                        <div class="review-add col-7">
                            <h4>Add Review</h4>
                            <form action="addfeedback" class="ra-form" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-lg-11">
                                        <h5>New Comment:</h5>
                                        <input type="type" name="id" value="${vr.id}" hidden="">
                                        <input type="text" name="img" placeholder="Your Link Image" style="align-content: center">
                                        <textarea name="comment" placeholder="Your Review"></textarea>
                                        <button type="submit">Submit Now</button>

                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="rd-reviews col-5">
                            <h4>Reviews</h4>
                            <c:forEach items="${listf}" var="f">
                                <div class="review-item">
                                    <div class="ri-pic">
                                        <img src="../build/web/bootstrap/images/jpeg-3.jpg" alt="">
                                    </div>
                                    <div class="ri-text">
                                        <span>27 Aug 2019</span>
                                        <h5>Brandon Kelley</h5>
                                        <p>Neque porro qui squam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                            adipisci velit, sed quia non numquam eius modi tempora. incidunt ut labore et dolore
                                            magnam.</p>
                                    </div>
                                </div>
                            </c:forEach>


                        </div>
                    </div>

                </div>

            </div>
        </div>
    </section>
    <!-- Room Details Section End -->

    <footer class="ftco-footer ftco-section img" style="background-image: url(bootstrap/images/bg_4.jpg);">
        <div class="overlay"></div>
        <div class="container">
            <div class="row mb-5">
                <div class="col-md">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">Harbor Lights</h2>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                        <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                            <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                            <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                            <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md">
                    <div class="ftco-footer-widget mb-4 ml-md-5">
                        <h2 class="ftco-heading-2">Useful Links</h2>
                        <ul class="list-unstyled">
                            <li><a href="#" class="py-2 d-block">Blog</a></li>
                            <li><a href="#" class="py-2 d-block">Rooms</a></li>
                            <li><a href="#" class="py-2 d-block">Amenities</a></li>
                            <li><a href="#" class="py-2 d-block">Gift Card</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">Privacy</h2>
                        <ul class="list-unstyled">
                            <li><a href="#" class="py-2 d-block">Career</a></li>
                            <li><a href="#" class="py-2 d-block">About Us</a></li>
                            <li><a href="#" class="py-2 d-block">Contact Us</a></li>
                            <li><a href="#" class="py-2 d-block">Services</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">Have a Questions?</h2>
                        <div class="block-23 mb-3">
                            <ul>
                                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">

                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div>
            </div>
        </div>
    </footer>
    <!-- Modal -->
    <div class="modal fade" id="bookingModal" tabindex="-1" role="dialog" aria-labelledby="bookingModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="bookingModalLabel">Enter Booking Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="bookingForm" method="get" action="cart">
                    <div class="modal-body">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="room_id" value="${vr.id}">
                        <div class="form-group">
                            <label for="start_date">Start Date:</label>
                            <input type="date" id="start_date" name="start_date" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="end_date">End Date:</label>
                            <input type="date" id="end_date" name="end_date" class="form-control" required>
                        </div>
                        <input type="hidden" name="quantity" value="1">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        // Function to format number
        function formatPrice(price) {
            return parseFloat(price).toLocaleString('en-US', {
                maximumFractionDigits: 2
            });
        }

        // Select all elements with id 'price'
        const priceElements = document.querySelectorAll('#price');

        // Loop through each element and format its content
        priceElements.forEach(element => {
            let price = element.textContent;
            element.textContent = formatPrice(price);
        });
    </script>

    <script src="bootstrap/js/jquery.min.js"></script>
    <script src="bootstrap/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jquery.easing.1.3.js"></script>
    <script src="bootstrap/js/jquery.waypoints.min.js"></script>
    <script src="bootstrap/js/jquery.stellar.min.js"></script>
    <script src="bootstrap/js/owl.carousel.min.js"></script>
    <script src="bootstrap/js/jquery.magnific-popup.min.js"></script>
    <script src="bootstrap/js/aos.js"></script>
    <script src="bootstrap/js/jquery.animateNumber.min.js"></script>
    <script src="bootstrap/js/bootstrap-datepicker.js"></script>
    <script src="bootstrap/js/scrollax.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="bootstrap/js/google-map.js"></script>
    <script src="bootstrap/js/main.js"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>