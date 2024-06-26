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

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">



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
        </style>



    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <jsp:include page="nvarbar-admin.jsp"></jsp:include>

            <main class="app-content">
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="container mt-5">
                            <form action="action">
                                <div class="d-flex">
                                    <h4 class="card-title col-8" style="font-size: 30px">Feedback List</h4>
                                    <a class="custom-button" data-bs-toggle="collapse" href="#filter" role="button" style="border: 1px solid #011431;" aria-expanded="false" aria-controls="collapseFilter">
                                        Search By
                                    </a>
                                    <div class="search">
                                        <div class="search-box">
                                            <div class="search-field">
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

                                <div id="filter" class="collapse">
                                    <div class="card card-body">
                                        <input type="radio" name="name" value="sid">Search by id
                                        <input type="radio" name="name" value="sid">Search by comment
                                        <input type="radio" name="name" value="sid">Search by Commentator
                                        <input type="radio" name="name" value="sid">Search by Commentator
                                        <input type="radio" name="name" value="sid">Search by Commentator
                                        <input type="radio" name="name" value="sid">Search by Room Id
                                        <input type="radio" name="name" value="sid">Search by CreatedAt
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
        <script src="bootstrap/js/"></script>

        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="bootstrap/js/google-map.js"></script>
        <script src="bootstrap/js/main.js"></script>
        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>