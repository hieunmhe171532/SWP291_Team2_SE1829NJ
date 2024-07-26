<%-- 
    Document   : rooms
    Created on : May 19, 2024, 6:29:46 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            /* Body */
            .container {
                display: grid;
                grid-template-columns: auto;
                gap: 0px;
            }

            hr {
                height: 1px;
                background-color: rgba(16, 86, 82, .75);
                ;
                border: none;
            }

            .card {
                width: 400px;
                background: rgb(255, 250, 235);
                box-shadow: 0px 187px 75px rgba(0, 0, 0, 0.01), 0px 105px 63px rgba(0, 0, 0, 0.05), 0px 47px 47px rgba(0, 0, 0, 0.09), 0px 12px 26px rgba(0, 0, 0, 0.1), 0px 0px 0px rgba(0, 0, 0, 0.1);
            }

            .title {
                width: 100%;
                height: 40px;
                position: relative;
                display: flex;
                align-items: center;
                padding-left: 20px;
                border-bottom: 1px solid rgba(16, 86, 82, .75);
                ;
                font-weight: 700;
                font-size: 11px;
                color: #000000;
            }

            /* Cart */
            .cart {
                border-radius: 19px 19px 0px 0px;
            }

            .cart .steps {
                display: flex;
                flex-direction: column;
                padding: 20px;
            }

            .cart .steps .step {
                display: grid;
                gap: 10px;
            }

            .cart .steps .step span {
                font-size: 13px;
                font-weight: 600;
                color: #000000;
                margin-bottom: 8px;
                display: block;
            }

            .cart .steps .step p {
                font-size: 11px;
                font-weight: 600;
                color: #000000;
            }

            /* Promo */
            .promo form {
                display: grid;
                grid-template-columns: 1fr 80px;
                gap: 10px;
                padding: 0px;
            }

            .input_field {
                width: auto;
                height: 36px;
                padding: 0 0 0 12px;
                border-radius: 5px;
                outline: none;
                border: 1px solid  rgb(16, 86, 82);
                background-color: rgb(251, 243, 228);
                transition: all 0.3s cubic-bezier(0.15, 0.83, 0.66, 1);
            }

            .input_field:focus {
                border: 1px solid transparent;
                box-shadow: 0px 0px 0px 2px rgb(251, 243, 228);
                background-color: rgb(201, 193, 178);
            }

            .promo form button {
                display: flex;
                flex-direction: row;
                justify-content: center;
                align-items: center;
                padding: 10px 18px;
                gap: 10px;
                width: 100%;
                height: 36px;
                background: rgba(16, 86, 82, .75);
                box-shadow: 0px 0.5px 0.5px #F3D2C9, 0px 1px 0.5px rgba(239, 239, 239, 0.5);
                border-radius: 5px;
                border: 0;
                font-style: normal;
                font-weight: 600;
                font-size: 12px;
                line-height: 15px;
                color: #000000;
            }

            /* Checkout */
            .payments .details {
                display: grid;
                grid-template-columns: 10fr 1fr;
                padding: 0px;
                gap: 5px;
            }

            .payments .details span:nth-child(odd) {
                font-size: 12px;
                font-weight: 600;
                color: #000000;
                margin: auto auto auto 0;
            }

            .payments .details span:nth-child(even) {
                font-size: 13px;
                font-weight: 600;
                color: #000000;
                margin: auto 0 auto auto;
            }

            .checkout .footer {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 10px 10px 10px 20px;
                background-color: rgba(16, 86, 82, .5);
            }

            .price {
                position: relative;
                font-size: 22px;
                color: #2B2B2F;
                font-weight: 900;
            }

            .checkout .checkout-btn {
                display: flex;
                flex-direction: row;
                justify-content: center;
                align-items: center;
                width: 150px;
                height: 36px;
                background: rgba(16, 86, 82, .55);
                box-shadow: 0px 0.5px 0.5px rgba(16, 86, 82, .75), 0px 1px 0.5px rgba(16, 86, 82, .75);
                ;
                border-radius: 7px;
                border: 1px solid rgb(16, 86, 82);
                ;
                color: #000000;
                font-size: 13px;
                font-weight: 600;
                transition: all 0.3s cubic-bezier(0.15, 0.83, 0.66, 1);
            }


        </style>

        <jsp:include page="layout/navbarmenu.jsp"/>
    <div class="container">
        <h1>Checkout</h1>
        <form action="checkout" method="POST">
            <input type="hidden" name="action" value="placeOrder">
            <div class="row">
                <div class="col-lg-5 col-md-5">
                    <h3>Chi tiết đơn hàng</h3>
                    <div class="row">
                        <div class="col-lg-12 mb-20">
                            <label>Tên account<span>*</span></label>
                            <input readonly="" value="${acc.username}" type="text">
                        </div>
                        <div class="col-lg-12 mb-20">
                            <label>Email <span>*</span></label>
                            <input readonly="" value="${acc.email}" type="text">
                        </div>
                        <div class="col-lg-12 mb-20">
                            <label>Địa chỉ<span>*</span></label>
                            <input required name="address"  value="${acc.address}" type="text">
                        </div>
                        <div class="col-lg-12 mb-20">
                            <label>Số điện thoại<span>*</span></label>
                            <input required name="phone"  value="${acc.phone}" type="number">
                        </div>


                    </div>
                </div>
                <div class="col-lg-7 col-md-7">
                    <div class="container">
                        <div class="card cart">
                            <div class="steps">
                                <div class="step">
                                    <span>Rooms</span>
                                    <div class="col-12 d-flex justify-content-center">
                                        <table border="1">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Quantity</th>
                                                    <th>Unit Price</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${cart.items}" var="item">
                                                    <tr>
                                                        <td>${item.room.name}</td>
                                                        <td>${item.quantity}</td>
                                                        <td>${fn:substringBefore(item.calculateCost(), ".")}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <hr>
                                    <div>
                                        <span>PAYMENT METHOD</span>
                                        <div class="panel-default">
                                            <input id="payment_defult" value="vnp" name="payment_method" type="radio" checked="" />
                                            <label for="payment_defult">
                                                Thanh toán bằng vnpay <img src="assets/img/icon/papyel.png" alt="">
                                            </label>
                                        </div>
                                    </div>
                                    <hr/>
                                    <div class="payments">
                                        <span>PAYMENT</span>
                                        <div class="details">
                                            <span>Subtotal:</span>
                                            <div class="d-flex"><span id="price" >${fn:substringBefore(cart.totalCost, ".")}    </span><span>đ</span></div> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card checkout">
                            <div class="footer">
                                <div class="d-flex"><label class="price" id="price" >${fn:substringBefore(cart.totalCost, ".")}</label><label class="price">đ</label></div> 
                                <button class="checkout-btn" type="submit">Booking</button>
                            </div>
                        </div>
                    </div>                    
                    
                </div>
            </div>
        </form>
    </div>

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
