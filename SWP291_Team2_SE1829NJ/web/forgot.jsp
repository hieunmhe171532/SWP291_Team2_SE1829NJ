<%-- 
    Document   : rooms
    Created on : May 19, 2024, 6:29:46 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="bootstrap/css/animate.css">
        <link rel="stylesheet" href="bootstrap/css/owl.carousel.min.css">
        <link rel="stylesheet" href="bootstrap/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="bootstrap/css/magnific-popup.css">
        <link rel="stylesheet" href="bootstrap/css/aos.css">
        <link rel="stylesheet" href="bootstrap/css/ionicons.min.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="bootstrap/css/jquery.timepicker.css">
        <link rel="stylesheet" href="bootstrap/css/flaticon.css">
        <link rel="stylesheet" href="bootstrap/css/icomoon.css">
        <link rel="stylesheet" href="bootstrap/css/style.css">
        <link rel="stylesheet" href="bootstrap/css/custom.css"> <!-- Di chuyển CSS tùy chỉnh vào file custom.css -->

        
      <style>
         
        </style>
         <script>
        function increment(id) {
            const input = document.getElementById(id);
            let value = parseInt(input.value);
            if (isNaN(value)) value = 0;
            input.value = value + 1;
        }

        function decrement(id) {
            const input = document.getElementById(id);
            let value = parseInt(input.value);
            if (isNaN(value)) value = 0;
            if (value > 0) input.value = value - 1;
        }

        function handleFormSubmit(event) {
            event.preventDefault();
            const peopleValue = document.getElementById('people').value;
            localStorage.setItem('peopleValue', peopleValue);
            event.target.submit();
        }

        function restoreFormValue() {
            const peopleValue = localStorage.getItem('peopleValue');
            if (peopleValue !== null) {
                document.getElementById('people').value = peopleValue;
            }
        }

        document.addEventListener('DOMContentLoaded', restoreFormValue);
    </script>
    </head>
    <body>
             <jsp:include page="layout/navbarmenu.jsp"/>
 
    <div class="form-gap"></div>

    <!--breadcrumbs area end-->

    <section class="customer_login">
        <div class="container">
            <div class="row">
                <div class="register-form col-lg-12 col-md-8">
                    <c:if test="${!(requestScope.check != null && requestScope.check == 'true')}">
                        <div class="account_form register">
                            <h2 class="text-danger">Forgot Password</h2>
                            <c:if test="${requestScope.check != null}">
                                <c:if test="${requestScope.check == 'true' && !(requestScope.message == 'Sorry, reset code incorrect')}">
                                    <p class="text-success">${requestScope.message}</p>
                                </c:if>
                                <c:if test="${requestScope.check == 'false'}">
                                    <p class="text-danger">${requestScope.message}</p>
                                </c:if>
                                <c:if test="${requestScope.check == 'true' && requestScope.message == 'Sorry, reset code incorrect'}">
                                    <p class="text-danger">${requestScope.message}</p>
                                </c:if>
                            </c:if>
                            <form action="forgot" method="post">
                                <c:if test="${requestScope.check == null || requestScope.check == 'false'}">
                                <p>
    <label>Please fill your address to recover your password<span>*</span></label>
    <input type="email" class="custom-input" name="email" placeholder="Email Address" required="required" value="${requestScope.email}">
    <i class="flaticon-envelope"></i>
</p>

                                </c:if>
                                <c:if test="${requestScope.check == null || requestScope.check == 'false'}">
                                    <div class="login_submit">
                                        <button type="submit" class="btn btn-primary">Send Me Email</button>
                                    </div>
                                </c:if>
                            </form>
                        </div>
                    </c:if>
                    <c:if test="${requestScope.check != null && requestScope.check == 'true'}">
                        <div class="account_form register">
                            <h2 class="text-danger">Confirm Reset Code</h2>
                            <p>Get the code from the new message at "${requestScope.email}".</p>
                            <form action="confirm" method="post">
                                <input type="hidden" name="email" value="${requestScope.email}">
                                <p>
                                    <label>Enter 6 characters to get new password <span>*</span></label>
                                    <input type="text" class="form-control" name="resetcode" placeholder="xxxxxx" required="required" value="${requestScope.code}">
                                    <i class="flaticon-envelope"></i>
                                </p>
                                <c:if test="${requestScope.check != null && requestScope.check == 'true'}">
                                    <div class="login_submit">
                                        <button type="submit" class="btn btn-primary">Confirm Reset Code</button>
                                    </div>
                                </c:if>
                            </form>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </section>
                                      <jsp:include page="layout/navbarfoot.jsp"/>
   

        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

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
        <script src="bootstrap/js/custom.js"></script> <!-- Di chuyển JS tùy chỉnh vào file custom.js -->
        <script >
    
        </script> 

    </body>
</html>
