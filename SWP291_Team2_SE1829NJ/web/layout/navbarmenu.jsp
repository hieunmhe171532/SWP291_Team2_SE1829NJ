<%-- 
    Document   : menu
    Created on : Mar 4, 2023, 2:14:16 AM
    Author     : DUY HUYNH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<div class="offcanvas_menu">
    <div class="canvas_open">
        <a href="javascript:void(0)"><i class="ion-navicon"></i></a>
    </div>
    <div class="offcanvas_menu_wrapper">
        <div class="canvas_close">
            <a href="javascript:void(0)"><i class="ion-android-close"></i></a>  
        </div>
        <div class="welcome_text">
            <ul>
                <li><span style="color: red">Welcome to MANGAK SHOP</span>l</li>

            </ul>

        </div>
        <div class="top_right">
            <ul>
                <li class="top_links"><a href="#">My account <i class="ion-chevron-down"></i></a>
                    <ul class="dropdown_links">
                        <c:if test="${sessionScope.user.user_name!=null}">
                            <li><a href="my-account.html">${sessionScope.user.user_name}</a></li>
                            </c:if>

                        <c:if test="${sessionScope.user.user_name == null}">
                            <li><a href="user?action=myaccount"></a></li>
                            </c:if>

                        <c:if test="${sessionScope.user == null}">
                            <li><a href="user?action=login">Login</a></li>
                            </c:if>

                        <c:if test="${sessionScope.user != null}">
                            <li><a href="user?action=login"> Logout</a></li>
                            </c:if>

                        <c:if test="${fn: toUpperCase(sessionScope.user.isAdmin) == 'TRUE'}">
                            <li><a href="dashboard">Admin Management</a></li>
                            </c:if>
                    </ul>
                </li> 
            </ul>
        </div> 
 
     
    </div>
</div>
<!--Offcanvas menu area end-->

<!--header area start-->
<header class="header_area header_three">
    <!--header top start-->
    <div class="header_top">
        <div class="container-fluid">   
            <div class="row align-items-center">
                <div class="col-lg-7 col-md-12">
                    <div class="welcome_text">
                        <ul>
                            <li>The current date and time is: <span id="clock"></span> </li>

                        </ul>
                    </div>
                </div>
                <div class="col-lg-5 col-md-12">
                    <div class="top_right text-right">
                        <ul>

                            <c:if test="${sessionScope.user != null}">
                                <li class="top_links"><a href="#">Hello ${sessionScope.user.user_name}<i class="ion-chevron-down"></i></a>
                                      <c:set var="time" value="<%= java.time.LocalTime.now().getHour()%>" />

                                        <c:choose>
                                            <c:when test="${time >= 12 && time < 18}">
                                                <c:set var="greeting" value="Good afternoon! " />

                                                <c:set var="iconcc" value='<i class="bi bi-brightness-alt-high-fill"></i>' />
                                            </c:when>

                                            <c:when test="${time >= 5 && time < 12}">
                                                <c:set var="greeting" value="Good morning! " />
                                                <c:set var="iconcc" value='<i class="bi bi-brightness-high-fill"></i>' />
                                            </c:when>



                                            <c:when test="${time >= 18 && time<22}">
                                                <c:set var="greeting" value="Good Evening!" />
                                                <c:set var="iconcc" value='<i class="bi bi-moon-fill"></i>' />
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="greeting" value="Good night!" />
                                                <c:set var="iconcc" value='<i class="bi bi-moon-stars-fill"></i>' />
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                    <c:if test="${sessionScope.user == null}">
                                <li class="top_links"><a href="#">Login<i class="ion-chevron-down"></i></a>
                                    </c:if>
                                <ul class="dropdown_links">
                                    <c:if test="${sessionScope.user != null}">
                                        <li><a href="user?action=myaccount">My account</a></li>
                                        </c:if>

                                    <c:if test="${fn: toUpperCase(sessionScope.user.isAdmin) == 'TRUE'}">
                                        <li><a href="dashboard">Admin Management</a></li>
                                        </c:if>

                                    <c:if test="${sessionScope.user == null}">

                                        <c:set var="time" value="<%= java.time.LocalTime.now().getHour()%>" />

                                        <c:choose>
                                            <c:when test="${time >= 12 && time < 18}">
                                                <c:set var="greeting" value="Good afternoon! " />

                                                <c:set var="iconcc" value='<i class="bi bi-brightness-alt-high-fill"></i>' />
                                            </c:when>

                                            <c:when test="${time >= 5 && time < 12}">
                                                <c:set var="greeting" value="Good morning! " />
                                                <c:set var="iconcc" value='<i class="bi bi-brightness-high-fill"></i>' />
                                            </c:when>



                                            <c:when test="${time >= 18 && time<22}">
                                                <c:set var="greeting" value="Good Evening!" />
                                                <c:set var="iconcc" value='<i class="bi bi-moon-fill"></i>' />
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="greeting" value="Good night!" />
                                                <c:set var="iconcc" value='<i class="bi bi-moon-stars-fill"></i>' />
                                            </c:otherwise>
                                        </c:choose>


                                        <li><a href="user?action=login">Login</a></li>
                                        </c:if>

                                    <c:if test="${sessionScope.user != null}">
                                        <li><a href="user?action=logout">Logout</a></li>
                                        </c:if>


                                </ul>
                            </li> 
                        </ul>
                    </div>   
                </div>
            </div>
        </div>
    </div>
    <!--header top start-->

</header>
<script>
    var greeting = "${greeting}";
    var i = 0;

    function typeWriter() {
        if (i < greeting.length) {
            document.getElementById("greeting").innerHTML += greeting.charAt(i);
            i++;
            setTimeout(typeWriter, 50);
        }
    }

    typeWriter();
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
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
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
        <script type="text/javascript">
    // Call the getTimeString() function and set the text of the "clock" element to the result
    document.getElementById("clock").innerText = time();
</script>



