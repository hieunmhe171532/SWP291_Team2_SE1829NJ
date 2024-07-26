<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="admin/css/dataTables.bootstrap.min.css">
</head>

<body onload="time()" class="app sidebar-mini rtl">
    <!-- Navbar-->
    <header class="app-header">
        <!-- Sidebar toggle button-->
        <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
        <!-- Navbar Right Menu-->
        <ul class="app-nav">
            <!-- User Menu-->
            <li><a class="app-nav__item" href="homepage"><i class='bx bx-log-out bx-rotate-180'></i></a></li>
        </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
        <div class="app-sidebar__user">
            <img class="app-sidebar__user-avatar" src="admin/images/user.png" width="50px" alt="User Image">
            <div>
                <p class="app-sidebar__user-designation">WELCOME TO HOME</p>
            </div>
        </div>
        <hr>
        <ul class="app-menu">
            <c:choose>
                <c:when test="${sessionScope.acc != null}">
                    <c:if test="${fn:toUpperCase(sessionScope.acc.role_id) == '1'}">
                        <li><a class="app-menu__item" href="dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span class="app-menu__label">DashBoard</span></a></li>
                        <li><a class="app-menu__item" href="accountmanagement"><i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Manage Account</span></a></li>
                        <li><a class="app-menu__item" href="acccreate"><i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Create Account</span></a></li>
                        <li><a class="app-menu__item" href="roommanagement"><i class='app-menu__icon bx bx-user-voice'></i><span class="app-menu__label">Manage room</span></a></li>
                        <li><a class="app-menu__item" href="roomcreate"><i class='app-menu__icon bx bx-user-voice'></i><span class="app-menu__label">Create room</span></a></li>
                        <li><a class="app-menu__item" href="viewcustomer"><i class='app-menu__icon bx bx-tachometer'></i><span class="app-menu__label">View Customer</span></a></li>
                        <li><a class="app-menu__item" href="listmanageblog"><i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Blog Management</span></a></li>
                        <li><a class="app-menu__item" href="listmanagefeedback"><i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Feedback Management</span></a></li>
                    </c:if>
                    <c:if test="${fn:toUpperCase(sessionScope.acc.role_id) == '2'}">
                        <li><a class="app-menu__item" href="dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span class="app-menu__label">DashBoard</span></a></li>
                        <li><a class="app-menu__item" href="roommanagement"><i class='app-menu__icon bx bx-user-voice'></i><span class="app-menu__label">Manage room</span></a></li>
                        <li><a class="app-menu__item" href="roomcreate"><i class='app-menu__icon bx bx-user-voice'></i><span class="app-menu__label">Create room</span></a></li>
                        <li><a class="app-menu__item" href="viewcustomer"><i class='app-menu__icon bx bx-tachometer'></i><span class="app-menu__label">View Customer</span></a></li>
                        <li><a class="app-menu__item" href="listmanageblog"><i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Blog Management</span></a></li>
                        <li><a class="app-menu__item" href="listmanagefeedback"><i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Feedback Management</span></a></li>
                    </c:if>
                    <c:if test="${fn:toUpperCase(sessionScope.acc.role_id) == '4'}">
                        <li><a class="app-menu__item" href="viewcustomer"><i class='app-menu__icon bx bx-tachometer'></i><span class="app-menu__label">View Customer</span></a></li>
                        <li><a class="app-menu__item" href="listmanageblog"><i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Blog Management</span></a></li>
                        <li><a class="app-menu__item" href="listmanagefeedback"><i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Feedback Management</span></a></li>
                    </c:if>
                </c:when>
            </c:choose>
        </ul>
    </aside>

    <main class="app-content">
        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item active"><a href="#"><b>List Booking</b></a></li>
            </ul>
            <div id="clock"></div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-body">
                        <div class="row element-button">
                            <div class="col-sm-2">
                                <a class="btn btn-delete btn-sm print-file" type="button" title="Print" onclick="myApp.printTable()">
                                    <i class="fas fa-print"></i> Print Data
                                </a>
                            </div>
                        </div>

                        <ul class="nav nav-tabs" id="bookingTabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="booking-today-tab" data-toggle="tab" href="#bookingToday" role="tab" aria-controls="bookingToday" aria-selected="true">Booking Today</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="all-booking-tab" data-toggle="tab" href="#allBooking" role="tab" aria-controls="allBooking" aria-selected="false">All Booking</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="bookingTabsContent">
                            <div class="tab-pane fade show active" id="bookingToday" role="tabpanel" aria-labelledby="booking-today-tab">
                                <table class="table table-hover table-bordered js-copytextarea" id="bookingTodayTable">
                                    <thead>
                                        <tr>
                                            <th>No.BookId</th>
                                            <th>Order ID</th>
                                            <th>Customer Name</th>
                                            <th>Phone Number</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th>Room List</th>
                                            <th>Total Amount</th>
                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${bookingsToday}" var="bookingtoday" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>${bookingtoday.billId}</td>
                                                <td>${bookingtoday.customerName}</td>
                                                <td>${bookingtoday.phoneNumber}</td>
                                                <td>${bookingtoday.startDate}</td>
                                                <td>${bookingtoday.endDate}</td>
                                                <td>${bookingtoday.roomList}</td>
                                                <td id="price">${bookingtoday.totalAmount}</td>
                                          
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="allBooking" role="tabpanel" aria-labelledby="all-booking-tab">
                                <table class="table table-hover table-bordered js-copytextarea" id="allBookingTable">
                                    <thead>
                                        <tr>
                                            <th>No.BookId</th>
                                            <th>Order ID</th>
                                            <th>Customer Name</th>
                                            <th>Phone Number</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th>Room List</th>
                                            <th>Total Amount</th>
                                      
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${allBookings}" var="booking" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>${booking.billId}</td>
                                                <td>${booking.customerName}</td>
                                                <td>${booking.phoneNumber}</td>
                                                <td>${booking.startDate}</td>
                                                <td>${booking.endDate}</td>
                                                <td>${booking.roomList}</td>
                                                <td id="price">${booking.totalAmount}</td>
                                              
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal Structure -->
        <c:forEach items="${bookingsTodayGroup}" var="booki">
            <div class="modal fade" id="ModalDEL${booki.BillID}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <form method="POST" action="accdelete">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <h5>${booki.CustomerName}</h5>
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
            <div class="modal fade" id="ModalDEL${booki222.BillID}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <form method="POST" action="accdelete">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <h5>${booki222.CustomerName}</h5>
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
    </main>

    <script src="admin/js/jquery-3.2.1.min.js"></script>
    <script src="admin/js/popper.min.js"></script>
    <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
    <script src="admin/js/bootstrap.min.js"></script>
    <script src="admin/js/main.js"></script>
    <script src="admin/js/plugins/pace.min.js"></script>
    <script type="text/javascript" src="admin/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="admin/js/plugins/dataTables.bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#bookingTodayTable').DataTable({
                language: {
                    "decimal": "",
                    "emptyTable": "No data available in table",
                    "info": "Showing _START_ to _END_ of _TOTAL_ entries",
                    "infoEmpty": "Showing 0 to 0 of 0 entries",
                    "infoFiltered": "(filtered from _MAX_ total entries)",
                    "infoPostFix": "",
                    "thousands": ",",
                    "lengthMenu": "Show _MENU_ entries",
                    "loadingRecords": "Loading...",
                    "processing": "Processing...",
                    "search": "Search:",
                    "zeroRecords": "No matching records found",
                    "paginate": {
                        "first": "First",
                        "last": "Last",
                        "next": "Next",
                        "previous": "Previous"
                    },
                    "aria": {
                        "sortAscending": ": activate to sort column ascending",
                        "sortDescending": ": activate to sort column descending"
                    }
                }
            });
            $('#allBookingTable').DataTable({
                language: {
                    "decimal": "",
                    "emptyTable": "No data available in table",
                    "info": "Showing _START_ to _END_ of _TOTAL_ entries",
                    "infoEmpty": "Showing 0 to 0 of 0 entries",
                    "infoFiltered": "(filtered from _MAX_ total entries)",
                    "infoPostFix": "",
                    "thousands": ",",
                    "lengthMenu": "Show _MENU_ entries",
                    "loadingRecords": "Loading...",
                    "processing": "Processing...",
                    "search": "Search:",
                    "zeroRecords": "No matching records found",
                    "paginate": {
                        "first": "First",
                        "last": "Last",
                        "next": "Next",
                        "previous": "Previous"
                    },
                    "aria": {
                        "sortAscending": ": activate to sort column ascending",
                        "sortDescending": ": activate to sort column descending"
                    }
                }
            });
        });
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
