>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/open-iconic-bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="bootstrap/css/animate.css">
        <link rel="stylesheet" type="text/css" href="css/animate.css">

        <link rel="stylesheet" type="text/css" href="bootstrap/css/owl.carousel.min.css">
        <link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">

        <link rel="stylesheet" type="text/css" href="bootstrap/css/owl.theme.default.min.css">
        <link rel="stylesheet" type="text/css" href="css/owl.theme.default.min.css">

        <link rel="stylesheet" type="text/css" href="bootstrap/css/magnific-popup.css">
        <link rel="stylesheet" type="text/css" href="css/magnific-popup.css">

        <link rel="stylesheet" type="text/css" href="bootstrap/css/aos.css">
        <link rel="stylesheet" type="text/css" href="css/aos.css">

        <link rel="stylesheet" type="text/css" href="bootstrap/css/ionicons.min.css">
        <link rel="stylesheet" type="text/css" href="css/ionicons.min.css">

        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-datepicker.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-datepicker.css">

        <link rel="stylesheet" type="text/css" href="bootstrap/css/jquery.timepicker.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.timepicker.css">


        <link rel="stylesheet" type="text/css" href="bootstrap/css/flaticon.css">
        <link rel="stylesheet" type="text/css" href="css/flaticon.css">

        <link rel="stylesheet" type="text/css" href="bootstrap/css/icomoon.css">
        <link rel="stylesheet" type="text/css" href="css/icomoon.css">

        <link rel="stylesheet" type="text/css" href="bootstrap/css/newcss.css">
        <link rel="stylesheet" type="text/css" href="css/newcss.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <style>
            
        </style>



    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <jsp:include page="nvarbar-admin.jsp"></jsp:include>

            <main class="app-content">
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                    <h4 class="card-title col-9" style="font-size: 30px">Feedback List</h4>
                                </div>
                                <div class="table-responsive-lg mt-5">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th class="col-1">
                                                    Id
                                                </th>
                                                <th class="col-3">
                                                    Comment
                                                </th>
                                                <th class="col-2">
                                                    Image
                                                </th>
                                                <th class="col-1">
                                                    Commentator
                                                </th>
                                                <th class="col-1">
                                                    Room Id
                                                </th>
                                                <th class="col-1">
                                                    CreatedAt
                                                </th>
                                                <th class="col-1">
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
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <form action="editblog" method="post">
                                <div class="modal-body">
                                    <div class="modal-header">						
                                        <h2 class="modal-title" style="color: black">Edit Blog</h2>
                                        
                                    </div>
                                    <div class="form-group">
                                        <label><b>Id</b></label>
                                        <input name="id" type="text" class="form-control" value="${b.getId()}" readonly="" required>
                                    </div>
                                    <div class="form-group">
                                        <label><b>Title</b></label>
                                        <input name="title" type="text" value="${b.title}" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label><b>Brief Infomation</b></label>
                                        <input name="brief" type="text" value="${b.briefinfo}" class="form-control" required>

                                    </div>
                                    <div class="form-group">
                                        <label><b>Detail</b></label>
                                        <input name="detail" type="text" value="${b.detail}" class="form-control" required>

                                    </div>
                                    <div class="form-group">
                                        <label><b>Image</b></label>
                                        <input name="image" type="url" value="${b.image}" class="form-control" required>
                                    </div>


                                    <div class="form-group">
                                        <div><label><b>Flag</b></label>
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
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <form method="POST" action="deleteblog">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <span class="thong-tin-thanh-toan">
                                                <h5>Are you sure you want to delete this Blog?</h5>
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
        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
        

    </body>

</html>