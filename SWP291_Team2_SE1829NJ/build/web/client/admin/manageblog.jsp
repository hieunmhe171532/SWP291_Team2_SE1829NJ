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

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
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

                <li><a class="app-menu__item" href="dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Dashboard</span></a></li>

                <li><a class="app-menu__item" href="ProductManagement?action=allproduct"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Rooms management</span></a>
                </li>

                <li><a class="app-menu__item" href="customermanager?action=getuser"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">accounts management</span></a></li>
                <li><a class="app-menu__item" href="customermanager?action=getuser"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">staff Management</span></a></li>
                <li><a class="app-menu__item" href="customermanager?action=getuser"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">customer Management</span></a></li>
                            <li><a class="app-menu__item" href="blogmanage?action=list"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Blog Management</span></a></li>


            </ul>
        </aside>
        <main class="app-content">
            <div class="row">
                <div class="col-12">
                    <div class="app-title">
                        <ul class="app-breadcrumb breadcrumb">
                            <li class="breadcrumb-item"><a href="blog"><b>Blog List</b></a></li>
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
                            <div class="table-responsive pt-3">
                                <table class="table table-bordered">
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
                                            <th>
                                                Detail
                                            </th>
                                            <th>
                                                CreatedAt
                                            </th>
                                            <th>
                                                Image
                                            </th>
                                            <th>
                                                flag
                                            </th>
                                            <th>
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
                                                <td>
                                                    <a href="loadblog?id=${b.id}" style="color: #dad55e;"><i class="fa fa-edit" title="Edit"></i></a>
                                                    <a href="deleteBlog?id=${b.id}" style="color: red; margin-left: 5px;" data-toggle="modal" data-target="#confirmDeleteModal" data-id="1">
                                                        <i class="fa fa-trash" title="Delete"></i>
                                                    </a>
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

        </main>
        
    </body>

</html>