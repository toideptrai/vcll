<%@page import="model.Profile"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@page import="util.StringUtil"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            
            body {
                background-color: #545454;
                font-family: "Poppins", sans-serif;
                font-weight: 300;
            }

            .container {
                height: 100vh;
            }

            .card {

                width: 880px;
                border: none;
                border-radius: 15px;
                padding: 8px;
                background-color: #fff;
                position: relative;
                height: 570px;
                overflow-y: auto;
            }

            .upper {

                height: 100px;

            }

            .upper img {

                width: 100%;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;

            }

            .user {
                position: relative;
            }

            .profile img {


                height: 200px;
                width: 200px;
                margin-top: 2px;


            }

            .profile {

                position: absolute;
                top: -80px;
                left: 38%;
                height: 90px;
                width: 90px;
                /*border: 3px solid #fff;*/

                /*border-radius: 50%;*/

            }

            .follow {
                /*top: -200px;*/
                border-radius: 15px;
                padding-left: 20px;
                padding-right: 20px;
                height: 35px;
            }

            .stats span {

                font-size: 29px;
            }
        </style>
    </head>

    <body>

        <div class="container d-flex justify-content-center align-items-center">

            <div class="card">

                <div class="upper">

                    <img src="https://i.imgur.com/Qtrsrk5.jpg" class="img-fluid">

                </div>

                <div class="user text-center">

                    <div class="profile">
                        <img 
                            src="img/avt-trang.jpg">
                    </div>
                </div>


                <div class="mt-5 text-center">
                    <br><br><br><br>
                    
                    <!--<button class="btn btn-primary btn-sm follow">Follow</button>-->




                    <div class="stats">
                        <h1 style="color:palevioletred ;font-family:cursive;font-size:35px"><%= UserDAO.getFullNameCrush(StringUtil.getString(session.getAttribute("crush")))%></h1>

                    </div>



                </div>
                <div>
                    <h6 style="color:black ;font-family:cursive;font-size:20px"></h6>
                </div>


                <div style="display: flex;">
                    <div style="width:400px">
                        <%for (int i = 0; i < 12; i++) {%>
                        <img width=80px
                             src="img/avt-trang.jpg">
                        <span></span>
                        <%}%>

                    </div>
                    <div>
                        <label>Email:</label><br>
                        <ul><h6 style="color:black ;font-family:cursive;font-size:20px"><%= StringUtil.getString(session.getAttribute("crush"))%></h6></ul>
                        <div>
                            <label>Birthday: </label><br>
                            <ul style="font-family:cursive;font-size:20px"><%= UserDAO.getBirthdayCrush(StringUtil.getString(session.getAttribute("crush")))%></ul>
                        </div>
                        <label style="font-size:20px">Hobbies:</label>
                        
                        <div>
                            <ul>
                                
                            </ul>
                        </div>


                    </div>
                </div>
                <span></span>




            </div>

        </div>
    </body>

</html>