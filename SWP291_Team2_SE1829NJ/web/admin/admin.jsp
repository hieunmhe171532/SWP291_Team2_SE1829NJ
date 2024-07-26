<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
                            class="app-menu__label">Bảng điều khiển</span></a></li>
                <li><a class="app-menu__item" href="accountmanagement"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Manage Account</span></a></li>
                <li><a class="app-menu__item" href="acccreate"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Create Account</span></a>
                </li>
                <li><a class="app-menu__item" href="roommanagement"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Manage Room</span></a></li>
                <li><a class="app-menu__item" href="roomcreate"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Create Room</span></a>
                </li>
                <li><a class="app-menu__item" href="viewcustomer"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">View Customer</span></a></li>
                <li><a class="app-menu__item" href="listmanageblog"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Blog Management</span></a>
                </li>
                <li><a class="app-menu__item" href="listmanagefeedback"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Feedback Management</span></a>
                </li>
                <c:choose>
                    <c:when test="${sessionScope.acc != null}">
                        <c:if test="${fn:toUpperCase(sessionScope.acc.role_id) == '1'}">


                            <li><a class="app-menu__item" href="dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
                                        class="app-menu__label">Bảng điều khiển</span></a></li>

                            <li><a class="app-menu__item" href="accountmanagement"><i
                                        class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Manage Account</span></a>
                            </li>    

                            <li><a class="app-menu__item" href="acccreate"><i
                                        class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Create Account</span></a>
                            </li>


                            <li><a class="app-menu__item" href="roommanagement"><i class='app-menu__icon bx bx-user-voice'></i><span
                                        class="app-menu__label">Manage room</span></a></li>
                                        
                                        
                            <li><a class="app-menu__item" href="roomcreate"><i class='app-menu__icon bx bx-user-voice'></i><span
                                        class="app-menu__label">Creat room</span></a></li>   


                            <li><a class="app-menu__item" href="viewcustomer"><i class='app-menu__icon bx bx-tachometer'></i><span
                                        class="app-menu__label">View Customer</span></a></li>



                            <li><a class="app-menu__item" href="listmanageblog"><i
                                        class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Blog Management</span></a>
                            </li>
                            <li><a class="app-menu__item" href="listmanagefeedback"><i
                                        class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Feedback Management</span></a>
                            </li>



                        </c:if>
                            
                                  <c:if test="${fn:toUpperCase(sessionScope.acc.role_id) == '2'}">


                            <li><a class="app-menu__item" href="dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
                                        class="app-menu__label">Bảng điều khiển</span></a></li>


                            <li><a class="app-menu__item" href="roommanagement"><i class='app-menu__icon bx bx-user-voice'></i><span
                                        class="app-menu__label">Manage room</span></a></li>
                                        
                                        
                            <li><a class="app-menu__item" href="roomcreate"><i class='app-menu__icon bx bx-user-voice'></i><span
                                        class="app-menu__label">Creat room</span></a></li>   


                            <li><a class="app-menu__item" href="viewcustomer"><i class='app-menu__icon bx bx-tachometer'></i><span
                                        class="app-menu__label">View Customer</span></a></li>



                            <li><a class="app-menu__item" href="listmanageblog"><i
                                        class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Blog Management</span></a>
                            </li>
                            <li><a class="app-menu__item" href="listmanagefeedback"><i
                                        class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Feedback Management</span></a>
                            </li>



                        </c:if>
                           
             <c:if test="${fn:toUpperCase(sessionScope.acc.role_id) == '4'}">


              
                            <li><a class="app-menu__item" href="viewcustomer"><i class='app-menu__icon bx bx-tachometer'></i><span
                                        class="app-menu__label">View Customer</span></a></li>



                            <li><a class="app-menu__item" href="listmanageblog"><i
                                        class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Blog Management</span></a>
                            </li>
                            <li><a class="app-menu__item" href="listmanagefeedback"><i
                                        class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Feedback Management</span></a>
                            </li>



                        </c:if>
                            
                    </c:when>
                </c:choose>

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
                                    <!-- Dashboard Widgets... -->

                                    <div class="col-md-12">
                                        <div class="tile">
                                            <h3 class="tile-title">List Orders Today</h3>
                                            <div>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Booking ID</th>
                                                            <th>Customer Name</th>
                                                            <th>Phone Number</th>
                                                            <th>Creation Date</th>

                                                            <th>Room List</th>
                                                            <th>Total Amount</th>
                                                            <th>Payment Status</th>
                                                            <th>Payment Method</th>
                                                            <th>Details</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <c:forEach items="${bookingsTodayGroup}" var="booki">
                                                            <tr>
                                                                <td>${booki.BillID}</td>
                                                                <td>${booki.CustomerName}</td>
                                                                <td>${booki.PhoneNumber}</td>
                                                                <td>${booki.CreationDate}</td>
                                                                <td>${booki.RoomList}</td>
                                                                <td id="price">${fn:substringBefore(booki.TotalAmount, ".")}</td>
                                                                <td>${booki.TotalAmount}</td>
                                                                <td><span class="badge bg-success">${booki.PaymentStatus}</td>
                                                                <td>${booki.PaymentMethod}</td>
                                                                <td>
                                                                    <button class="btn btn-danger btn-sm " type="button" title="Viewdetail" data-toggle="modal" data-target="#ModalDEL${booki.BillID}">
                                                                        <i class="fas fa-trash"></i>
                                                                    </button>

                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="tile">
                                            <h3 class="tile-title">List All Orders</h3>
                                            <div>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Bill ID</th>
                                                            <th>Customer Name</th>
                                                            <th>Phone Number</th>
                                                            <th>Creation Date</th>
                                                            <th>Room List</th>
                                                            <th>Total Amount</th>
                                                            <th>Payment Status</th>
                                                            <th>Payment Method</th>
                                                            <th>Note</th>
                                                            <th>Funtion</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="bill" items="${allBookingsGroup}">
                                                            <tr>
                                                                <td>${bill.BillID}</td>
                                                                <td>${bill.CustomerName}</td>
                                                                <td>${bill.PhoneNumber}</td>
                                                                <td>${bill.CreationDate}</td>
                                                                <td>${bill.RoomList}</td>
                                                                <td id="price">${bill.TotalAmount}</td>
                                                                <td>${bill.TotalAmount}</td>
                                                                <td><span class="badge bg-success">${bill.PaymentStatus}</td>
                                                                <td>${bill.PaymentMethod}</td>
                                                                <td>
                                                                    <button class="btn btn-danger btn-sm " type="button" title="Viewdetail" data-toggle="modal" data-target="#ModalDEL${booki.BillID}">
                                                                        <i class="fas fa-trash"></i>
                                                                    </button>                             
                                                                </td>
                                                                <td>
                                                                    <form action="dashboard" method="post" style="display: inline;">
                                                                        <input type="hidden" name="billId" value="${bill.BillID}" />
                                                                        <input type="hidden" name="newPaymentMode" value="${bill.PaymentStatus == 'Paid' ? false : true}" />
                                                                        <button type="submit" class="badge bg-success" style="color: rgb(245, 157, 57); background-color: rgb(251, 226, 197); padding: 5px; border-radius: 5px;">
                                                                            <i class="fa"></i> ChanStt
                                                                        </button>
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="tile">
                                            <h3 class="tile-title">Boooking Today</h3>
                                            <div>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Booking ID</th>
                                                            <th>Customer Name</th>
                                                            <th>Phone Number</th>
                                                            <th>Creation Date</th>
                                                            <th>Start Date</th>
                                                            <th>End Date</th>
                                                            <th>Room List</th>
                                                            <th>Total Amount</th>
                                                            <th>Payment Status</th>
                                                            <th>Payment Method</th>
                                                            <th>Details</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${bookingsToday}" var="bookingtoday">
                                                            <tr>
                                                                <td>${bookingtoday.billId}</td>
                                                                <td>${bookingtoday.customerName}</td>
                                                                <td>${bookingtoday.phoneNumber}</td>
                                                                <td>${bookingtoday.creationDate}</td>
                                                                <td>${bookingtoday.startDate}</td>
                                                                <td>${bookingtoday.endDate}</td>
                                                                <td>${bookingtoday.roomList}</td>
                                                                <td id="price">${bookingtoday.totalAmount}</td>
                                                                <td>${bookingtoday.totalAmount}</td>
                                                                <td><span class="badge bg-success">${bookingtoday.paymentStatus}</span></td>
                                                                <td>${bookingtoday.paymentMethod}</td>
                                                                <td>
                                                                    <a href="#" class="order-details-link" data-bill-id="${bookingtoday.billId}" data-toggle="modal" data-target="#orderDetailsModal" style="color: rgb(245, 157, 57); background-color: rgb(251, 226, 197); padding: 5px; border-radius: 5px;">
                                                                        <i class="fa"></i> Order Details
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="tile">
                                            <h3 class="tile-title">Total Boooking </h3>
                                            <div>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Booking ID</th>
                                                            <th>Customer Name</th>
                                                            <th>Phone Number</th>
                                                            <th>Creation Date</th>
                                                            <th>Start Date</th>
                                                            <th>End Date</th>
                                                            <th>Room List</th>
                                                            <th>Total Amount</th>
                                                            <th>Payment Status</th>
                                                            <th>Payment Method</th>
                                                            <th>Details</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${allBookings}" var="booking">
                                                            <tr>
                                                                <td>${booking.billId}</td>
                                                                <td>${booking.customerName}</td>
                                                                <td>${booking.phoneNumber}</td>
                                                                <td>${booking.creationDate}</td>
                                                                <td>${booking.startDate}</td>
                                                                <td>${booking.endDate}</td>
                                                                <td>${booking.roomList}</td>
                                                                <td id="price">${booking.totalAmount}</td>
                                                                <td><span class="badge bg-success">${booking.paymentStatus}</span></td>
                                                                <td>${booking.paymentMethod}</td>
                                                                <td>
                                                                    <a href="#" class="order-details-link" data-bill-id="${booking.billId}" data-toggle="modal" data-target="#orderDetailsModal" style="color: rgb(245, 157, 57); background-color: rgb(251, 226, 197); padding: 5px; border-radius: 5px;">
                                                                        <i class="fa"></i> Order Details
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    </div>

                                    <div class="col-md-12">
                                        <div class="tile">
                                            <h3 class="tile-title">Total Boooking </h3>
                                            <div>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Booking ID</th>
                                                            <th>Customer Name</th>
                                                            <th>Phone Number</th>
                                                            <th>Creation Date</th>
                                                            <th>Start Date</th>
                                                            <th>End Date</th>
                                                            <th>Room List</th>
                                                            <th>Total Amount</th>
                                                            <th>Payment Status</th>
                                                            <th>Payment Method</th>
                                                            <th>Details</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${allBookings}" var="booking">
                                                            <tr>
                                                                <td>${booking.billId}</td>
                                                                <td>${booking.customerName}</td>
                                                                <td>${booking.phoneNumber}</td>
                                                                <td>${booking.creationDate}</td>
                                                                <td>${booking.startDate}</td>
                                                                <td>${booking.endDate}</td>
                                                                <td>${booking.roomList}</td>
                                                                <td>${booking.totalAmount}</td>
                                                                <td><span class="badge bg-success">${booking.paymentStatus}</span></td>
                                                                <td>${booking.paymentMethod}</td>
                                                                <td>
                                                                    <a href="#" class="order-details-link" data-bill-id="${booking.billId}" data-toggle="modal" data-target="#orderDetailsModal" style="color: rgb(245, 157, 57); background-color: rgb(251, 226, 197); padding: 5px; border-radius: 5px;">
                                                                        <i class="fa"></i> Order Details
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- Modal Structure -->
                            <c:forEach items="${bookingsTodayGroup}" var="booki">
                                <         <div class="modal fade" id="ModalDEL${booki.BillID}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <form method="POST" action="accdelete">
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="form-group col-md-12">
                                                            <h5>${booki.CustomerName}  </h5>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-md-6">
                                                            <input type="hidden" name="username" value="${booki.BillID}">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">

                                                            <button class="btn btn-cancel" type="button" data-dismiss="modal">Cancel</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>


                            </c:forEach>

                            <c:forEach items="${allBookingsGroup}" var="booki222">
                                <         <div class="modal fade" id="ModalDEL${booki222.BillID}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <form method="POST" action="accdelete">
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="form-group col-md-12">
                                                            <h5>${booki222.CustomerName}  </h5>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-md-6">
                                                            <input type="hidden" name="username" value="${booki222.BillID}">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">

                                                            <button class="btn btn-cancel" type="button" data-dismiss="modal">Cancel</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>


                            </c:forEach>

                            <script>
                                $(document).ready(function () {
                                    $('.order-details-link').on('click', function () {
                                        var billId = $(this).data('bill-id');

                                        // Fetch the booking details based on the billId (this part may need to be adapted based on your backend logic)
                                        $.ajax({
                                            url: 'dashboard',
                                            type: 'GET',
                                            data: {
                                                action: 'getBillDetails',
                                                billId: billId
                                            },
                                            success: function (response) {
                                                // Assuming response contains the booking details
                                                var customerName = response.CustomerName;
                                                var phoneNumber = response.PhoneNumber;
                                                var bookingDate = response.CreationDate;
                                                var roomList = response.RoomList;
                                                var totalAmount = response.TotalAmount;
                                                var paymentStatus = response.PaymentStatus;
                                                var paymentMethod = response.PaymentMethod;

                                                // Update the modal with the customer details
                                                $('#modalCustomerName').text(customerName);
                                                $('#modalCustomerPhoneNumber').text(phoneNumber);
                                                $('#modalBookingDate').text(bookingDate);
                                                $('#modalRoomList').text(roomList);
                                                $('#modalTotalAmount').text(totalAmount);
                                                $('#modalPaymentStatus').text(paymentStatus);
                                                $('#modalPaymentMethod').text(paymentMethod);

                                                // Show the modal
                                                $('#customerDetailsModal').modal('show');
                                            }
                                        });
                                    });
                                });

                            </script>




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
                            <script>
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