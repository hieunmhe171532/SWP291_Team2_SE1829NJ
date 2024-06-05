<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <!--<link rel="stylesheet" href="../bootstrap/css/style.css">-->
        <link rel="stylesheet" href="../bootstrap/css/newcss.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <jsp:include page="nvarbar-admin.jsp"></jsp:include>


            <main class="app-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="app-title">
                            <ul class="app-breadcrumb breadcrumb">
                                <li class="breadcrumb-item"><a href="#"><b>Dashboard</b></a></li>
                            </ul>
                            <div id="clock"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <div class="row">
                            <!-- col-6 -->
                            <div class="col-md-6">
                                <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
                                    <div class="info">
                                        <h4>all users</h4>

                                        <!--<p class="info-tong">that all number users.</p>-->
                                        <p class="info-tong"> </p>
                                    </div>
                                </div>
                            </div>

                            <!-- col-6 -->

                            <div class="col-md-6">
                                <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
                                    <div class="info">
                                        <h4>Bills Booking</h4>
                                        <!--<p><b>${requestScope.bill} đơn hàng</b></p>-->
                                    <!--<p class="info-tong">All bill booking.</p>-->
                                    <p class="info-tong"> </p>
                                </div>
                            </div>
                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
                                <div class="info">
                                    <h4>All Blogs</h4>
                                    <!--<p><b>${requestScope.product} sản phẩm</b></p>-->
                                    <!--<p class="info-tong">Tổng số sản phẩm được quản lý.</p>-->
                                    <p class="info-tong"> </p>
                                </div>
                            </div>
                        </div>

                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small blogadmin coloured-icon"><i class='icon bx bxs-food-menu fa-3x'></i>
                                <div class="info">
                                    <h4>All Foods</h4>
                                    <!--<p><b>${requestScope.product} sản phẩm</b></p>-->
                                    <!--<p class="info-tong">Tổng số sản phẩm được quản lý.</p>-->
                                    <p class="info-tong"> </p>
                                </div>
                            </div>
                        </div>



                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small info coloured-icon"><i class='icon bx bx-building-house fa-3x'></i>
                                <div class="info">
                                    <h4>All Rooms</h4>
                                    <!--<p><b>${requestScope.product} sản phẩm</b></p>-->
                                    <p class="info-tong"> </p>
                                    <!--<p class="info-tong">Tổng số sản phẩm được quản lý.</p>-->
                                </div>
                            </div>
                        </div>

                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small danger coloured-icon"><i class='icon bx bxs-error-alt fa-3x'></i>
                                <div class="info">
                                    <h4>repairing room</h4>
                                    <!--<p><b>${requestScope.low} sản phẩm</b></p>-->
                                    <p class="info-tong"> </p>
                                    <!--<p class="info-tong">Số sản phẩm cảnh báo hết cần nhập thêm.</p>-->
                                </div>
                            </div>
                        </div>
                        <!-- col-4 -->
                        <div class="col-md-4">
                            <div class="widget-small emptyroom coloured-icon"><i class='icon bx bx-door-open fa-3x'></i>
                                <div class="info">
                                    <h4>Empty Room</h4>
                                    <!--<p><b>${requestScope.product} sản phẩm</b></p>-->
                                    <p class="info-tong"> </p>
                                </div>
                            </div>
                        </div>   
                        <!-- col-4 -->
                        <div class="col-md-4">
                            <div class="widget-small bookingroom coloured-icon"><i class='icon bx bx-calendar-check fa-3x'></i>
                                <div class="info">
                                    <h4>Booking Room</h4>
                                    <!--<p><b>${requestScope.product} sản phẩm</b></p>-->
                                    <p class="info-tong"> <p>
                                </div>
                            </div>
                        </div>   


                        <!-- col-4 -->
                        <div class="col-md-4">
                            <div class="widget-small usingroom coloured-icon"><i class='icon bx bx-user-check fa-3x'></i>
                                <div class="info">
                                    <h4>Using Room</h4>
                                    <!--<p><b>${requestScope.product} sản phẩm</b></p>-->
                                    <p class="info-tong"> </p>
                                </div>
                            </div>
                        </div>   



                        <!-- col-12 -->
                        <div class="col-md-12">
                            <div class="tile">
                                <h3 class="tile-title">Orders todays</h3>
                                <div>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ID Booking room</th>
                                                <th>Room name</th>
                                                <th>Name customer</th>
                                                <th>Phone numbers</th>
                                                <th>Gmails</th>
                                                <th>Address</th>
                                                <th>StartDate</th>
                                                <th>Enddate</th>
                                                <th>Fees</th>
                                                <th>Payment</th>
                                                <th>Functions</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!--                                            <c:forEach items="${billbyday}" var="b">
                                                                                            <tr>
                                                                                                <td>${b.bill_id}</td>
                                                                                                <td>${b.user.user_name}</td>
                                                                                                <td>(+84)${b.phone}</td>
                                                                                                <td>${b.address}</td>
                                                                                                <td>${b.date}</td>
                                                                                                <td>${b.total}</td>
                                                                                                <td><span class="badge bg-success">${b.payment}</span></td>                                  
                                                                                                <td><a style=" color: rgb(245 157 57);background-color: rgb(251 226 197); padding: 5px;border-radius: 5px;" href="ordermanager?action=showdetail&bill_id=${b.bill_id}"><i class="fa"></i>Chi tiết đơn hàng</a></td>
                                                                                            </tr>
                                            </c:forEach>
                                            -->
                                        </tbody>
                                    </table>
                                </div>
                                <!-- / div trống-->
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="tile">
                                <h3 class="tile-title">Orders totals</h3>
                                <div>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ID Booking room</th>
                                                <th>Room name</th>
                                                <th>Name customer</th>
                                                <th>Phone numbers</th>
                                                <th>Gmails</th>
                                                <th>Address</th>
                                                <th>StartDate</th>
                                                <th>Enddate</th>
                                                <th>Fees</th>
                                                <th>Payment</th>
                                                <th>Functions</th>
                                            </tr>
                                        </thead>

                                    </table>
                                </div>
                                <!-- / div trống-->
                            </div>
                        </div>
                        <!-- / col-12 -->

                    </div>
                </div>
            </div>



        </main>

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