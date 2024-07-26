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
            <li class="breadcrumb-item active"><a href="#"><b>THONG TIN CHI TIET</b></a></li>
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

                <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
                       id="sampleTable">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Role ID</th> 
                            <th>Active</th>
                            <th>Fullname</th>
                            <th>Date of Birth</th>
                            <th>Gender</th>
                            <th>Address</th>
                            <th width="100">Functions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${acc1.username}</td>
                            <td>${acc1.password}</td>
                            <td>${acc1.phone}</td>
                            <td>${acc1.email}</td>
                            <td>${acc1.role_id}</td>
                            <td>${acc1.isActive ? 'Active' : 'Inactive'}</td>
                            <td>${acc1.fullname}</td>
                            <td>${acc1.dob}</td> <!-- Format as needed -->
                            <td>${acc1.gender ? 'Male' : 'Female'}</td>
                            <td>${acc1.address}</td>
                            <td>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" data-toggle="modal"
                                        data-target="#ModalUP${acc1.username}">
                                    <i class="fas fa-edit"></i>
                                </button>
                      
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>

</main>
                                    
                                    
       <div class="modal fade" id="ModalDEL${acc1.username}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <form method="POST" action="customermanager?action=deleteuser">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <h5>Are you sure you want to delete this user?</h5>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <input type="hidden" name="user_id" value="${acc1.username}">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <button class="btn btn-danger" type="submit">Delete</button>
                                        <button class="btn btn-cancel" type="button" data-dismiss="modal">Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>





            <!-- Delete modal window -->
   
    <!-- Modal for editing product -->
<!--  <div class="modal fade" id="ModalUP${p.product_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
             
                    <form method="post" action="ProductManagement?action=updateproduct">
                        <div class="row">
                            <div class="form-group col-md-12">
                                <span class="thong-tin-thanh-toan">
                                    <h5>Chỉnh sửa thông tin account</h5>
                                </span>
                            </div>
                        </div>
                         Form for editing product information 
                        <div class="form-group col-md-9">
                            <label class="control-label">Mã sản phẩm </label>
                            <input type="text" name="product_id" class="form-control" placeholder="Product ID.."  value="${p.product_id}" required>
                        </div>

                        <label for="exampleSelect1" class="control-label">Danh mục</label>

                        <select name="category_id" class="custom-select custom-select-md mb-3 select-width">
                            <option selected>Open this select category</option>
                            <c:forEach var="category" items="${CategoryData}">
                                <option value="${category.category_id}" ${p.cate.category_name eq category.category_name ? 'selected' : ''}>${category.category_name}</option>
                            </c:forEach>
                        </select>

                        <div class="form-group col-md-9">
                            <label class="control-label">Tên sản phẩm</label>
                            <input type="text" name="product_name" class="form-control" placeholder="Product Name.." value="${p.product_name}" required>
                        </div>

                        <div class="form-group  col-md-9">
                            <label class="control-label">Giá bán</label>
                            <input type="text" name="price" class="form-control" placeholder="Listed Price.." value="${p.product_price}" required>
                        </div>

                        <div class="form-group  col-md-9">
                            <label class="control-label">Số lượng</label>
                            <input type="number" name="quality" class="form-control" placeholder="Quantity.." value="${p.quantity}" required>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">path Ảnh sản phẩm</label>
                            <input type="text" name="product_img" class="form-control" placeholder="Images path here..." value="${p.product_id}.png" required>
                        </div>

                        <div class="form-group col-md-12">
                            <label class="control-label">Mô tả sản phẩm</label>
                            <textarea name="describe" class="form-control" id="exampleFormControlTextarea1" rows="3"  required>${p.product_description}</textarea>
                        </div>
                        <button class="btn btn-save" type="submit">Lưu lại</button>
                        &nbsp;
                        <a class="btn btn-cancel" href="ProductManagement?action=allproduct">Hủy bỏ</a>
                    </form>
            
            </div>
        </div>
    </div>
-->


           




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
            <script type="text/javascript">                 //Thời Gian
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
            document.getElementById("clock").innerHTML = tmp;
            clocktime = setTimeout("time()", "1000", "Javascript");
            function checkTime(i) {
            if (i < 10) {
            i = "0" + i;
            }
            return i;
            }
        }
            < /script            >

//
//$(document)            .re            ady(function() {
//    $('.delete            ').click(function() {
//        var ta            rget = $(this).data('target');
//        $(targ            et).modal('show');
//    });
//});
                    </
            script > 
                     < /body>
                    </html >