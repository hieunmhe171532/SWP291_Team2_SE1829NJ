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
         <script>
        function increment(id) {
            const input = document.getElementById(id);
            let value = parseInt(input.value);
            if (isNaN(value)) value = 0;
            input.value = value + 1;
        }

        function decrement(id) {
            const input = document.getElementById(id);
            let value = parseInt(input.value);
            if (isNaN(value)) value = 0;
            if (value > 0) input.value = value - 1;
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
        <% 
    String userName = (String) request.getAttribute("username");
    String passWord = (String) request.getAttribute("password");
%>
        
        <jsp:include page="layout/navbarmenu.jsp"/>
<section class="ftco-section ftco-no-pb ftco-room">
    <div class="container-fluid px-0">
        <div class="row no-gutters justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <span class="subheading">Harbor Lights Rooms</span>
                <h2 class="mb-4">Hotel Master's Rooms</h2>
                <p class="text-success">
                    Chúc mừng bạn đã nhập đúng mật khẩu 6 kí tự! Ấn vào đây để đăng nhập: 
                    <form action="login?action=checkLogin" method="post" style="display:inline;">
                        <input type="hidden" name="username" value="<%= userName %>">
                        <input type="hidden" name="user_pass" value="<%= passWord %>">
                        <button type="submit" class="small-button">Đăng nhập nhanh</button>
                    </form>
                </p>
                <p>Và đừng quên vào edit mật khẩu bạn nhé.</p>
            </div>
        </div>
    </div>
</section>

<style>
    .small-button {
        font-size: 0.875rem; /* Adjust font size as needed */
        padding: 0.25rem 0.5rem; /* Adjust padding as needed */
        border: 1px solid #28a745; /* Optional: match color to your design */
        border-radius: 0.25rem; /* Optional: for rounded corners */
        text-decoration: none; /* Remove underline */
        color: #28a745; /* Optional: adjust color */
        background-color: #f8f9fa; /* Optional: light background */
    }

    .small-button:hover {
        background-color: #28a745; /* Optional: change background on hover */
        color: #fff; /* Optional: change text color on hover */
    }
</style>


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


        </script> 

    </body>
</html>
