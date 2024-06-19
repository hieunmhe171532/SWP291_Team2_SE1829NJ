<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="admin/images/user.png" width="50px"
                                                alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>${sessionScope.user.user_name}</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Bảng điều khiển</span></a></li>
                <li><a class="app-menu__item" href="roommanagement"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Manage room</span></a></li>
                <li><a class="app-menu__item" href="roomcreate"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Creat room</span></a></li>   
                          <li><a class="app-menu__item" href="accountmanagement"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Manage Account</span></a>
                </li>    
                            
                 <li><a class="app-menu__item" href="acccreate"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Create Account</span></a>
                </li>

            </ul>
        </aside>

<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách phòng</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>

  <div class="row">
    <div class="col-md-12">
        <div class="tile">
            <div class="tile-body">
                <div class="row element-button">
                    <div class="col-sm-2">
                        <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()">
                            <i class="fas fa-print"></i> Print Data
                        </a>
                    </div>
                </div>

                <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0" id="sampleTable">
                    <thead>
                        <tr>
                            <th>Room ID</th>
                            <th>Room Name</th>
                            <th>Status</th>
                            <th>User Quantity</th>
                            <th>Price</th>
                            <th>Edit</th>
                            <th>Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${rooms}" var="room">
                            <tr>
                                <td>${room.id}</td>
                                <td>${room.name}</td>
                                <td>${room.status}</td>
                                <td>${room.userQuantity}</td>
                                <td>${room.price}</td>
                                <td>
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Edit" data-toggle="modal" data-target="#ModalUP${room.id}">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-danger btn-sm delete" type="button" title="Delete" data-toggle="modal" data-target="#ModalDEL${room.id}">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                                <td>
                                    <button class="btn btn-info btn-sm more-details" type="button" title="More details" onclick="redirectToRoomDetails('${room.id}')">
                                        <i class="fas fa-info-circle"></i>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</main>








        <!-- Delete modal window -->






   


        <!-- Essential javascripts for application to work-->
        <script src="admin/js/jquery-3.2.1.min.js"></script>
        <script src="admin/js/popper.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="admin/js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="admin/js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="admin/js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="admin/js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>

                    </html>