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
        <link rel="stylesheet" href="bootstrap/css/custom.css"> <!-- Di chuyển CSS tùy chỉnh vào file custom.css -->
         
      <style>
            body {
                font-family: 'Nunito Sans', sans-serif;
            }
            .booking-container {
                max-width: 500px;
                margin: 20px auto;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }
            .booking-controls {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 10px;
            }
            .booking-controls span {
                flex: 1;
            }
            .booking-controls div {
                display: flex;
                align-items: center;
                 text-align: center;
            }
            .booking-controls button {
                width: 30px;
                height: 30px;
                font-size: 18px;
                margin: 0 5px;
                border: 1px solid #ccc;
                border-radius: 50%;
                background: #f9f9f9;
                cursor: pointer;
            }
            .booking-controls input {
             
                text-align: center;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin: 0 5px;
                font-size: 16px;
                  
            }
            .booking-footer {
                text-align: center;
            }
            .booking-footer button {
                padding: 10px 20px;
                font-size: 16px;
                background: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <jsp:include page="layout/navbarmenu.jsp"/>
      
       <section class="ftco-section ftco-no-pb ftco-room">
            <div class="d-flex justify-content-center">
                <div class="container-fluid px-0">
                    <div class="row no-gutters justify-content-center mb-5 pb-3">
                        <div class="col-md-7 heading-section text-center ftco-animate">
                            <span class="subheading">Harbor Lights Rooms</span>
                            <h2 class="mb-4">Hotel Master's Rooms</h2>
                        </div>
                    </div>
                    <div class="row no-gutters justify-content-center mb-5 pb-3">
                        <div class="sidebar-box" style="margin-left: 60px">
                            <form action="roomsearch" class="search-form">
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
                                </div>
                                <div class="form-group row booking-container">
                                    <div class="booking-controls">
                                        <span>Số người</span>
                                        <div>
                                            <button type="button" onclick="decrement('people')">-</button>
                                            <input type="text" id="people" name="people" value="2" readonly>
                                            <button type="button" onclick="increment('people')">+</button>
                                        </div>
                                    </div>
                                    <div class="booking-controls">
                                        <span>Số phòng</span>
                                        <div>
                                            <button type="button" onclick="decrement('rooms')">-</button>
                                            <input type="text" id="rooms" name="rooms" value="1" readonly>
                                            <button type="button" onclick="increment('rooms')">+</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row booking-footer">
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
                                    <a href="room-detail?id=${room.id}" class="img" style="background-image: url(bootstrap/images/${room.image});"></a>
                                    <div class="half left-arrow d-flex align-items-center">
                                        <div class="text p-4 text-center">
                                            <p class="mb-0"><span class="price mr-1">${room.userQuantity}</span> <span class="per">person(s)</span></p>
                                            <p class="mb-0"><span class="price mr-1">${room.area}</span> <span class="per">m</span></p>
                                            <p class="mb-0"><span class="price mr-1">${room.price}</span> <span class="per">per night</span></p>
                                            <h3 class="mb-3"><a href="room-detail?id=${room.image}">${room.name}</a></h3>
                                            <p class="pt-1"><a href="viewroom?rid=${room.id}" class="btn-custom px-3 py-2 rounded">View Details <span class="icon-long-arrow-right"></span></a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                </div>
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
        <script src="bootstrap/js/custom.js"></script> <!-- Di chuyển JS tùy chỉnh vào file custom.js -->
        <script >
             function increment(id) {
    let input = document.getElementById(id);
    input.value = parseInt(input.value) + 1;
}

function decrement(id) {
    let input = document.getElementById(id);
    if (parseInt(input.value) > 0) {
        input.value = parseInt(input.value) - 1;
    }
}

function confirmBooking(event) {
    event.preventDefault();
    const people = document.getElementById('people').value;
    const rooms = document.getElementById('rooms').value;
    alert(`Bạn đã đặt ${people} người và ${rooms} phòng.`);
    event.target.submit();
}

             
        </script> 

    </body>
</html>
