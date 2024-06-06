
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<style>
    
    .bg-image-vertical {
position: relative;
overflow: hidden;
background-repeat: no-repeat;
background-position: right center;
background-size: auto 100%;
}

@media (min-width: 1025px) {
.h-custom-2 {
height: 100%;
}
}
</style>
<body>
   <section class="vh-100">
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-6 text-black">

        <div class="px-5 ms-xl-4">
          <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>
          <span class="h1 fw-bold mb-0"></span>
        </div>

        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

            <form action="/SWP291_Team2_SE1829NJ/register" method="post" style="width: 23rem;">

            <h3 class="fw-normal mb-3 pb-3 mt-5" style="letter-spacing: 1px;">Register</h3>

            <div class="form-outline mb-4">
                <input type="text" name="username" id="form2Example18" value="${param.username}" class="form-control form-control-lg" />
              <label class="form-label" for="form2Example18">Username</label>
            </div>

            <div class="form-outline mb-4">
                <input type="password" name="password" id="form2Example28" value="${param.password}" class="form-control form-control-lg" />
              <label class="form-label" for="form2Example28">Password</label>
            </div>
              
             
              
              <div class="form-outline mb-4">
                <input type="text" name="phone" id="form2Example18" value="${param.phone}" class="form-control form-control-lg" />
              <label class="form-label" for="form2Example18">Phone</label>
            </div>

            <div class="form-outline mb-4">
                <input type="email" name="email" id="form2Example28" value="${param.email}" class="form-control form-control-lg" />
              <label class="form-label" for="form2Example28">E-mail</label>
            </div>
            
            <p style="color: red">${requestScope.registrationError}</p>

            <div class="pt-1 mb-4">
                <button class="btn btn-info btn-lg btn-block" type="submit">Register</button>
            </div>
            
       

            <p class="small mb-5 pb-lg-2"><a class="text-muted" href="#!">Forgot password?</a></p>
            <p> <a href="login.jsp" class="link-info">Login</a></p>

          </form>

        </div>

      </div>
      <div class="col-sm-6 px-0 d-none d-sm-block">
        <img src="https://nhaphonet.vn/wp-content/uploads/2022/09/hypat-1659069584-1659081355.jpg"
          alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
      </div>
    </div>
  </div>
</section>

    <!-- Include Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>