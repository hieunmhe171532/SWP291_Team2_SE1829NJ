<%-- 
    Document   : rooms
    Created on : May 19, 2024, 6:29:46 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <script>
            function increment(id) {
                const input = document.getElementById(id);
                let value = parseInt(input.value);
                if (isNaN(value))
                    value = 0;
                input.value = value + 1;
            }

            function decrement(id) {
                const input = document.getElementById(id);
                let value = parseInt(input.value);
                if (isNaN(value))
                    value = 0;
                if (value > 0)
                    input.value = value - 1;
            }

            function handleFormSubmit(event) {
                event.preventDefault();
                const peopleValue = document.getElementById('people').value;
                localStorage.setItem('peopleValue', peopleValue);
                event.target.submit();
            }

            function restoreFormValue() {
                const peopleValue = localStorage.getItem('peopleValue');
                if (peopleValue !== null) {
                    document.getElementById('people').value = peopleValue;
                }
            }

            document.addEventListener('DOMContentLoaded', restoreFormValue);
        </script>
    </head>
    <body>
        <jsp:include page="layout/navbarmenu.jsp"/>

        <section class="ftco-section ftco-no-pb ftco-room">
            <!--         <div class="d-flex justify-content-center">
                <div class="container-fluid px-0">
                    <div class="row no-gutters justify-content-center mb-5 pb-3">
                        <div class="col-md-7 heading-section text-center ftco-animate">
                            <span class="subheading">Harbor Lights Rooms</span>
                            <h2 class="mb-4">Hotel Master's Rooms</h2>
                            <p>Bạn đi mấy người nhỉ? Vui lòng điền vào form bên dưới để chúng tôi dự đoán.</p>
                        </div>
                    </div>
            
                    <div class="row no-gutters justify-content-center mb-5 pb-3">
                        <div class="sidebar-box" style="">
                            <form action="roomsearch" class="search-form">
                                <div class="form-group row booking-container justify-content-center align-items-center">
                                    <label for="people" class="col-form-label mr-3">Số Người</label>
                                    <div class="input-group col-auto  text-center">
                                        <div class="input-group-prepend ">
                                            <button type="button" class="btn btn-outline-secondary" onclick="decrement('people')">-</button>
                                        </div>
                                        <input type="text" id="people" name="people" value="0" readonly class="form-control text-center center">
                                        <div class="input-group-append">
                                            <button type="button" class="btn btn-outline-secondary" onclick="increment('people')">+</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row justify-content-center">
                                    <button class="btn btn-primary" type="submit">Search</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>-->


            <!--<div class="container-fluid px-0">
                <div class="row no-gutters justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <span class="subheading">Harbor Lights Rooms</span>
                        <h2 class="mb-4">Hotel Master's Rooms</h2>
                        <p>Bạn đi mấy người nhỉ? Vui lòng điền vào form bên dưới để chúng tôi dự đoán.</p>
                    </div>
                </div>
            
                <div class="row no-gutters justify-content-center mb-5 pb-3">
                    <div class="sidebar-box">
                        <form action="roomsearch" class="search-form">
                            <div class="form-group row booking-container justify-content-center align-items-center">
                                <label for="people" class="col-form-label mr-3">Số Người</label>
                                <div class="input-group col-auto text-center">
                                    <div class="input-group-prepend">
                                        <button type="button" class="btn btn-outline-secondary" onclick="decrement('people')">-</button>
                                    </div>
                                    <input type="text" id="people" name="people" value="0" readonly class="form-control text-center">
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-outline-secondary" onclick="increment('people')">+</button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row justify-content-center">
                                <button class="btn btn-primary" type="submit">Search</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>-->
            <div class="container-fluid px-0">
                <div class="row no-gutters justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <span class="subheading">Harbor Lights Rooms</span>
                        <h2 class="mb-4">Hotel Master's Rooms</h2>
                        <p>Bạn đi mấy người nhỉ? Vui lòng điền vào form bên dưới để chúng tôi dự đoán.</p>
                    </div>
                    <div class="col-md-7 heading-section text-center ftco-animate">

                        <span style="font-size: 14px; font-weight: normal;">
                            và Bạn không hài lòng? ấn vào đây dể quay lại
                            <a href="listroomforcus" style="text-decoration: underline; color: #007bff;">link back</a>
                        </span>
                    </div>
                </div>

                <div class="row no-gutters justify-content-center mb-5 pb-3">
                    <div class="sidebar-box">
                        <form action="roomsearch" class="search-form" onsubmit="handleFormSubmit(event)">
                            <div class="form-group row booking-container justify-content-center align-items-center">
                                <label for="people" class="col-form-label mr-3">Số Người</label>
                                <div class="input-group col-auto text-center">
                                    <div class="input-group-prepend">
                                        <button type="button" class="btn btn-outline-secondary" onclick="decrement('people')">-</button>
                                    </div>
                                    <input type="text" id="people" name="people" value="0" readonly class="form-control text-center" style="padding: 12px 16px;">
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-outline-secondary" onclick="increment('people')">+</button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row justify-content-center">
                                <button class="btn btn-primary" type="submit">Search</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <c:if test="${not empty rooms}">
                <div class="row no-gutters">
                    <c:forEach var="room" items="${rooms}">
                        <div class="col-lg-6">
                            <div class="room-wrap d-md-flex ftco-animate">

                                <div class="half left-arrow d-flex align-items-center">
                                    <div class="text p-4 text-center">
                                        <p class="mb-0"><span class="price mr-1">${room.userQuantity}</span> <span class="per">person(s)</span></p>
                                        <p class="mb-0"><span class="price mr-1">${fn:substringBefore(room.area, ".")}</span> <span class="per">m</span></p>
                                        <p class="mb-0"><span id="price" class="price mr-1">${fn:substringBefore(room.price, ".")}</span> <span class="per">per night</span></p>


                                        <p class="pt-1"><a href="viewroom?rid=${room.id}" class="btn-custom px-3 py-2 rounded">View Details <span class="icon-long-arrow-right"></span></a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>

        </section>

        <jsp:include page="layout/navbarfoot.jsp"/>
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

    </body>
</html>
