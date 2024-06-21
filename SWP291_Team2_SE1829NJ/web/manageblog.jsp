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