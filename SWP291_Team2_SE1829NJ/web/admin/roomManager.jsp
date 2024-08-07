<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                                        class="app-menu__label">DashBoard</span></a></li>

                            <li><a class="app-menu__item" href="accountmanagement"><i
                                        class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Manage Account</span></a>
                            </li>    

                            <li><a class="app-menu__item" href="acccreate"><i
                                        class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Create Account</span></a>
                            </li>


                            <li><a class="app-menu__item" href="roommanagement"><i class='app-menu__icon bx bx-user-voice'></i><span
                                        class="app-menu__label">Manage Room</span></a></li>
                                        
                                        
                            <li><a class="app-menu__item" href="roomcreate"><i class='app-menu__icon bx bx-user-voice'></i><span
                                        class="app-menu__label">Create Room</span></a></li>   


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
                                        class="app-menu__label">DashBoard</span></a></li>


                            <li><a class="app-menu__item" href="roommanagement"><i class='app-menu__icon bx bx-user-voice'></i><span
                                        class="app-menu__label">Manage Room</span></a></li>
                                        
                                        
                            <li><a class="app-menu__item" href="roomcreate"><i class='app-menu__icon bx bx-user-voice'></i><span
                                        class="app-menu__label">Create Room</span></a></li>   


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
                                        <th>Funtion</th>
                                        <th>Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${rooms}" var="room">
                                        <tr>
                                            <td>${room.id}</td>
                                            <td>${room.name}</td>

                                            <td>
                                                <c:choose>
                                                    <c:when test="${room.status == 1}">
                                                        Empty
                                                    </c:when>
                                                    <c:when test="${room.status == 2}">
                                                        Booking
                                                    </c:when>
                                                    <c:when test="${room.status == 3}">
                                                        Using
                                                    </c:when>

                                                </c:choose>
                                            </td>

                                            <td>${room.userQuantity}</td>
                                            <td id="price">${room.price}</td>
                                            <td>
                                                <button class="btn btn-primary btn-sm edit" type="button" title="Edit" data-toggle="modal" data-target="#ModalUP${room.id}">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-danger btn-sm delete" type="button" title="Delete" data-toggle="modal" data-target="#ModalDEL${room.id}">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                        <a href="viewroom?rid=${room.id}" class="btn btn-info btn-sm more-details" title="More details">
                                                    <i class="fas fa-camera"></i>
                                                </a>
                                                    
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

        <c:forEach items="${rooms}" var="room">
            <div class="modal fade" id="ModalDEL${room.id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <form method="POST" action="roomdelete"> <!-- Corrected action to 'deleteRoom' -->
                            <div class="modal-body">
                                <h5>Are you sure you want to delete this room?</h5>
                                <input type="hidden" name="id" value="${room.id}"> <!-- Corrected name to 'id' -->
                                <div class="form-group">
                                    <button class="btn btn-danger" type="submit">Delete</button>
                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Delete modal window -->
            <div class="modal fade" id="ModalUP${room.id}" tabindex="-1" role="dialog" aria-labelledby="editRoomModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form action="roomeditstatus" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editRoomModalLabel">Edit Room status - ID: ${room.id}</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="id" value="${room.id}"> <!-- Hidden field to pass Room ID -->
                                <div class="form-group">
                                    <label for="status_id${room.id}">Status:</label>
                                    <select class="form-control" id="status_id${room.id}" name="status_id">
                                        <option value="1" ${room.status == 1 ? 'selected' : ''}>Empty</option>
                                        <option value="2" ${room.status == 2 ? 'selected' : ''}>Booking</option>
                                        <option value="3" ${room.status == 3 ? 'selected' : ''}>Using</option>
                                    </select>
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


        </c:forEach>






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

                    
                    };                             var ctxl = $("#lineChartDemo").get(
                0).get
            Context("2d");                 var lineChart = new Chart(ctxl).Line(data);
            var ctxb = $("#barChartDemo").get(0).getContext("2d");
            var barChart = new Chart(ctxb).Bar(data) ; 
                </          sc ript>
                    <script type="text/javascript">                             //Thời Gian
                            function time() {
                    var today = new Date();
            var weekday = new Array(7);
      
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
            docu m ent.getElementBy I d("clo ck").innerHTML = tmp;
            clocktime = setTimeout("time()", "1000", "Javascript");
            function checkTime(i) {
            if (i < 10) {
            i = "0" + i;
            }
            return i;
            }
                     }
                    </script              >


                    </body>



                    <script>
                function redirectToRoomDetails(id) {
                    // Construct the URL with the username pa r ameter 
                    var url = "roomdetail?id=" + encodeURIComponent(id);
            // Redirect to the URL
            window.location.href = url;
                                }
            </script>
                                <script>;
                                    function formatPrice(price) {
                    return parseFloat(price).toLocaleString('en-US', {
                                    maximumFractionDigits: 2             });
                                    };
                                    // Select all elements with id 'price'
                                    const priceElements = document.querySelectorAll('#price');
                            
                                    // Loop through each element and format its content
                                priceElements.forEach(element => {
                    let price = element.textContent;
            element.textContent = formatPrice(price);
                                        });
                                        </script>

                    </html>