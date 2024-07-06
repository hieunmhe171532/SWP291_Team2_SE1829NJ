<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <%@include file="Component/setupCss.jsp" %>
        <style>
            .form-control:focus {
                box-shadow: none;
                border-color: #003d99;
            }

            .profile-button {
                background: rgb(0, 102, 255);
                box-shadow: none;
                border: none;
            }

            .profile-button:hover {
                background: #003d99;
                padding: 8px 12px;
            }

            .profile-button:focus {
                background: #003d99;
                box-shadow: none;
            }

            .profile-button:active {
                background: #003d99;
                box-shadow: none;
            }

            .back:hover {
                color: #003d99;
                cursor: pointer;
            }

            .labels {
                font-size: 18px;
            }

            .form-control {
                margin-bottom: 10px;
                margin-top: -5px;
            }

            .add-experience:hover {
                background: #003d99;
                color: #fff;
                cursor: pointer;
                border: solid 1px #003d99;
            }

            .container {
                margin-top: 50px;
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
                                <input type="hidden" class="form-control" name="AccountId" value="${Account.getAccountId()}">
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Account Name</label>
                                <input type="text" class="form-control" name="username" value="${Account.getUsername()}" readonly>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Customer Name</label>
                                <input type="text" class="form-control" name="fullname" value="${User.getName()}" required>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Phone</label>
                                <input type="text" class="form-control" name="phone" value="${Account.getPhone()}" required>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Address</label>
                                <input type="text" class="form-control" name="address" value="${User.getAddress()}" required>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Email</label>
                                <input type="email" class="form-control" name="email" value="${Account.getEmail()}" readonly>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Date of Birth</label>
                                <input type="date" class="form-control" name="dob" value="${User.getDob()}" required>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Gender</label>
                                <select class="form-control" name="gender" required>
                                    <option value="true" ${User.isGender() ? 'selected' : ''}>Male</option>
                                    <option value="false" ${!User.isGender() ? 'selected' : ''}>Female</option>
                                </select>
                            </div>
                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" type="submit">Save Profile</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Section: Design Block -->

        <!-- Footer -->
        <%@include file="Component/footer.jsp" %>
        <!-- Footer -->

        <!-- Script -->
        <!-- Script -->

    </body>
</html>
