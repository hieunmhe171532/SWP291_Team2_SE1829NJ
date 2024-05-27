<%-- 
    Document   : index
    Created on : Oct 19, 2021, 11:22:48 PM
    Author     : Khuong Hung
--%>

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
        <link rel="stylesheet" type="text/css" href="maincss/newcss.css">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
                                <li class="breadcrumb-item"><a href="blogmanage?action=list"><b>Blog List</b></a></li>
                                <li class="breadcrumb-item"><a href="addblog.jsp"><b>Add New Blog</b></a></li>
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
                                    <form class="form" action="blogmanage?action=list" style="margin-left: 30px" method="post">
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
                                <div class="table-responsive mt-5">
                                    <table class="table table-hover col-12">
                                        <thead>
                                            <tr>
                                                <th>
                                                    ID
                                                </th>
                                                <th>
                                                    Title
                                                </th>
                                                <th>
                                                    Brief Information
                                                </th>
                                                <th >
                                                    Detail
                                                </th>
                                                <th >
                                                    CreatedAt
                                                </th>
                                                <th >
                                                    Image
                                                </th>
                                                <th >
                                                    flag
                                                </th>
                                                <th >
                                                    Action
                                                </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listb}" var="b">
                                            <tr>
                                                <td>
                                                    ${b.id}
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
                                                    ${b.image}
                                                </td>
                                                <td>
                                                    ${b.flag}
                                                </td>
                                                <td class="d-flex">
                                                    <button class="btn btn-primary btn-sm edit" type="button" title="Edit" id="show-emp" data-toggle="modal"
                                                            data-target="#ModalUP${b.id}" style="width: 70%" ><i class="fas fa-edit"></i></button>
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
                            <form action="blogmanage?action=edit" method="post">
                                <div class="modal-body">
                                    <div class="modal-header">						
                                        <h4 class="modal-title" style="color: black">Edit Product</h4>
                                    </div>
                                    <div class="form-group">
                                        <label>Id</label>
                                        <input name="id" type="text" class="form-control" value="${b.id}" readonly="" required>
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
                                            <input type="checkbox" value="${b.flag}" name="flag">
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</button>
                                    <input type="submit" class="btn btn-success" value="Edit">
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

                <!-- Delete modal window -->
                <div class="modal fade" id="ModalDEL${b.id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                     data-keyboard="false">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <form method="POST" action="blogmanage?action=delete">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <span class="thong-tin-thanh-toan">
                                                <h5>Bạn có chắc chắn muốn xóa Blog này?</h5>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <input hidden name="id" value="${b.id}">
                                        </div>
                                    </div>
                                    <BR>
                                    <button class="btn btn-danger" type="submit">Xóa</button>
                                    <button class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</button>
                                    <BR>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </c:forEach>

        </main>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>