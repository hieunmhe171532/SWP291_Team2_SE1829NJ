<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Room Details </title>
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
                    <p class="app-sidebar__user-designation">WELCOME TO HOME</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
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
<!--            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card">
                            
                           <div class="card-header">
                            <h2>Create Room</h2>
                            </div>
                                 <div class="card-body">
                            <form action="roomcreate" method="post">  Make sure to provide the correct action 
                                <div class="form-group">
                                    <label for="name">Room ID:</label>
                                    <input type="number" class="form-control" id="id" name="id" required>
                                </div>
                                <div class="form-group">
                                    <label for="name">Room Name:</label>
                                    <input type="text" class="form-control" id="name" name="name" required>
                                </div>
                                <div class="form-group">
                                    <label for="room_floor">Room Floor:</label>
                                    <input type="text" class="form-control" id="room_floor" name="room_floor" required>
                                </div>
                                <div class="form-group">
                                    <label for="image">Image URL:</label>
                                    <input type="text" class="form-control" id="image" name="image" required>
                                </div>
                                <div class="form-group">
                                    <label for="userQuantity">User Quantity:</label>
                                    <input type="number" class="form-control" id="userQuantity" name="userQuantity" required>
                                </div>
                                <div class="form-group">
                                    <label for="area">Area:</label>
                                    <input type="number" class="form-control" id="area" name="area" step="0.01" required>
                                </div>
                                <div class="form-group">
                                    <label for="price">Price:</Label>
                                    <input type="number" class="form-control" id="price" name="price" step="0.01" required>
                                </div>
                                <div class="form-group">
                                    <label for="status_id">Status:</label>
                                    <select class="form-control" id="status_id" name="status_id">
                                        <option value="1">Empty</option>
                                        <option value="2">Using</option>
                                        <option value="3">Booking</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="hotel_id">Hotel:</label>
                                    <select class="form-control" id="hotel_id" name="hotel_id">
                                        <option value="1">Bac </option>
                                        <option value="2">Trung</option>
                                        <option value="3">Nam</option>

                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="type_id">Room Type:</label>
                                    <select class="form-control" id="type_id" name="type_id">
                                        <option value="1">Normal</option>
                                        <option value="2">Vip</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="description">Description:</label>
                                    <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="isActive">Active:</label>
                                    <select class="form-control" id="isActive" name="isActive">
  <option value="true">Active</option>
                                            <option value="false">Inactive</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Create Room</button>
                            </form>
                        </div>
                    </div>
                    </div>
                </div>-->


 <div class="container">
        <div class="header">
            <h1>Room Details</h1>
        </div>
        <div>
            <h3>Room Information</h3>
            <table class="table table-striped">
                <tr>
                    <th>Room ID:</th>
                    <td>${room.id}</td>
                </tr>
                <tr>
                    <th>Room Name:</th>
                    <td>${room.name}</td>
                </tr>
                <tr>
                    <th>Room Floor:</th>
                    <td>${room.room_floor}</td>
                </tr>
       
                
                <tr>
                    <th>User Quantity:</th>
                    <td>${room.userQuantity}</td>
                </tr>
                <tr>
                    <th>Area (sqm):</th>
                    <td>${room.area}</td>
                </tr>
                <tr>
                    <th>Price:</th>
                    <td>${room.price}</td>
                </tr>
               <tr>
    <th>Status:</th>
    <td>
        <c:choose>
            <c:when test="${room.status == 1}">
                Empty
            </c:when>
            <c:when test="${room.status == 2}">
                Using
            </c:when>
            <c:when test="${room.status == 3}">
                Booking
            </c:when>
            <c:otherwise>
                Unknown
            </c:otherwise>
        </c:choose>
    </td>
</tr>
                <tr>
                    <th>Hotel:</th>
                    <td>${room.hotel.name}</td>
                </tr>
                <tr>
                    <th>Type of Room:</th>
                    <td>${room.typeRoom.name}</td>
                </tr>
                <tr>
                    <th>Description:</th>
                    <td>${room.description}</td>
                </tr>
                 <tr>
                        <th>Hình ảnh:</th>
                        <td>
                            <c:forEach var="image" items="${listImg}">
                                <img src="${image.img}" alt="Room Image" class="img-thumbnail" style="max-width: 150px; margin-right: 10px;"/>
                            </c:forEach>
                        </td>
                    </tr>
                <tr>
                    <th>Active:</th>
                    <td>${room.isActive ? 'Yes' : 'No'}</td>
                </tr>
            </table>
     <div class="buttons">
            <a href="roommanagement" class="btn btn-primary">Back to List</a>
            <button class="btn btn-primary btn-sm edit" type="button" title="Edit" data-toggle="modal"
                data-target="#ModalUP${room.id}">
                <i class="fas fa-edit"></i> Edit
            </button>
        </div>
        </main>





        
<div class="modal fade" id="ModalUP${room.id}" tabindex="-1" role="dialog" aria-labelledby="editRoomModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="roomedit" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="editRoomModalLabel">Edit Room - ID: ${room.id}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" value="${room.id}"> <!-- Hidden field to pass Room ID -->
                    <div class="form-group">
                        <label for="name${room.id}">Room Name:</label>
                        <input type="text" class="form-control" id="name${room.id}" name="name" value="${room.name}" required>
                    </div>
                    <div class="form-group">
                        <label for="room_floor${room.id}">Room Floor:</label>
                        <input type="text" class="form-control" id="room_floor${room.id}" name="room_floor" value="${room.room_floor}" required>
                    </div>
              
                    <div class="form-group">
                        <label for="userQuantity${room.id}">User Quantity:</label>
                        <input type="number" class="form-control" id="userQuantity${room.id}" name="userQuantity" value="${room.userQuantity}" required>
                    </div>
                    <div class="form-group">
                        <label for="area${room.id}">Area:</label>
                        <input type="number" class="form-control" id="area${room.id}" name="area" value="${room.area}" step="0.01" required>
                    </div>
                    <div class="form-group">
                        <label for="price${room.id}">Price:</label>
                        <input type="number" class="form-control" id="price${room.id}" name="price" value="${room.price}" step="0.01" required>
                    </div>
                    <div class="form-group">
                        <label for="status_id${room.id}">Status:</label>
                        <select class="form-control" id="status_id${room.id}" name="status_id">
                            <option value="1" ${room.status == 1 ? 'selected' : ''}>Empty</option>
                            <option value="2" ${room.status == 2 ? 'selected' : ''}>Using</option>
                            <option value="3" ${room.status == 3 ? 'selected' : ''}>Booking</option>
                        </select>
                    </div>
                       <input type="hidden" name="hotel_id" value="${room.hotel.id}"> <!-- Hidden field to pass Hotel ID -->

              <div class="form-group">
    <label for="type_id${room.id}">Room Type:</label>
    <select class="form-control" id="type_id${room.id}" name="type_id">
        <option value="1" ${room.typeRoom.id == 1 ? 'selected' : ''}>Normal</option>
        <option value="2" ${room.typeRoom.id == 2 ? 'selected' : ''}>vippro</option>
    </select>
</div>

                    <div class="form-group">
                        <label for="description${room.id}">Description:</label>
                        <textarea class="form-control" id="description${room.id}" name="description" rows="3">${room.description}</textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</div>










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
     
            };                 var ctxl = $("#lineChartDemo").get(0).getContext("2d");
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
                                 </script    > 



                    < / body>
 

                                        
                    <script>
                                    function redirectToAccDetails(username) {
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