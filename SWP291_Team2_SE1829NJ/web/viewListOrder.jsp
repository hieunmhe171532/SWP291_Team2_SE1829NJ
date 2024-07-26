<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>THÔNG TIN CHI TIẾT VỀ List Order</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="admin/maincss/newcss.css">
        <link rel="stylesheet" type="text/css" href="maincss/newcss.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons/css/boxicons.min.css">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
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
                    <p class="app-sidebar__user-name"><b>${sessionScope.user.user_name}</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="editprofile"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Edit Profile</span></a></li>
                <li><a class="app-menu__item" href="vieworder"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">List booking of u here!</span></a></li>

            </ul>

        </aside>

        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>List Order của bạn ở đây nhé</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>

            <div class="tile">
                <h3 class="tile-title">List Order</h3>
                <div class="tile-body">
                    <table class="table table-hover table-bordered" id="orderTable">
                        <thead>
                            <tr>
                                <th>Mã booking</th>
                                <th>Ngày khởi tạo</th>
                                <th>Trạng thái trả</th>
                                <th>Hình thức GD</th>
                                <th>Startdate</th>
                                <th>Endate</th>
                                <th>Cost</th>
                                <th>Room</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orderList}">
                                <tr>
                                    <td>${order.idbooking}</td>
                                    <td>${order.daycreate}</td>
                                    <td>${order.PaymentStatus}</td>
                                    <td>${order.formpay}</td>
                                    <td>${order.startdate}</td>
                                    <td>${order.endate}</td>
                                    <td id="price">${fn:substringBefore(order.cost, ".")}</td>
                                    <td>${order.room}</td>



                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>

        <!-- Essential JavaScripts -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="admin/js/main.js"></script>
        <script>
        function time() {
            var today = new Date();
            v
            }
            if (mm < 10) {
                mm = '0' + mm;
            }
            today = day + ', ' + dd + '/' + mm + '/' + yyyy;
            document.getElementById("clock").innerHTML = '<span class="date">' + today + ' - ' + nowTime + '</span>';
            setTimeout(time, 1000);
        }
        function checkTime(i) {
            return (i < 10) ? "0" + i : i;
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
