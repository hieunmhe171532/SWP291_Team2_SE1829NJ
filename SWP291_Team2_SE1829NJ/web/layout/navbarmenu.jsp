
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!--   <style>
.nav-item .nav-link {
    display: inline-block;
    padding: 5px 15px; /* Thêm padding */
    border: 1px solid #ccc; /* Viền màu xám nhạt */
    border-radius: 20px; /* Bo cong viền */
    background-color: #fff; /* Màu nền trắng */
    color: #333; /* Màu chữ */
    transition: background-color 0.3s; /* Hiệu ứng khi hover */
}

.nav-item .nav-link:hover {
    background-color: #f8f9fa; /* Thay đổi màu nền khi hover */
    color: #000; /* Thay đổi màu chữ khi hover */
}

.nav-item .nav-link i {
    margin-right: 5px; /* Khoảng cách giữa icon và chữ */
}
</style>-->


<div class="offcanvas_menu">
    <div class="canvas_open">
        <a href="javascript:void(0)"><i class="ion-navicon"></i></a>
    </div>

    <!--Offcanvas menu area end-->

    <!--header top start-->


    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="homepage"><span>MoonLight</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>

            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active"><a href="homepage" class="nav-link">Home</a></li>
                    <li class="nav-item"><a href="listroomforcus" class="nav-link">List Room</a></li>
                      <li class="nav-item"><a href="roomsearch" class="nav-link">Tool search</a></li>
                    <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
                    <li class="nav-item"><a href="aboutus.jsp" class="nav-link">About Us</a></li>
                    <li class="nav-item"><a href="listblog" class="nav-link">Blog</a></li>

                    <c:choose>
                        <c:when test="${sessionScope.acc != null}">
                            <!-- User Dropdown -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/fox.jpg" width="40" height="40" class="rounded-circle">
                                </a>
                                <div class="dropdown-menu" aria-labelledby="userDropdownMenuLink">
                                    <a class="dropdown-item" >${sessionScope.acc.username}</a>
                                    <a class="dropdown-item" href="editprofile">Your Account</a>
                                    <a class="dropdown-item" href="login?action=logout">Logout</a>
                                    <c:if test="${fn:toUpperCase(sessionScope.acc.role_id) == '1'}">
                                        
                                      <a class="dropdown-item" href="dashboard">DashBoard</a
                                        
                                        
                                    </c:if>
                                            <c:if test="${fn:toUpperCase(sessionScope.acc.role_id) == '2'}">
                                        <a class="dropdown-item" href="dashboard">DashBoard</a>
                                      
                                            </c:if>
                                        
                                        
                                    <c:if test="${fn:toUpperCase(sessionScope.acc.role_id) == '4'}">
                                        <a class="dropdown-item" href="viewcustomer">Marketer Management</a>

                                    </c:if>

                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <!-- Login Dropdown -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="loginDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Login
                                </a>
                                <div class="dropdown-menu" aria-labelledby="loginDropdownMenuLink">
                                    <a class="dropdown-item" href="login.jsp">Login</a>

                                </div>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    <li class="nav-item">
                        <a href="cart?action=showcart" class="nav-link">
                            <i class="fa fa-shopping-basket"></i> ${sessionScope.size} Basket
                        </a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>

    <div class="hero">
        <section class="home-slider owl-carousel">
            <div class="slider-item" style="background-image:url(bootstrap/images/bg_1.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row no-gutters slider-text align-items-center justify-content-end">
                        <div class="col-md-6 ftco-animate">
                            <div class="text">
                                <h2>More than a hotel... an experience</h2>
                                <h1 class="mb-3">Hotel for the whole family, all year round.</h1>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row no-gutters slider-text d-flex align-itemd-center justify-content-center">

                        </div>
                    </div>
                </div>
            </div>

            <div class="slider-item" style="background-image:url(bootstrap/images/bg_2.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row no-gutters slider-text align-items-center justify-content-end">
                        <div class="col-md-6 ftco-animate">
                            <div class="text">
                                <h2>Harbor Lights Hotel &amp; Resort</h2>
                                <h1 class="mb-3">It feels like staying in your own home.</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>




</header>
<script>
    var greeting = "${greeting}";
    var i = 0;

    function typeWriter() {
        if (i < greeting.length) {
            document.getElementById("greeting").innerHTML += greeting.charAt(i);
            i++;
            setTimeout(typeWriter, 50);
        }
    }

    typeWriter();
</script>
<script type="text/javascript">
    //Thời Gian
    function time() {
        var today = new Date();
        var weekday = new Array(7);
        weekday[0] = "Chủ Nhật";
        weekday[1] = "Thứ Hai";
        weekday[2] = "Thứ Ba";
        weekday[3] = "Thứ Tư";
        weekday[4] = "Thứ Năm";
        weekday[5] = "Thứ Sáu";
        weekday[6] = "Thứ Bảy";
        var day = weekday[today.getDay()];
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();
        var h = today.getHours();
        var m = today.getMinutes();
        m = checkTime(m);
        nowTime = h + ":" + m + "";
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        today = day + ', ' + dd + '/' + mm + '/' + yyyy;
        tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                '</span>';
        document.getElementById("clock").innerHTML = tmp;
        clocktime = setTimeout("time()", "1000", "Javascript");

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }
    }
</script>
<script type="text/javascript">
// Call the getTimeString() function and set the text of the "clock" element to the result
    document.getElementById("clock").innerText = time();
</script>



