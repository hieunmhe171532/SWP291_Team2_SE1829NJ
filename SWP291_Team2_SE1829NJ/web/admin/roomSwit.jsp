<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Quản trị roomSwit</title>
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
                <li><a class="app-nav__item" href="home"><i class='bx bx-log-out bx-rotate-180'></i> </a>

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
                            class="app-menu__label">Dashboard</span></a></li>

                <li><a class="app-menu__item" href="ProductManagement?action=allproduct"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Rooms management</span></a>
                </li>

            </ul>
        </aside>
        
  
        
   
            <main class="app-content">
                <div class="row">
                    <div class="col-12">
                        <div class="app-title">
                            <ul class="app-breadcrumb breadcrumb">
                                <li class="breadcrumb-item"><a href="listmanageblog"><b>Blog List</b></a></li>
                                <li class="breadcrumb-item"><a href="addblog"><b>Add New Blog</b></a></li>
                            </ul>
                            <div id="clock"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                    <h4 class="card-title col-9" style="font-size: 30px">Blog List</h4>
                                    <form class="form" action="listmanageblog" style="margin-left: 30px" method="get">
                                        <button type="submit">
                                            <svg width="17"  height="16" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-labelledby="search">
                                            <path d="M7.667 12.667A5.333 5.333 0 107.667 2a5.333 5.333 0 000 10.667zM14.334 14l-2.9-2.9" stroke="currentColor" stroke-width="1.333" stroke-linecap="round" stroke-linejoin="round"></path>
                                            </svg>
                                        </button>
                                        <input class="input" placeholder="Type your text" name="txt"  type="text">
                                        <button class="reset" type="reset">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"></path>
                                            </svg>
                                        </button>
                                    </form>
                                </div>
                                <div class="table-responsive-lg mt-5">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th class="col-1">
                                                    ID
                                                </th>
                                                <th class="col-1">
                                                    Title
                                                </th>
                                                <th class="col-2">
                                                    Brief Information
                                                </th>
                                                <th class="col-3">
                                                    Detail
                                                </th>
                                                <th class="col-2">
                                                    CreatedAt
                                                </th>
                                                <th class="col-2">
                                                    Image
                                                </th>
                                                <th class="col-1">
                                                    flag
                                                </th>
                                                <th class="col-1">
                                                    Action
                                                </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listb}" var="b">
                                            <tr>
                                                <td>
                                                    ${b.getId()}
                                                </td>
                                                <td>
                                                    ${b.title}
                                                </td>
                                                <td>
                                                    ${b.briefinfo}
                                                </td>
                                                <td>
                                                    ${b.detail}
                                                </td>
                                                <td>
                                                    ${b.createAt}
                                                </td>
                                                <td>
                                                    <img src="${b.image}" width="50%" height="50%" alt="loi"/>
                                                    
                                                </td>
                                                <td>
                                                    ${b.flag}
                                                </td>
                                                <td class="d-flex">
                                                    <button class="btn btn-primary btn-sm edit" type="button" title="Edit" id="show-emp" data-toggle="modal"
                                                            data-target="#ModalUP${b.id}" ><i class="fa-solid fa-edit"></i></button>
                                                    <button class="btn btn-danger btn-sm delete" type="button" title="Delete" id="show-emp" data-toggle="modal"
                                                            data-target="#ModalDEL${b.id}"><i class="fas fa-trash"></i>
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


            </div>
            <c:forEach items="${listb}" var="b">
                <!-- Edit modal window -->

                <div class="modal fade" id="ModalUP${b.id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                     data-keyboard="false">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <form action="editblog" method="post">
                                <div class="modal-body">
                                    <div class="modal-header">						
                                        <h4 class="modal-title" style="color: black">Edit Product</h4>
                                    </div>
                                    <div class="form-group">
                                        <label>Id</label>
                                        <input name="id" type="text" class="form-control" value="${b.getId()}" readonly="" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Title</label>
                                        <input name="title" type="text" value="${b.title}" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Brief Infomation</label>
                                        <input name="brief" type="text" value="${b.briefinfo}" class="form-control" required>

                                    </div>
                                    <div class="form-group">
                                        <label>Detail</label>
                                        <input name="detail" type="text" value="${b.detail}" class="form-control" required>

                                    </div>
                                    <div class="form-group">
                                        <label>Image</label>
                                        <input name="image" type="url" value="${b.image}" class="form-control" required>
                                    </div>


                                    <div class="form-group">
                                        <div><label>Flag</label>
                                            <c:if test="${b.flag==1}">
                                            <input type="checkbox" checked="" value="${b.flag}" name="flag">
                                            </c:if>
                                            <c:if test="${b.flag==0}">
                                                <input type="checkbox" value="${b.flag}" name="flag">
                                            </c:if>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-cancel" data-dismiss="modal" href="#">Cancel</button>
                                    <input type="submit" class="btn btn-success" value="Edit">
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

                <!-- Delete modal window -->
                <div class="modal fade" id="ModalDEL${b.getId()}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                     data-keyboard="false">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <form method="POST" action="deleteblog">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <span class="thong-tin-thanh-toan">
                                                <h5>Bạn có chắc chắn muốn xóa Blog này?.</h5>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <input hidden name="id" value="${b.id}">
                                        </div>
                                    </div>
                                    <BR>
                                    <button class="btn btn-danger" type="submit">Delete</button>
                                    <button class="btn btn-cancel" data-dismiss="modal" href="#">Cancel</button>
                                    <BR>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </c:forEach>

        </main>
            <main class="app-content">
                <div class="row">
                    <div class="col-12">
                        <div class="app-title">
                            <ul class="app-breadcrumb breadcrumb">
                                <li class="breadcrumb-item"><a href="listmanageblog"><b>Blog List</b></a></li>
                                <li class="breadcrumb-item"><a href="addblog"><b>Add New Blog</b></a></li>
                            </ul>
                            <div id="clock"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                    <h4 class="card-title col-9" style="font-size: 30px">Blog List</h4>
                                    <form class="form" action="listmanageblog" style="margin-left: 30px" method="get">
                                        <button type="submit">
                                            <svg width="17"  height="16" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-labelledby="search">
                                            <path d="M7.667 12.667A5.333 5.333 0 107.667 2a5.333 5.333 0 000 10.667zM14.334 14l-2.9-2.9" stroke="currentColor" stroke-width="1.333" stroke-linecap="round" stroke-linejoin="round"></path>
                                            </svg>
                                        </button>
                                        <input class="input" placeholder="Type your text" name="txt"  type="text">
                                        <button class="reset" type="reset">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"></path>
                                            </svg>
                                        </button>
                                    </form>
                                </div>
                                <div class="table-responsive-lg mt-5">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th class="col-1">
                                                    ID
                                                </th>
                                                <th class="col-1">
                                                    Title
                                                </th>
                                                <th class="col-2">
                                                    Brief Information
                                                </th>
                                                <th class="col-3">
                                                    Detail
                                                </th>
                                                <th class="col-2">
                                                    CreatedAt
                                                </th>
                                                <th class="col-2">
                                                    Image
                                                </th>
                                                <th class="col-1">
                                                    flag
                                                </th>
                                                <th class="col-1">
                                                    Action
                                                </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listb}" var="b">
                                            <tr>
                                                <td>
                                                    ${b.getId()}
                                                </td>
                                                <td>
                                                    ${b.title}
                                                </td>
                                                <td>
                                                    ${b.briefinfo}
                                                </td>
                                                <td>
                                                    ${b.detail}
                                                </td>
                                                <td>
                                                    ${b.createAt}
                                                </td>
                                                <td>
                                                    <img src="${b.image}" width="50%" height="50%" alt="loi"/>
                                                    
                                                </td>
                                                <td>
                                                    ${b.flag}
                                                </td>
                                                <td class="d-flex">
                                                    <button class="btn btn-primary btn-sm edit" type="button" title="Edit" id="show-emp" data-toggle="modal"
                                                            data-target="#ModalUP${b.id}" ><i class="fa-solid fa-edit"></i></button>
                                                    <button class="btn btn-danger btn-sm delete" type="button" title="Delete" id="show-emp" data-toggle="modal"
                                                            data-target="#ModalDEL${b.id}"><i class="fas fa-trash"></i>
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


            </div>
            <c:forEach items="${listb}" var="b">
                <!-- Edit modal window -->

                <div class="modal fade" id="ModalUP${b.id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                     data-keyboard="false">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <form action="editblog" method="post">
                                <div class="modal-body">
                                    <div class="modal-header">						
                                        <h4 class="modal-title" style="color: black">Edit Product</h4>
                                    </div>
                                    <div class="form-group">
                                        <label>Id</label>
                                        <input name="id" type="text" class="form-control" value="${b.getId()}" readonly="" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Title</label>
                                        <input name="title" type="text" value="${b.title}" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Brief Infomation</label>
                                        <input name="brief" type="text" value="${b.briefinfo}" class="form-control" required>

                                    </div>
                                    <div class="form-group">
                                        <label>Detail</label>
                                        <input name="detail" type="text" value="${b.detail}" class="form-control" required>

                                    </div>
                                    <div class="form-group">
                                        <label>Image</label>
                                        <input name="image" type="url" value="${b.image}" class="form-control" required>
                                    </div>


                                    <div class="form-group">
                                        <div><label>Flag</label>
                                            <c:if test="${b.flag==1}">
                                            <input type="checkbox" checked="" value="${b.flag}" name="flag">
                                            </c:if>
                                            <c:if test="${b.flag==0}">
                                                <input type="checkbox" value="${b.flag}" name="flag">
                                            </c:if>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-cancel" data-dismiss="modal" href="#">Cancel</button>
                                    <input type="submit" class="btn btn-success" value="Edit">
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

                <!-- Delete modal window -->
                <div class="modal fade" id="ModalDEL${b.getId()}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                     data-keyboard="false">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <form method="POST" action="deleteblog">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <span class="thong-tin-thanh-toan">
                                                <h5>Bạn có chắc chắn muốn xóa Blog này?.</h5>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <input hidden name="id" value="${b.id}">
                                        </div>
                                    </div>
                                    <BR>
                                    <button class="btn btn-danger" type="submit">Delete</button>
                                    <button class="btn btn-cancel" data-dismiss="modal" href="#">Cancel</button>
                                    <BR>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </c:forEach>

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
        <script>
  document.addEventListener("DOMContentLoaded", function() {
    // Assume roomStatus is passed as a server-side rendered variable
    var roomStatus = ${requestScope.room.status}; 

    if (roomStatus == 1) {
      document.getElementById("emptyToggle").checked = true;
    }
  });
</script>         
        
        <script type="text/javascript">

                            // Assuming you have JavaScript to handle toggle behavior

document.addEventListener("DOMContentLoaded", function() {
    // Assume roomStatus is passed as a server-side rendered variable
    var roomStatus = ${requestScope.room.status}; 

    if (roomStatus === 1) {
      document.getElementById("emptyToggle").checked = true;
    } else if (roomStatus === 2) {
      document.getElementById("bookingToggle").checked = true;
    } else if (roomStatus === 3) {
      document.getElementById("usingToggle").checked = true;
    }
  });

        </script>
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
                            
                            // Assuming you have JavaScript to handle toggle behavior


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


    </body>

</html>