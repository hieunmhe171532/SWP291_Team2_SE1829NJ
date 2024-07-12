<%-- 
    Document   : forgotpassword
    Created on : Jul 12, 2024, 1:47:18 PM
    Author     : Linh Linh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <style>
        /* Include the CSS code here */
        /* 
            Created on : Jul 12, 2024, 1:49:06 PM
            Author     : Linh Linh
        */

        body {
            background-color: #f7f7f7;
            font-family: 'Helvetica', 'Arial', sans-serif;
        }

        .form-gap {
            padding-top: 70px;
        }

        .panel-default {
            border-color: #ddd;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .panel-body {
            padding: 20px;
        }

        .text-center h3 {
            margin-bottom: 10px;
            color: #007bff;
        }

        .text-center h2 {
            margin-top: 0;
            color: #333;
        }

        .input-group-addon {
            background-color: #007bff;
            color: #fff;
            border: 0;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(0, 123, 255, 0.6);
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover,
        .btn-primary:focus,
        .btn-primary:active {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .container {
            margin-top: 50px;
        }

        .panel {
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="form-gap"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="text-center">
                            <h3><i class="fa fa-lock fa-4x"></i></h3>
                            <h2 class="text-center">Forgot Password?</h2>
                            <p>You can reset your password here.</p>
                            <div class="panel-body">
                                <form id="register-form" role="form" autocomplete="off" class="form" method="post">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                            <input id="email" name="email" placeholder="email address" class="form-control" type="email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">
                                    </div>
                                    <input type="hidden" class="hide" name="token" id="token" value="">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

