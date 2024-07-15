<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <link rel="stylesheet" type="text/css" href="admin/maincss/newcss.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">




        <style>
            a {
                text-decoration: none;
            }
            .custom-button {
                border: 1px solid #007bff;
                padding: 10px 20px;
                font-size: 16px;
                background-color: #fff;
                color: black;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-right: 10px;
            }

            .custom-button:hover {
                background-color: #011431;
                color: white;
            }

            .custom-button:focus {
                outline: none;
                box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.5);
            }
            .search {
                --input-line: #cccccc;
                --input-text-color: #808080;
                --input-text-hover-color: transparent;
                --input-border-color: #808080;
                --input-border-hover-color: #999999;
                --input-bg-color: #333333;
                --search-max-width: 250px;
                --search-min-width: 150px;
                --border-radius: 5px;
                --transition-cubic-bezier: 150ms cubic-bezier(0.4,0,0.2,1);
            }

            .search-box {
                max-width: var(--search-max-width);
                min-width: var(--search-min-width);
                height: 50px;
                border: 1px solid var(--input-border-color);
                border-radius: var(--border-radius);
                padding: 5px 15px;
                background: var(--input-bg-color);
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
                transition: var(--transition-cubic-bezier);
            }

            .search-box:hover {
                border-color: var(--input-border-hover-color);
            }

            /*Section input*/
            .search-field {
                position: relative;
                width: 100%;
                height: 100%;
                left: -5px;
                border: 0;
            }

            .input {
                width: calc(100% - 29px);
                height: 100%;
                border: 0;
                border-color: transparent;
                font-size: 1rem;
                padding-right: 0px;
                color: var(--input-line);
                background: var(--input-bg-color);
                border-right: 2px solid var(--input-border-color);
                outline: none;
            }

            .input::-webkit-input-placeholder {
                color: var(--input-text-color);
            }

            .input::-moz-input-placeholder {
                color: var(--input-text-color);
            }

            .input::-ms-input-placeholder {
                color: var(--input-text-color);
            }

            .input:focus::-webkit-input-placeholder {
                color: var(--input-text-hover-color);
            }

            .input:focus::-moz-input-placeholder {
                color: var(--input-text-hover-color);
            }

            .input:focus::-ms-input-placeholder {
                color: var(--input-text-hover-color);
            }

            /*Search button*/
            .search-box-icon {
                width: 50px;
                height: 44px;
                position: absolute;
                top: 1px;
                right: -21px;
                background: transparent;
                border-bottom-right-radius: var(--border-radius);
                border-top-right-radius: var(--border-radius);
                transition: var(--transition-cubic-bezier);
            }

            .search-box-icon:hover {
                background: var(--input-border-color);
            }

            .btn-icon-content {
                width: 52px;
                height: 35px;
                top: -6px;
                right: -21px;
                background: transparent;
                border: none;
                cursor: pointer;
                border-bottom-right-radius: var(--border-radius);
                border-top-right-radius: var(--border-radius);
                transition: var(--transition-cubic-bezier);
                opacity: .4;
            }

            .btn-icon-content:hover {
                opacity: .10;
            }

            .search-icon {
                width: 21px;
                height: 21px;
                position: absolute;
                top: 7px;
                right: 15px;
            }

            .card{
                display: flex;
                justify-content: center;
                margin: 20px auto;
                width: 85%;

            }
            .row {
                display: flex;
                flex-wrap: wrap;
                margin: 0 -15px;
            }

            .col-sm-6, .col-md-3 {
                padding: 15px;
                flex: 0 0 50%;
                max-width: 50%;
            }

            @media (min-width: 768px) {
                .col-md-3 {
                    flex: 0 0 25%;
                    max-width: 25%;
                }
            }

            .card {
                background-color: #fff;
                border: none;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }

            .card:hover {
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            }

            .card-body {
                padding: 20px;
            }

            .card-stats .row {
                align-items: center;
            }

            .col-icon {
                flex: 0 0 auto;
                margin-right: 15px;
            }

            .icon-big {
                font-size: 3rem;
            }

            .bubble-shadow-small {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 50%;
                padding: 20px;
            }

            .icon-primary {
                color: #007bff;
                background-color: rgba(0, 123, 255, 0.1);
            }

            .icon-info {
                color: #17a2b8;
                background-color: rgba(23, 162, 184, 0.1);
            }

            .icon-success {
                color: #28a745;
                background-color: rgba(40, 167, 69, 0.1);
            }

            .icon-secondary {
                color: #6c757d;
                background-color: rgba(108, 117, 125, 0.1);
            }

            .numbers {
                text-align: left;
            }

            .card-category {
                font-size: 0.9rem;
                color: #6c757d;
                margin: 0;
            }

            .card-title {
                font-size: 1.5rem;
                font-weight: bold;
                margin: 5px 0 0;
            }
            .pagination-link {
                display: inline-block;
                padding: 8px 12px;
                margin: 4px;
                text-decoration: none;
                color: #007bff;
                border: 1px solid #007bff;
                border-radius: 4px;
                transition: background-color 0.3s, color 0.3s;
            }

            .pagination-link:hover {
                background-color: #007bff;
                color: white;
            }

            .pagination-link.active {
                background-color: #0056b3;
                color: white;
                border-color: #0056b3;
            }




        </style>



    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <jsp:include page="nvarbar-admin.jsp"></jsp:include>

            <main class="app-content">
                <div class="row d-flex justify-content-center">
                    <div class="col-sm-6 col-md-3">
                        <div class="card card-stats card-round">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-icon ">
                                        <div
                                            class="icon-big text-center icon-primary bubble-shadow-small"
                                            >
                                            <i class="fas fa-users"></i>
                                        </div>
                                    </div>
                                    <div class="col col-stats ms-3 ms-sm-0">
                                        <div class="numbers">
                                            <p class="card-category">Total Of Users</p>
                                            <h4 class="card-title">${totalUser}</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="card card-stats card-round">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-icon">
                                    <div
                                        class="icon-big text-center bubble-shadow-small"
                                        >
                                        <i class="fa-solid fa-user-pen"></i>
                                    </div>
                                </div>
                                <div class="col col-stats ms-3 ms-sm-0">
                                    <div class="numbers">
                                        <p class="card-category"> Users Commenting</p>
                                        <h4 class="card-title">${totalUserComment}</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="card card-stats card-round">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-icon">
                                    <div
                                        class="icon-big text-center icon-secondary bubble-shadow-small"
                                        >
                                        <i class="far fa-check-circle"></i>
                                    </div>
                                </div>
                                <div class="col col-stats ms-3 ms-sm-0">
                                    <div class="numbers">
                                        <p class="card-category">Total Comment</p>
                                        <h4 class="card-title">${totalComment}</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="card card-round">
                        <div class="card-header">
                            <div class="card-head-row card-tools-still-right">
                                <h4 class="card-title">Geography of User feedback</h4>
                            </div>
                            <p class="card-category">
                                The number of comments from locations in Vietnam.
                            </p>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="table-responsive table-hover table-sales">
                                    <table class="table">
                                        <tbody>
                                            <c:forEach items="${listca}" var="ca">
                                                <tr>
                                                    <td>${ca.address}</td>
                                                    <td>${ca.count}</td>
                                                    <td>~${Math.round(ca.count / totalComment * 100)}%</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>

                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card card-round">
                        <div class="card-header">
                            <div class="card-head-row card-tools-still-right">
                                <h4 class="card-title">Top Users</h4>
                            </div>
                            <p class="card-category">
                                Here are the users with the most comments in the system
                            </p>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="table-responsive table-hover table-sales">
                                    <table class="table">
                                        <tbody>
                                            <c:forEach items="${listop}" var="top">
                                                <tr>
                                                    <td>${top.user.getName()}</td>
                                                    <td class="text-end">${top.count}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="container mt-5">
                        <form action="listmanagefeedback">
                            <div class="d-flex">
                                <h4 class="card-title col-9" style="font-size: 30px">Feedback List</h4>
                                <div class="search">
                                    <div class="search-box">
                                        <div class="search-field">
                                            <input type="text" name="index" value="${tag}" hidden="">

                                            <input placeholder="Search..." class="input" type="text" name="search">
                                            <div class="search-box-icon">
                                                <button class="btn-icon-content">
                                                    <i class="search-icon">
                                                        <svg xmlns="://www.w3.org/2000/svg" version="1.1" viewBox="0 0 512 512"><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z" fill="#fff"></path></svg>
                                                    </i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </form>

                    </div>


                    <div class="table-responsive-lg mt-5">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th class="col-1">
                                        Id
                                    </th>
                                    <th class="col-3">
                                        Image

                                    </th>
                                    <th class="col-2">
                                        Comment
                                    </th>
                                    <th class="col-1">
                                        CreatedAt
                                    </th>
                                    <th class="col-1">
                                        User Id
                                    </th>
                                    <th class="col-1">
                                        Room Id
                                    </th>
                                    <th class="col-1">
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listp}" var="page">
                                    <tr>
                                        <td>
                                            ${page.id}
                                        </td>
                                        <td>
                                            <img src="${page.img}" alt="no image" style="width: 50%"/>
                                        </td>
                                        <td>
                                            ${page.description}
                                        </td>
                                        <td>
                                            ${page.createAt}
                                        </td>
                                        <td>
                                            ${page.user.getId()}
                                        </td>
                                        <td>
                                            ${page.room.getId()}
                                        </td>
                                        <td class="d-flex justify-content-center" >
                                            <button type="button" class="btn btn-primary" style="margin-right: 5px; " data-toggle="modal" data-target="#ModalDE${page.id}">
                                                <i class="fa-solid fa-circle-info" ></i>
                                            </button>
                                            <button type="button" class="btn btn-primary" style="margin-right: 5px; " data-toggle="modal" data-target="#ModalED${page.id}">
                                                <i class="fa-solid fa-pen-to-square" style="color: yellow"></i>
                                            </button>
                                            <button type="button" class="btn btn-primary" style="margin-right: 5px; " data-toggle="modal" data-target="#ModalDEL${page.id}">
                                                <i class="fa fa-trash" style="color: #ED1F2B"></i>
                                            </button>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>


            </div>
            <div>
                <c:if test="${search==null}">
                    <c:forEach begin="1" end="${endP}" var="p">
                        <a class="pagination-link" href="listmanagefeedback?index=${p}">${p}</a>
                    </c:forEach>
                </c:if>
                <c:if test="${search!=null}">
                    <c:forEach begin="1" end="${endP}" var="p">
                        <a class="pagination-link" href="listmanagefeedback?index=${p}&search=${search}">${p}</a>
                    </c:forEach>
                </c:if>
            </div>

            <c:forEach items="${listp}" var="page">

                <!--detail infomation-->

                <div class="modal" id="ModalDE${page.id}">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title" style="color: black" >Details Infomation</h4>
                            </div>

                            <!-- Modal Body -->
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">User</h5>
                                                <p class="card-text">Name:${page.user.getName()}</p>
                                                <p class="card-text">Date of birth:${page.user.getDob()}</p>
                                                <c:if test="${page.user.isGender()==true}">
                                                    <p class="card-text">Gender:Male</p>
                                                </c:if>
                                                <c:if test="${page.user.isGender()==false}">
                                                    <p class="card-text">Gender:Female</p>
                                                </c:if>
                                                <p class="card-text">Address:${page.user.getAddress()}</p>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">Room</h5>
                                                <p class="card-text">Name:${page.room.getName()}</p>
                                                <p class="card-text">User Quantity:${page.room.getUserQuantity()}</p>

                                                <p class="card-text">Area:${page.room.getArea()}</p>
                                                <p class="card-text">Price:${Math.round(page.room.getPrice())}đ</p>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal Footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>

                <!--Edit Feedback Modal-->                               

                <div class="modal" id="ModalED${page.id}">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <form action="editfeedback" method="post">
                                <div class="modal-body">
                                    <div class="modal-header">						
                                        <h2 class="modal-title" style="color: black">Edit Feedback</h2>
                                    </div>
                                    <div class="form-group">
                                        <label><b>Id</b></label>
                                        <input name="id" type="text" class="form-control" value="${page.id}" readonly="" required>
                                    </div>
                                    <div class="form-group">
                                        <label><b>Image</b></label>
                                        <input name="img" type="url" value="${page.img}" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label><b>Comment</b></label>
                                        <input name="comment" type="text" value="${page.description}" class="form-control" required>
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


                <!--Delete Feedback Modal-->                               


                <div class="modal" id="ModalDEL${page.id}">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <form method="POST" action="deletefeedback">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <span class="thong-tin-thanh-toan">
                                                <h5>Are you sure you want to delete this feedback?</h5>
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

                    <!-- Modal Footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
    </c:forEach>




    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const links = document.querySelectorAll(".pagination-link");
            links.forEach(link => {
                if (link.href === window.location.href) {
                    link.classList.add("active");
                }
            });
        });

    </script>

</main>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>

</body>

</html>