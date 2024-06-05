<%-- 
    Document   : rooms
    Created on : May 19, 2024, 6:29:46 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <title>Harborlights - Free Bootstrap 4 Template by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="../bootstrap/css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="../bootstrap/css/animate.css">

        <link rel="stylesheet" href="../bootstrap/css/owl.carousel.min.css">
        <link rel="stylesheet" href="../bootstrap/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="../bootstrap/css/magnific-popup.css">

        <link rel="stylesheet" href="../bootstrap/css/aos.css">

        <link rel="stylesheet" href="../bootstrap/css/ionicons.min.css">

        <link rel="stylesheet" href="../bootstrap/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="../bootstrap/css/jquery.timepicker.css">


        <link rel="stylesheet" href="../bootstrap/css/flaticon.css">
        <link rel="stylesheet" href="../bootstrap/css/icomoon.css">
        <link rel="stylesheet" href="../bootstrap/css/style.css">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="searchRooms">Harbor<span>lights</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a href="searchRooms" class="nav-link">Home</a></li>
                        <li class="nav-item active"><a href="searchRooms" class="nav-link">Our Rooms</a></li>
                        <li class="nav-item"><a href="restaurant.html" class="nav-link">Restaurant</a></li>
                        <li class="nav-item"><a href="about.html" class="nav-link">About Us</a></li>
                        <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
                        <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->
        <div class="hero-wrap" style="background-image: url('images/bg_3.jpg'); max-height: 400px">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text d-flex align-itemd-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
                        <div class="text">
                            <p class="breadcrumbs mb-2"><span class="mr-2"><a href="searchRooms">Home</a></span> <span>Restaurant</span></p>
                            <h1 class="mb-4 bread">Rooms</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section ftco-no-pb ftco-room">
            <div class="container-fluid px-0">
                <div class="row no-gutters justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <span class="subheading">Harbor Lights Rooms</span>
                        <h2 class="mb-4">Hotel Master's Rooms</h2>
                    </div>
                </div>  
                <div class="row no-gutters justify-content-center mb-5 pb-3">
                    <div class="sidebar-box" style="margin-left: 60px">
                        <form action="searchRooms" class="search-form">
                            <div class="form-group row">
                                <select class="select-wrap col-md-4" name="typeRoomId">
                                    <option value="">choose room</option>
                                    <c:forEach var="typeRoom" items="${typeRooms}">
                                        <option value="${typeRoom.id}"
                                                <c:if test="${typeRoom.id eq param.typeRoomId}"> selected="" </c:if>>
                                            ${typeRoom.name}
                                        </option>
                                    </c:forEach>
                                </select>
                                <select class="select-wrap col-md-3" name="priceRange">
                                    <option value="">Price</option>
                                    <option value="0-500.000" ${param.priceRange == '0-500.000' ? 'selected' : ''}>0 - 500.000đ</option>
                                    <option value="500.000-1.000.000" ${param.priceRange == '500.000-1.000.000' ? 'selected' : ''}>500.000đ - 1.000.000đ</option>
                                    <option value="1.000.000-2.000.000" ${param.priceRange == '1.000.000-2.000.000' ? 'selected' : ''}>1.000.000đ - 2.000.000đ</option>
                                    <option value="2.000.000-5.000.000" ${param.priceRange == '2.000.000-5.000.000' ? 'selected' : ''}>2.000.000đ - 5.000.000đ</option>
                                </select>
                                <select class="select-wrap col-md-3" name="userQuantity">
                                    <option value="">number of people</option>
                                    <option value="1" ${param.userQuantity == '1' ? 'selected' : ''}>1 person</option>
                                    <option value="2" ${param.userQuantity == '2' ? 'selected' : ''}>2 person</option>
                                    <option value="3" ${param.userQuantity == '3' ? 'selected' : ''}>3 person</option>
                                    <option value="4" ${param.userQuantity == '4' ? 'selected' : ''}>4 person</option>
                                    <option value="5+" ${param.userQuantity == '5+' ? 'selected' : ''}>5 person or more</option>
                                </select>
                                <button class="btn btn-primary col-md-1" type="submit">Search</button>
                            </div>
                        </form>
                    </div>
                </div>
                <c:if test="${not empty rooms}">
                    <div class="row no-gutters">
                        <c:forEach var="room" items="${rooms}">
                            <div class="col-lg-6">
                                <div class="room-wrap d-md-flex ftco-animate">
                                    <a href="room-detail?id=${room.id}" class="img" style="background-image: url(../bootstrap/images/${room.image});"></a>
                                    <div class="half left-arrow d-flex align-items-center">
                                        <div class="text p-4 text-center">
                                            <p class="mb-0"><span class="price mr-1">${room.userQuantity}</span> <span class="per">person(s)</span></p>
                                            <p class="mb-0"><span class="price mr-1">${room.area}</span> <span class="per">m</span></p>
                                            <p class="mb-0"><span class="price mr-1">${room.price}</span> <span class="per">per night</span></p>
                                            <h3 class="mb-3"><a href="room-detail?id=${room.image}">${room.name}</a></h3>
                                            <p class="pt-1"><a href="room-detail?id=${room.id}" class="btn-custom px-3 py-2 rounded">View Details <span class="icon-long-arrow-right"></span></a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>


            </div>
        </section>


        <footer class="ftco-footer ftco-section img" style="background-image: url(images/bg_4.jpg);">
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



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


        <script src="../bootstrap/js/jquery.min.js"></script>
        <script src="../bootstrap/js/jquery-migrate-3.0.1.min.js"></script>
        <script src="../bootstrap/js/popper.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <script src="../bootstrap/js/jquery.easing.1.3.js"></script>
        <script src="../bootstrap/js/jquery.waypoints.min.js"></script>
        <script src="../bootstrap/js/jquery.stellar.min.js"></script>
        <script src="../bootstrap/js/owl.carousel.min.js"></script>
        <script src="../bootstrap/js/jquery.magnific-popup.min.js"></script>
        <script src="../bootstrap/js/aos.js"></script>
        <script src="../bootstrap/js/jquery.animateNumber.min.js"></script>
        <script src="../bootstrap/js/bootstrap-datepicker.js"></script>
        <script src="../bootstrap/js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="../bootstrap/js/google-map.js"></script>
        <script src="../bootstrap/js/main.js"></script>

    </body>
</html>
