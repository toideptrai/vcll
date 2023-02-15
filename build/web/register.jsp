<!DOCTYPE html>
<html>

<jsp:include page="WEB-INF/head_tag.jsp">
  <jsp:param name="title" value="Create new account" />
</jsp:include>
<head>
  
<link rel="stylesheet" href="../web/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../web/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../web/css/main.css">
<link rel="stylesheet" href="../web/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../web/font-awesome/css/font-awesome.min.css">
<script src="../web/bootstrap/js/bootstrap.min.js"></script>
<script src="../web/bootstrap/js/bootstrap.js"></script>
<script src="../web/js/jquery-2.2.4.min.js"></script>
</head>

<body>
  <nav class="container-fluid" id="main-nav-login" style="background:linear-gradient(135deg,#f45fad,#71b7e6 )">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <a href="/" id="logo-large">KnowEachOther</a>
            </div>
            <div class="col-md-6">
                <form action="ProcessLogin" method="post" class="login-form-top">
                    <div class="login-form-input">
                        <label>Email or phone</label>
                        <input type="text" name="user-login-id" />
                    </div>
                    <div class="login-form-input">
                        <label>Password</label>
                        <input type="password" name="user-login-password" />
                        <button type="submit" id="btn-login">Login</button>
                        <a href="/">Forgotten password?</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</nav>

<section class="container-fluid" id="body-register-form">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h3>KnowEachOther Connect Million Hearts!!!</h3>
                <img src="img/logo.jpg" width="450" height ="400">
            </div>
            <div class="col-md-6">
                <h3>Create an account</h3>
                <p>It's free and always will be.</p>
                <div class = "alert-danger">
                     <%= util.StringUtil.getString(request.getAttribute("error")) %> 
                </div> 
                <form action="dang-ky" method="post" class="register-form">
                    <div class="reg-input-full-name">
                        <div class="reg-input" id="first-name">
                            <input type="text" name="first-name" placeholder="First name">
                            <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                            <span class="error-popup">Input your first name
                                <span></span><span></span>
                            </span>
                        </div>
                        <div class="reg-input" id="last-name">
                            <input type="text" name="last-name" placeholder="Last name">
                            <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                            <span class="error-popup">Input your last name
                                <span></span><span></span>
                            </span>
                        </div>
                    </div>
                    <div class="reg-input" id="mobile-or-email">
                        <input type="text" name="mobile-or-email" placeholder="Mobile phone or email address">
                        <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                        <span class="error-popup">Input your email or phone
                            <span></span><span></span>
                        </span>
                    </div>
                    <div class="reg-input" id="user-password">
                        <input type="password" name="user-password" placeholder="New password">
                        <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                        <span class="error-popup">Input your password
                            <span></span><span></span>
                        </span>
                    </div>
                    <label style="display:block;">Birthday</label>
                    <div class="reg-input">
                        <select name = "day" id="days">
                            <option>Day</option>
                        </select>
                        <select name ="month" id="months">
                            <option>Month</option>
                        </select>
                        <select name = "year" id="years">
                            <option>Year</option>
                        </select>
                        <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                        <span class="error-popup">Select your birthday
                            <span></span><span></span>
                        </span>
                    </div>
                    <div class="reg-input">
                        <label style="display:block;">Sex</label>
                        <input type="radio" name="sex" value="female"><label>Female</label>
                        <input type="radio" name="sex" value="male"><label>Male</label>
                    </div>
                   <div class="reg-input">
                                <label style="display:block;">University</label>
                                <input checked type="radio" name="university" value="ptit"><label>PTIT</label>
                                <input style ="transform: translate(65%,0%)" type="radio" name="university" value="other"><label style ="transform: translate(45%,0%)">Other</label>
                    </div>
                    <button type="submit" id="reg-button">Create an account</button>
                </form>
            </div>
        </div>
    </div>
</section>
<script src="./js/app.js"></script>

<script>
    $(function() {
        for (var i = 1; i <= 31; i++) {
            $("#days").append("<option>" + i + "</option>");    
        }
        
        for (var i = 1; i <= 12; i++) {
            $("#months").append("<option>" + i + "</option>");    
        }
        
        for (var i = 2016; i >= 1905; i--) {
            $("#years").append("<option>" + i + "</option>");    
        }
    });
</script>
</body>

</html>