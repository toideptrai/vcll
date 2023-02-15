<%@page import="util.StringUtil" %>
<%@page import="model.Profile"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.1.1/css/all.css'>
        <style>
            a {
                color: #000;
                text-decoration: none;
            }

            .navbarbg {
                background-color: #e96c98;
                height: 46px;
                width: 100%;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1;
            }

            .bg {
                background-image: url("https://cur.glitter-graphics.net/pub/2926/2926044swemslxwu6.gif?fbclid=IwAR2jp9Mk6-zKP_n0shTw_mGWeE-zUqdTfyCfQ2R_8tOAdGroCAP61OjaeCU");
                font-family: Arial;
                padding-top: 25px;
                height: 650px;
                padding-bottom: 20px;
            }

            .container {
                /*width: 50%;*/
                /*height: 87%;*/
                height: 520px !important;
                width: 100% !important;
                margin: auto;
                overflow-x: hidden;
                overflow-y: auto;
                opacity: calc(100% - 10%);
            }

            .hide {
                display: none;
            }

            .loader {
                position: fixed;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;
                background-color: #000;
            }

            :root {
                --btn-width-100: 100px;
            }

            body {
                margin: 0;
                padding: 0;
            }

            nav {
                margin: 0;
                padding: 0;
            }

            nav ul {
                margin: 0;
                list-style: none;
                display: flex;
                box-shadow: 0 1px 8px rgba(0, 0, 0, 0.3);
            }

            nav ul li {
                padding: 3px;
            }

            nav ul li a {
                display: inline-block;
                text-decoration: none;
            }

            nav ul li #fb {
                background: #0B84ED;
                color: #fff;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 2rem;
            }

            nav ul li #search_btn {
                border: none;
                outline: none;
                background: rgba(0, 0, 0, 0.068);
                padding: 8px;
                color: #888;
                width: 40px;
                height: 40px;
                font-size: 1rem;
                border-radius: 50%;
                cursor: pointer;

            }

            nav ul li#space1 {
                flex: 1;
            }

            nav ul li#space2 {
                flex: 2;
            }

            nav ul li a {
                height: 40px;
                width: var(--btn-width-100);
                font-size: 1.5rem;
                display: flex;
                justify-content: center;
                align-items: center;
                color: rgb(158, 158, 158);
                transition: .5s;

            }

            nav ul li #btn_plus,
            nav ul li #btn_msg,
            nav ul li #btn_bell,
            nav ul li #btn_profile {
                height: 40px;
                width: 40px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 1rem;
                color: #444;
                background: rgba(0, 0, 0, 0.068);
                border: none;
                outline: none;
                border-radius: 50%;
                cursor: pointer;
            }


            nav ul li:hover #home,
            nav ul li:hover #group,
            nav ul li:hover #tv,
            nav ul li:hover #friend {
                background: rgba(0, 0, 0, 0.138);
                color: #444;
                border-radius: 5px;

            }



            .active {
                color: #0B84ED !important;
            }

            .tooltip {
                position: relative;
            }

            .tooltip::after {
                content: attr(data-tooltip);
                height: 30px;
                background: rgba(0, 0, 0, 0.4);
                color: #fff;
                font-size: 1rem;
                text-align: center;
                position: absolute;
                bottom: -150%;
                padding: 5px 12px;
                line-height: 30px;
                border-radius: 3px;
                opacity: 0;
                transition: .3s;
                pointer-events: none;
                user-select: none;
            }

            .tooltip:hover::after {
                opacity: 1;
            }

            nav ul li #btn_profile::after {
                margin-left: -20px;
            }


            @media screen and (max-width: 700px) {

                nav ul li#space1,
                nav ul li#space2 {
                    display: none;
                }

                nav ul {
                    min-width: 600px;
                    justify-content: space-between;
                }

                :root {
                    --btn-width-100: 60px;
                }
            }


            .messages {
                margin-bottom: 10px;
            }

            .messages--received .message {
                float: left;
                background-color: #ddd;
                border-bottom-left-radius: 5px;
                border-top-left-radius: 5px;
            }

            .messages--received .message:first-child {
                border-top-left-radius: 15px;
            }

            .messages--received .message:last-child {
                border-bottom-left-radius: 15px;
            }

            .messages--sent .message {
                float: right;
                background-color: #e96c98;
                color: #fff;
                border-bottom-right-radius: 5px;
                border-top-right-radius: 5px;
            }

            .messages--sent .message:first-child {
                border-top-right-radius: 15px;
            }

            .messages--sent .message:last-child {
                border-bottom-right-radius: 15px;
            }

            .message {
                display: inline-block;
                margin-bottom: 2px;
                clear: both;
                padding: 7px 13px;
                font-size: 12px;
                border-radius: 15px;
                line-height: 1.4;
            }
        </style>

    </head>

    <body>
        <div class="bg">
            <header class="navbarbg">
                <nav>
                    <ul>
                        <li>
                        <a href="profile.jsp">
                            <img class="avatar-small" src="${pageContext.servletContext.contextPath}/ProcessImage?emailOrPhone=${sessionScope.user.emailOrPhone}" width="35" height="35"> 
                        <% 
                            Profile profile = (Profile) session.getAttribute("user");
                        %>
                        
                        <%=profile.getFirstName() %>
                        
                    </a>
                    </li>
                        <li> <a id="search_btn" class="tooltip" data-tooltip="Search" href = "search.jsp"> <i
                                    class="fas fa-search    "></i>
                            </a> </li>

                        <li> <a class="tooltip active" data-tooltip="Home" href="ProcessNewsFeed" id="home"> <i
                                    class="fas fa-home    "></i>
                            </a> </li>
                        <li> <a class="tooltip" data-tooltip="Friend" href="ProcessFollow" id="friend"> <span class="mess-notif"><div class = "thongbao"></div></span> <i
                                    class="fas fa-user-alt    "></i>
                            </a> </li>
                        <li id="space1"><div class = "thongBaoLover"></div></li>
                        <li> <button class="tooltip" data-tooltip="Message" id="btn_msg"><i
                                    class="fab fa-facebook-messenger    "></i></button></li>
                        <li> <a class="tooltip"  data-tooltip="Profile" href = "ProcessProfileCrush" id="btn_profile"><i
                                    class="fas fa-user-cog    "></i></a> </li>
                    </ul>
                </nav>
            </header>
            <div style="width: 37%;margin: auto;background-color: pink;">
                <center>
                    <h1 style="color:palevioletred ;font-family:cursive;font-size:35px">KnowEachOther</h1>
                </center>
                <form action="ProcessSetNguoiNhan" method="post" id="body-login-form">
                    <label style="font-size: 20px;font-family: cursive, Helvetica, sans-serif;">To</label>
                    <input type="text" name="friend" placeholder="friend Email or phone" /
                           value="<%= StringUtil.getString(session.getAttribute("crush"))%>">
                    <br><br>
                    <div  class="container"   id="messages-scroll" >
                        <div class="message">
                            <ul class="message-box" style="list-style: none; width: 400px; margin: auto;">

                            </ul>
                        </div>
                    </div>
                    <input style = "font-size: 20px" type="text" name="content" placeholder="Content in here" />
                    <button type="submit" id="btn-login" style="background-color:palevioletred ;width: 50px; height: 30px; 
                            transform: translate(0%,-10%)">Send</button>
                </form>
            </div>

    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript">
        let load = 0;
        $(document).ready(() => {
            setInterval(() => {
                $.post('http://localhost:8080/KnowEachOther/chat-box', (data) => {
                    let messages = data.split(';');
                    let html = '<div class="container_2" id="messages-scroll">';
                    let thongBao = messages[messages.length - 1];
                    const messageBox2 = document.querySelector('.thongbao');
                    messageBox2.innerHTML = thongBao;


                    for (let i = 0; i < messages.length - 1; i++) {
                        let item = messages[i];
                        if (item[0] === '<')
                            html += `<div class="messages messages--received"><li style="text-align: left; margin: 5px 0px;"><div class="message">` + item.slice(1) + `</div></li></div>`;
                        else if (item[0] === '>')
                            html += `<div class="messages messages--sent"><li style="text-align: right; background-color: #f8f8f8; margin: 5px 0px;"><div class="message">` + item.slice(1) + `</div></li></div>`;
                    }
                    html += '</div>'
                    console.log(html);
                    const messageBox = document.querySelector('.message-box');
                    messageBox.innerHTML = html;
                    if (load === 0) {
                        var element = document.getElementById("messages-scroll");
                        element.scrollTop = element.scrollHeight;
                        //session.setAttribute("isScrolled") = 1;
                        load = 1;
                    }

                })
            }, 1000);
        })
    </script>
    <script>
        function updateScroll() {
            var element = document.getElementById("messages-scroll");
            element.scrollTop = element.scrollHeight;
        }
        setTimeout(updateScroll, 100);
    </script>

</html>