<%-- 
    Document   : profile
    Created on : May 28, 2024, 9:08:18 PM
    Author     : Linh Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Profile</title>
    <%@include file="Component/setupCss.jsp" %>
    <style>
        .form-control:focus {
            box-shadow: none;
            border-color:  #003d99
        }

        .profile-button {
            background: rgb(0, 102, 255);
            box-shadow: none;
            border: none
        }

        .profile-button:hover {
            background: #003d99;
            padding: 8px 12px;
        }

        .profile-button:focus {
            background:  #003d99;
            box-shadow: none
        }

        .profile-button:active {
            background:  #003d99;
            box-shadow: none
        }

        .back:hover {
            color: #003d99;
            cursor: pointer
        }

        .labels {
            font-size: 18px
        }

        .form-control{
            margin-bottom: 10px;
            margin-top: -5px;
        }

        .add-experience:hover {
            background:  #003d99;
            color: #fff;
            cursor: pointer;
            border: solid 1px  #003d99
        }
    </style>
</head>
<body>

    <!-- Section: Design Block -->
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-6 border">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile Settings</h4>
                    </div>
                    <form action="Profile" method="post">
                        <div class="row mt-3">
                            <input type="text" class="form-control" placeholder="fullname" value="${Account.getAccountId()}" 
                                   name="AccountId" hidden>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Account Name</label>
                            <input type="text" class="form-control" placeholder="account name" value="${Account.getUsername()}" 
                                   name="username" readonly>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Customer Name</label>
                            <input type="text" class="form-control" placeholder="customer name" value="${User.getName()}" 
                                   name="name">
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Phone</label>
                            <input type="text" class="form-control" placeholder="phone" value="${Account.getPhone()}" 
                                   name="phone">
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Address</label>
                            <input type="text" class="form-control" placeholder="address" value="${User.getAddress()}" 
                                   name="address">
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Email</label>
                            <input type="text" class="form-control" placeholder="email" value="${Account.getEmail()}" 
                                   name="email" readonly>
                        </div>
                        <!-- Adding the new fields if they are not already present -->
                        <div class="col-md-12">
                            <label class="labels">Date of Birth</label>
                            <input type="date" class="form-control" value="${User.getDob()}" name="dob">
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Gender</label>
                            <select class="form-control" name="gender">
                                <option value="true" ${User.isGender() ? 'selected' : ''}>Male</option>
                                <option value="false" ${!User.isGender() ? 'selected' : ''}>Female</option>
                            </select>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Section: Design Block -->

    <!--Footer-->
    <%@include file="Component/footer.jsp" %>
    <!--Footer-->

    <!--Script-->
    <!--Script-->

</body>
</html>
