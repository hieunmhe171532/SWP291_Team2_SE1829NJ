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
                <li><a class="app-nav__item" href="accountmanagement"><i class='bx bx-log-out bx-rotate-180'></i> </a>

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
              <li><a class="app-menu__item" href="accountmanagement"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Quản lý Account</span></a></li>
                 <li><a class="app-menu__item" href="acccreate"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Create Account</span></a>
                </li>

            </ul>
        </aside>
        <main class="app-content">


            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="text-center">Create New Account</h4>
                            </div>
                            <div class="card-body">
                                <form action="acccreate" method="post">
                                    <div class="form-group">
                                        <label for="username">Username:</label>
                                        <input type="text" class="form-control" id="username" name="username" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password:</label>
                                        <input type="text" class="form-control" id="password" name="password" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Phone Number:</label>
                                        <input type="text" class="form-control" id="phone" name="phone" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email Address:</label>
                                        <input type="email" class="form-control" id="email" name="email" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="role">Role:</label>
                                        <select class="form-control" id="role" name="role" required>
                                            <option value="1">Admin</option>
                                            <option value="2">Manager</option>
                                            <option value="3">Marketer</option>
                                            <option value="4">Staff</option>
                                            <option value="5">Customer</option>
                                            <!-- Add more options as needed -->
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="isActive">Active:</label>
                                        <select class="form-control" id="isActive" name="isActive" required>
                                            <option value="true">Active</option>
                                            <option value="false">Inactive</option>
                                            <!-- Adjust based on your application logic -->
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="fullname">Fullname:</label>
                                        <input type="text" class="form-control" id="fullname" name="fullname" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="dob">Date of Birth:</label>
                                        <input type="date" class="form-control" id="dob" name="dob" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="gender">Gender:</label>
                                        <select class="form-control" id="gender" name="gender" required>
                                            <option value="true">Male</option>
                                            <option value="false">Female</option>
                                            <!-- Adjust based on your application logic -->
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Address:</label>
                                        <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-block">Create Account</button>
                                </form>
                            </div>
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
        <script>
//            function deleteRow(r) {
//                var i = r.parentNode.parentNode.rowIndex;
//                document.getElementById("myTable").deleteRow(i);
//            }
//            jQuery(function () {
//                jQuery(".trash").click(function () {
//                    swal({
//                        title: "Cảnh báo",
//
//                        text: "Bạn có chắc chắn là muốn xóa nhân viên này?",
//                        buttons: ["Hủy bỏ", "Đồng ý"],
//                    })
//                            .then((willDelete) => {
//                                if (willDelete) {
//                                    swal("Đã xóa thành công.!", {
//
//                                    });
//                                }
//                            });
//                });
//            });

            //Thời Gian

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
            <script type="text/javascript">                             //Thời Gian
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
            </script            >

//
//$(document)            .re             ady(function() {
//    $('.delete            ').click(function() {
//        var ta            rget = $(this).data('target');
//        $(targ            et).modal('show');
//    });
//});

                    </body>



                    <script>
                                    function redir e ctToAccDetails(username) {
                    // Construct the URL with the username pa r ameter 
                    var url = "accdetail?username=" + encodeURIComponent(username);
            // Redirect to the URL
            window.location.href = url;
                                    }
</script>

                                    <script>
                                        $(document).ready(function () {
                    $('#togglePassword').click(function () {
            var passwordField = $('#password');
            var passwordFieldType = passwordField.attr('type');
            if (passwordFieldType === 'password') {
            passwordField.attr('type', 'text');
            $('#eyeIcon').removeClass('fa-eye').addClass('fa-eye-slash');
            } else {
            passwordField.attr('type', 'password');
            $('#eyeIcon').removeClass('fa-eye-slash').addClass('fa-eye');
            }
             });
                                            };);
</script>

   </html>