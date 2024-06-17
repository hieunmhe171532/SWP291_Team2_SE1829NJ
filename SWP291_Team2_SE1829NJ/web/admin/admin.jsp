<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="admin/maincss/newcss.css">
<link rel="stylesheet" type="text/css" href="maincss/newcss.css">

                      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
     
                <link rel="stylesheet" type="text/css"
                      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
                <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">


    </head>

    <body onload="time()" class="app sidebar-mini rtl">
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
            <div class="app-sidebar__user"> <img class="app-sidebar__user-avatar" src="admin/images/user.png" width="50px"
                                                alt="User Image">
                <div>
                    <!--<p class="app-sidebar__user-name"><b>${sessionScope.user.user_name}</b></p>-->
                    <p class="app-sidebar__user-designation">WELCOME TO HOME</p>
                </div>
            </div>
            <hr>
            
            <!--menu cac phan nho-->
            <ul class="app-menu">

                <li><a class="app-menu__item" href="dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Dashboard</span></a></li>

                <li><a class="app-menu__item" href="ProductManagement?action=allproduct"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Rooms management</span></a>
                </li>

                <li><a class="app-menu__item" href="customermanager?action=getuser"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Accounts Management</span></a></li>
                <li><a class="app-menu__item" href="customermanager?action=getuser"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Staff Management</span></a></li>
                <li><a class="app-menu__item" href="customermanager?action=getuser"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Customer Management</span></a></li>
            <li><a class="app-menu__item" href="customermanager?action=getuser"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Blog Management</span></a></li>
   <li><a class="app-menu__item" href="customermanager?action=getuser"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Foods Management</span></a></li>

            </ul>
        </aside>
        
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
                                 <p><b>${requestScope.totalUser} users</b></p>
                                    <!--<p class="info-tong">that all number users.</p>-->
                                            <!--<p class="info-tong"> </p>-->
                                </div>
                            </div>
                        </div>

                        <!-- col-6 -->

                        <div class="col-md-6">
                            <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
                                <div class="info">
                                    <h4>Bills Booking</h4>
                                    <p><b>${requestScope.totalBill} bills</b></p>
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
                                    <p><b>${requestScope.totalBlog} blogs</b></p>
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
                                    <p><b>${requestScope.totalFood} dish</b></p>
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
                                    <p><b>${requestScope.totalRoom} rooms</b></p>
                                            <p class="info-tong"> </p>
                                    <!--<p class="info-tong">Tổng số phong được quản lý.</p>-->
                                </div>
                            </div>
                        </div>
                                  
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small danger coloured-icon"><i class='icon bx bxs-error-alt fa-3x'></i>
                                <div class="info">
                                    <h4>repairing room</h4>
                                    <p><b>${requestScope.reRoom} rooms</b></p>
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
                                    <p><b>${requestScope.emRoom} rooms</b></p>
                                    <p class="info-tong"> </p>
                                </div>
                            </div>
                        </div>   
                        <!-- col-4 -->
                        <div class="col-md-4">
                            <div class="widget-small bookingroom coloured-icon"><i class='icon bx bx-calendar-check fa-3x'></i>
                                <div class="info">
                                    <h4>Booking Room</h4>
                                    <p><b>${requestScope.boRoom} rooms</b></p>
                                    <p class="info-tong"> <p>
                                </div>
                            </div>
                        </div>   


                        <!-- col-4 -->
                        <div class="col-md-4">
                            <div class="widget-small usingroom coloured-icon"><i class='icon bx bx-user-check fa-3x'></i>
                                <div class="info">
                                    <h4>Using Room</h4>
                                    <p><b>${requestScope.usRoom} rooms</b></p>
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

                                                <th>Address</th>
                                                <th>StartDate</th>
                                                <th>Enddate</th>
                                                <th>Fees</th>
                                                <th>Payment</th>
                                                <th>Functions</th>

                                            </tr>
                                        </thead>
                                        <tbody>

                                 
                                       <c:forEach items="${bookingByDay}" var="bBD">
                            <tr>
                                <td>${bBD.id}</td>
                                <td>${bBD.roomName}</td>
                                <td>${bBD.customerName}</td>
                                <td>${bBD.phoneNumber}</td>
                                <td>${bBD.address}</td>
                                <td>${bBD.startDate}</td>
                                <td>${bBD.endDate}</td>
                                <td>${bBD.fees}</td>
                                <td><span class="badge bg-success">${bBD.paymentMode}</span></td>
                                <td>
                                    <a style="color: rgb(245, 157, 57); background-color: rgb(251, 226, 197); padding: 5px; border-radius: 5px;" href="ordermanager?action=showdetail&booking_id=${bBD.id}">
>
                                        <i class="fa"></i> Chi tiết đơn hàng
                                    </a>
                                </td>
                            </tr><!--
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
                                               <!--<th>Gmails</th>-->
                                                <th>Address</th>
                                                <th>StartDate</th>
                                                <th>Enddate</th>
                                                <th>Fees</th>
                                                <th>Payment</th>
                                                <th>Functions</th>
                                            </tr>
                                        </thead>
                                     <tbody>
<!--                       <!--                             <c:forEach items="${bookings}" var="booking">
-->                            <tr>
                                <td>${booking.id}</td>
                                <td>${booking.roomName}</td>
                                <td>${booking.customerName}</td>
                                <td>${booking.phoneNumber}</td>
                                <td>${booking.address}</td>
                                <td>${booking.startDate}</td>
                                <td>${booking.endDate}</td>
                                <td>${booking.fees}</td>
                                <td><span class="badge bg-success">${booking.paymentMode}</span></td>
                                <td>
                                    <a style="color: rgb(245, 157, 57); background-color: rgb(251, 226, 197); padding: 5px; border-radius: 5px;" href="ordermanager?action=showdetail&booking_id=${booking.id}">
>
                                        <i class="fa"></i> Chi tiết đơn hàng
                                    </a>
                                </td>
                            </tr><!--
                        </c:forEach>
                                            -->
                                        </tbody>
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
      <script src="admin/js/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="admin/js/popper.min.js"></script>
        <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
        <!--===============================================================================================-->
        <script src="admin/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="admin/js/main.js"></script>
        <!--===============================================================================================-->
        <script src="admin/js/plugins/pace.min.js"></script>
        <!--===============================================================================================-->
        <!--===============================================================================================-->
        <script type="text/javascript">
                            var data = {
                                labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
                                datasets: [{
                                        ill: "rgb(255, 212, 59)",
                                        pointHighlightStroke: "rgb(255, 212, 59)",
                                        data: [20, 59, 90, 51, 56, 100]
                                    },
                                    {
                                        label: "Dữ liệu kế tiếp",
                                        fillColor: "rgba(9, 109, 239, 0.651)  ",
                                        pointColor: "rgb(9, 109, 239)",
                                        strokeColor: "rgb(9, 109, 239)",
                                        pointStrokeColor: "rgb(9, 109, 239)",
                                        pointHighlightFill: "rgb(9, 109, 239)",
                                        pointHighlightStroke: "rgb(9, 109, 239)",
                                        data: [48, 48, 49, 39, 86, 10]
                                    }
                                ]
                            };
                            var ctxl = $("#lineChartDemo").get(0).getContext("2d");
                            var lineChart = new Chart(ctxl).Line(data);

                            var ctxb = $("#barChartDemo").get(0).getContext("2d");
                            var barChart = new Chart(ctxb).Bar(data);
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
                    dd = '0' + dd;
                }
                if (mm < 10) {
                    mm = '0' + mm;
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


    </body>

</html>