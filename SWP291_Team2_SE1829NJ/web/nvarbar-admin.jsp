<%-- 
    Document   : nvarbar-admin
    Created on : 23 thg 5, 2024, 10:04:47
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nvabar</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
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
        <!--<link rel="stylesheet" href="bootstrap/css/style.css">-->
        <link rel="stylesheet" href="bootstrap/css/newcss.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="homepage"><i class='bx bx-log-out bx-rotate-180'></i> </a>

                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>

        <!--code item custom icon side bar-->
        <aside class="app-sidebar">
            <div class="app-sidebar__user"> <img class="app-sidebar__user-avatar" src="images/user.png" width="50px"
                                                 alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>${sessionScope.user.user_name}</b></p>
                    <p class="app-sidebar__user-designation">WELCOME TO HOME</p>
                </div>
            </div>
            <hr>

            <!--menu cac phan nho-->
            <ul class="app-menu">

                <li><a class="app-menu__item" href="viewcustomer"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">View Customer</span></a></li>
                <li><a class="app-menu__item" href="listmanageblog"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Blog Management</span></a>
                </li>
                <li><a class="app-menu__item" href="listmanagefeedback"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Feedback Management</span></a>
                </li>


            </ul>
        </aside>
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
    </body>
</html>
