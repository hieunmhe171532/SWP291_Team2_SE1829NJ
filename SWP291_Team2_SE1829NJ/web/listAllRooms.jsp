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
            .pagination {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }
            .pagination ul {
                list-style: none;
                padding: 0;
                display: flex;
                gap: 10px;
            }
            .pagination li {
                display: inline;
            }
            .pagination a {
                display: block;
                padding: 8px 16px;
                text-decoration: none;
                background-color: #007bff;
                color: #fff;
                border-radius: 4px;
                transition: background-color 0.3s;
            }
            .pagination a:hover {
                background-color: #0056b3;
            }
            .pagination .current a {
                background-color: #6c757d;
                cursor: default;
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
        <jsp:include page="layout/navbarmenu.jsp"/>

<!--        
  
     
     
        <!-- Shop area start -->
        <div class="shop_area shop_reverse">
            <div class="container">
                <div class="shop_inner_area">
                    <div class="row">
                        <div class="col-lg-3 col-md-12">
                            <!-- Sidebar widget start -->
                            <div class="sidebar_widget">
                                <div class="widget_list widget_categories">
                                    <h2>Room Types</h2>
                                    <ul>
                                        <li><a href="listroomforcus?action=all">All</a></li>
                                        <c:forEach items="${TypeRoomData}" var="t">
                                            <li><a href="listroomforcus?action=listByCategory&typeRoom_id=${t.id}">${t.name}</a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="widget_list">
                                    <h2>Filter by Floor</h2>
                                    <form action="listroomforcus" method="get">
                                        <input type="hidden" name="action" value="filterByFloor">
                                        <select name="room_floor" class="form-control">
                                            <option value="">Select Floor</option>
                                            <c:forEach var="floor" items="${floorList}">
                                                <option value="${floor}">${floor}</option>
                                            </c:forEach>
                                        </select>
                                        <button type="submit" class="btn btn-primary mt-2">Filter</button>
                                    </form>
                                </div>
                            </div>
                            <!-- Sidebar widget end -->
                        </div>
                        <div class="col-lg-9 col-md-12">
                            <!-- Shop wrapper start -->
                            <div class="shop_title">
                                <h2>Rooms</h2>
                                      <span style="font-size: 14px; font-weight: normal;">
                Nếu đoàn bạn đông và muốn thử dùng tool hỗ trợ thì vào 
                <a href="roomsearch" style="text-decoration: underline; color: #007bff;">đây</a>
            </span>
                            </div>
                            <div class="shop_toolbar_wrapper" style="border:none">
                                <div class="dropdown">
                                    <button style="color: #000; background-color: #ffffff;border:none; font-family: sans-serif;" class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Filter
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="listroomforcus?action=sort&type=low">Lowest to Highest Price</a>
                                        <a class="dropdown-item" href="listroomforcus?action=sort&type=high">Highest to Lowest Price</a>
                                        <a class="dropdown-item" href="listroomforcus?action=sort&type=a-z">Sort A-Z (alphabetically)</a>
                                    </div>
                                </div>
                            </div>
                            <div class="row shop_wrapper">
                                <c:forEach items="${RoomData}" var="room" varStatus="status">
                                    <div class="col-lg-4 col-md-6 col-12 mb-4">
                                        <div class="room-wrap d-md-flex ftco-animate">
                                            <div class="half left-arrow d-flex align-items-center">
                                                <div class="text p-4 text-center">
                                                    <h3>${room.name}</h3>
                                                    <p class="mb-0"><span class="price mr-1">${room.userQuantity}</span> <span class="per">person(s)</span></p>
                                                    <p class="mb-0"><span class="price mr-1">${room.area}</span> <span class="per">m²</span></p>
                                                    <p class="mb-0"><span class="price mr-1">${room.price}</span> <span class="per">per night</span></p>
                                                    <p class="pt-1"><a href="viewroom?rid=${room.id}" class="btn-custom px-3 py-2 rounded">View Details <span class="icon-long-arrow-right"></span></a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${status.count % 3 == 0}">
                                        <div class="w-100"></div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <c:set var="page" value="${page}"/>
                            <div class="shop_toolbar t_bottom">
                                <div class="pagination">
                                    <ul>
                                        <c:forEach begin="${1}" end="${num}" var="i">
                                            <li class="${i == page ? 'current' : ''}"><a href="listroomforcus?action=all&page=${i}">${i}</a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Shop area end -->
        
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
