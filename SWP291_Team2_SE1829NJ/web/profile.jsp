<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Profile</title>
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
                <li class="breadcrumb-item active"><a href="#"><b>THÔNG TIN CHI TIẾT</b></a></li>
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
                                    <i class="fas fa-print"></i> In dữ liệu
                                </a>
                            </div>
                        </div>

                        <form action="profile" method="post">
                            <div class="form-group">
                                <label class="labels">Account Name</label>
                                <input type="text" class="form-control" name="username" value="${Account.username}" readonly>
                            </div>
                            <div class="form-group">
                                <label class="labels">Customer Name</label>
                                <input type="text" class="form-control" name="fullname" value="${Account.fullname}" required>
                            </div>
                            <div class="form-group">
                                <label class="labels">Date of Birth</label>
                                <input type="date" class="form-control" name="dob" value="${Account.dob}" required>
                            </div>
                            <div class="form-group">
                                <label class="labels">Phone</label>
                                <input type="text" class="form-control" name="phone" value="${Account.phone}" required>
                            </div>
                            <div class="form-group">
                                <label class="labels">Address</label>
                                <input type="text" class="form-control" name="address" value="${Account.address}" required>
                            </div>
                            <div class="form-group">
                                <label class="labels">Email</label>
                                <input type="email" class="form-control" name="email" value="${Account.email}" readonly>
                            </div>
                            <div class="form-group">
                                <label class="labels">Gender</label>
                                <select class="form-control" name="gender" required>
                                    <option value="true" ${Account.gender ? 'selected' : ''}>Male</option>
                                    <option value="false" ${!Account.gender ? 'selected' : ''}>Female</option>
                                </select>
                            </div>
                            <div class="text-center">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalUP${Account.username}">
                                    Edit Profile
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Modal Definition -->
    <div class="modal fade" id="ModalUP${Account.username}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <form method="POST" action="editprofile">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Account and User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="username" value="${Account.username}">
                        <div class="form-group">
                                    <label for="password${Account.username}">Password:</label>
                                    <input type="text" class="form-control" id="password${Account.username}" name="password" value="${Account.password}" placeholder="Enter new password">
                                    <small class="form-text text-muted">Leave blank to keep the current password.</small>
                                </div>
                        <div class="form-group">
                            <label for="phone${Account.username}">Phone Number:</label>
                            <input type="text" class="form-control" id="phone${Account.username}" name="phone" value="${Account.phone}" required>
                        </div>
                        <div class="form-group">
                            <label for="email${Account.username}">Email:</label>
                            <input type="email" class="form-control" id="email${Account.username}" name="email" value="${Account.email}" readonly>
                        </div>
                     <div class="form-group" style="display:none;">
    <label for="role${Account.username}">Role:</label>
    <select class="form-control" id="role${Account.username}" name="role">
        <option value="1" ${Account.role_id == 1 ? 'selected' : ''}>Admin</option>
        <option value="2" ${Account.role_id == 2 ? 'selected' : ''}>Manager</option>
        <option value="3" ${Account.role_id == 3 ? 'selected' : ''}>Marketer</option>
        <option value="4" ${Account.role_id == 4 ? 'selected' : ''}>Staff</option>
        <option value="5" ${Account.role_id == 5 ? 'selected' : ''}>Customer</option>
    </select>
</div>
<input type="hidden" name="role" value="${Account.role_id}">

                        <div class="form-group">
                            <label for="fullname${Account.username}">Fullname:</label>
                            <input type="text" class="form-control" id="fullname${Account.username}" name="fullname" value="${Account.fullname}" required>
                        </div>
                        <div class="form-group">
                            <label for="dob${Account.username}">Date of Birth:</label>
                            <input type="date" class="form-control" id="dob${Account.username}" name="dob" value="${Account.dob}">
                        </div>
                        <div class="form-group">
                            <label for="gender${Account.username}">Gender:</label>
                            <select class="form-control" id="gender${Account.username}" name="gender">
                                <option value="true" ${Account.gender ? 'selected' : ''}>Male</option>
                                <option value="false" ${!Account.gender ? 'selected' : ''}>Female</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="address${Account.username}">Address:</label>
                            <input type="text" class="form-control" id="address${Account.username}" name="address" value="${Account.address}" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Save changes</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Essential JavaScripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="admin/js/main.js"></script>
    <script>
        function time() {
            var today = new Date();
            var weekday = ["Chủ Nhật", "Thứ Hai", "Thứ Ba", "Thứ Tư", "Thứ Năm", "Thứ Sáu", "Thứ Bảy"];
            var day = weekday[today.getDay()];
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!
            var yyyy = today.getFullYear();
            var h = today.getHours();
            var m = today.getMinutes();
            m = checkTime(m);
            var nowTime = h + ":" + m;
            if (dd < 10) {
                dd = '0' + dd;
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
    </script>
</body>
</html>
