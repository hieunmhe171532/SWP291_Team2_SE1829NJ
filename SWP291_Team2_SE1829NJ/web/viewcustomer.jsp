

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
            /* From uiverse.io by @satyamchaudharydev */
            /* removing default style of button */

            .form button {
                margin-bottom: 6px;
                border: none;
                background: none;
                color: #8b8ba7;
            }
            /* styling of whole input container */
            .form {
                --timing: 0.3s;
                --width-of-input: 220px;
                --height-of-input: 50px;
                --border-height: 2px;
                --input-bg: #fff;
                --border-color: #2f2ee9;
                --border-radius: 30px;
                --after-border-radius: 1px;
                position: relative;
                width: var(--width-of-input);
                height: var(--height-of-input);
                display: flex;
                align-items: center;
                padding-inline: 0.8em;
                border-radius: var(--border-radius);
                transition: border-radius 0.5s ease;
                background: gainsboro;
            }
            /* styling of Input */
            .input {
                font-size: 0.9rem;
                background-color: transparent;
                width: 100%;
                height: 100%;
                padding-inline: 0.5em;
                padding-block: 0.7em;
                border: none;
            }
            /* styling of animated border */
            .form:before {
                content: "";
                position: absolute;
                background: var(--border-color);
                transform: scaleX(0);
                transform-origin: center;
                width: 100%;
                height: var(--border-height);
                left: 0;
                bottom: 0;
                border-radius: 1px;
                transition: transform var(--timing) ease;
            }
            /* Hover on Input */
            .form:focus-within {
                border-radius: var(--after-border-radius);
            }

            input:focus {
                outline: none;
            }
            /* here is code of animated border */
            .form:focus-within:before {
                transform: scale(1);
            }
            /* styling of close button */
            /* == you can click the close button to remove text == */
            .reset {
                border: none;
                background: none;
                opacity: 0;
                visibility: hidden;
            }
            /* close button shown when typing */
            input:not(:placeholder-shown) ~ .reset {
                opacity: 1;
                visibility: visible;
            }
            /* sizing svg icons */
            .form svg {
                width: 17px;
                margin-top: 3px;
            }
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
                                    <h4 class="card-title col-9" style="font-size: 30px">Customer List</h4>
                                    <form class="form" action="viewcustomer" style="margin-left: 30px" method="get">
                                        <button type="submit" style="margin-top: 10px">
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
                                                    Id
                                                </th>
                                                <th class="col-2">
                                                    Name
                                                </th>
                                                <th class="col-2">
                                                    Phone
                                                </th>
                                                <th class="col-2">
                                                    Email
                                                </th>
                                                <th class="col-1">
                                                    Gender
                                                </th>
                                                <th class="col-1">

                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listu}" var="u">
                                            <tr>
                                                <td>
                                                    ${u.id}
                                                </td>
                                                <td>
                                                    ${u.name}
                                                </td>
                                                <td>
                                                    ${u.username.getPhone()}
                                                </td>
                                                <td>
                                                    ${u.username.getEmail()}
                                                </td>
                                                <td>
                                                    <c:if test="${u.isGender()==true}">
                                                        <img src="bootstrap/images/gtnam.png" style="width: 40%;" alt="male"/>
                                                    </c:if>
                                                    <c:if test="${u.isGender()==false}">
                                                        <img src="bootstrap/images/gtnu.png" style="width: 40%" alt="famale"/>
                                                    </c:if> 
                                                </td>
                                                <td class="d-flex justify-content-center">
                                                    <form action="viewcustomer" method="post">
                                                        <button class="btn btn-primary btn-sm edit" type="button" title="Information" id="show-emp" data-toggle="modal"
                                                                data-target="#ModalUP${u.id}" ><i class="fa-solid fa-info-circle"></i></button>
                                                    </form>

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
            <c:forEach items="${listu}" var="u">

                <div class="modal fade" id="ModalUP${u.id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                     data-keyboard="false">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <form action="editblog" method="post">
                                <div class="modal-body">
                                    <div class="modal-header">						
                                        <h4 class="modal-title" style="color: black">Customer Detail</h4>
                                    </div>
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input name="id" type="text" class="form-control" value="${u.name}" readonly="" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Date of birth</label>
                                        <input name="title" type="text" value="${u.dob}" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <input name="brief" type="text" value="${u.username.getPhone()}" class="form-control" required>

                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input name="detail" type="text" value="${u.username.getEmail()}" class="form-control" required>

                                    </div>
                                    <div class="form-group">
                                        <label>Address</label>
                                        <input name="image" type="text" value="${u.address}" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>CreateAt</label>
                                        <input name="create" type="text" value="${u.createAt}" class="form-control" required>
                                    </div>


                                    <div class="form-group">
                                        <label>Gender</label>
                                        <c:if test="${u.isGender()==true}">
                                            <img src="bootstrap/images/gtnam.png" style="width: 10%" alt="male"/>
                                        </c:if>
                                        <c:if test="${u.isGender()==false}">
                                            <img src="bootstrap/images/gtnu.png" style="width: 10%" alt="famale"/>
                                        </c:if> 

                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-cancel" data-dismiss="modal" href="#">Cancel</button>
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