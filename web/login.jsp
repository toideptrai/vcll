<!DOCTYPE html>
<html>

<jsp:include page="WEB-INF/head_tag.jsp">
    <jsp:param name="title" value="Login" />
</jsp:include>
<link rel="stylesheet" href="../web/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../web/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../web/css/main.css">
<link rel="stylesheet" href="../web/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../web/font-awesome/css/font-awesome.min.css">
<script src="../web/bootstrap/js/bootstrap.min.js"></script>
<script src="../web/bootstrap/js/bootstrap.js"></script>
<script src="../web/js/jquery-2.2.4.min.js"></script>

<body>
    <nav class="container-fluid" id="main-nav-login" style="background:linear-gradient(135deg,#f45fad,#71b7e6 )">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <a href="/" id="logo-large">KnowEachOther</a>
                </div>
            </div>
        </div>
    </nav>

    <section class="container-fluid" style="background-color: #e9ebee; margin-top:-30px;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <form action="ProcessLogin" method="post" id="body-login-form">
                        <img style="margin-left:50px;margin-bottom:30px;"
                            src="../web/img/z3886871707859_73a02dec81c596fac3b8944b9bcb4a58.jpg" alt="">
                        <label>Login to KnowEachOther</label>
                        <div class="alert-danger">
                            ${sessionScope.message}
                        </div>
                        <input type="text" name="user-login-id" placeholder="Email address or phone number" />
                        <input type="password" name="user-login-password" placeholder="Password" />
                        <button type="submit" id="btn-login">Login</button>
                        <a href="/">Forgotten password?</a>
                        <a href="http://localhost:8080/BMAGBOOK/">Signup for KnowEachOther?</a>
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>

</html>