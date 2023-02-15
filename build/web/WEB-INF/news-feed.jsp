<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Profile"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>News</title>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.1.1/css/all.css'>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
    .background {
      width: 100%;
      height: 100%;
      position: absolute;
      top: 0;
      left: 0;
      /*background-image: url("https://media4.giphy.com/media/3o6vXTpomeZEyxufGU/giphy.gif?cid=790b76118193f64a59a6ce438e549ada8a766b8b569e4164&rid=giphy.gif&ct=g");*/
      /*background-image: url("https://img1.picmix.com/output/stamp/normal/3/3/2/5/1645233_b2598.gif");*/
      background-image: url("https://img6.thuthuatphanmem.vn/uploads/2022/02/25/background-nhe-nhang-danh-cho-powerpoint_085534427.jpg");
      }
    #backgroundhappy {
       width: 100%;
       height: 100%;
       position: absolute;
       top: 0;
       left: 0;
       background-image: url("https://cur.glitter-graphics.net/pub/2926/2926044swemslxwu6.gif?fbclid=IwAR2jp9Mk6-zKP_n0shTw_mGWeE-zUqdTfyCfQ2R_8tOAdGroCAP61OjaeCU");
       /*background-size: cover;*/

   }
   #backgroundchill {
       width: 100%;
       height: 100%;
       position: absolute;
       top: 0;
       left: 0;
       background-image: url("https://img5.thuthuatphanmem.vn/uploads/2022/01/16/anh-chill-buon-phong-canh_043708818.jpg");
       /*background-size: cover;*/
   }
   #backgroundnormal {
       width: 100%;
       height: 100%;
       position: absolute;
       top: 0;
       left: 0;
       background-image: url("https://gocnhoannie.com/wp-content/uploads/2020/07/S%E1%BB%B1-nghi%E1%BB%87p-kh%C3%B4ng-ph%E1%BA%A3i-l%C3%BAc-n%C3%A0o-c%C5%A9ng-l%C3%A0-m%E1%BB%99t-%C4%91%C6%B0%E1%BB%9Dng-th%E1%BA%B3ng.gif");
       background-size: cover;
   }
   #backgroundheartbroken {
       width: 100%;
       height: 100%;
       position: absolute;
       top: 0;
       left: 0;
       background-image: url("https://acegif.com/wp-content/uploads/rainy-10.gif");
       background-size: cover;
   }
   #backgroundsad {
       width: 100%;
       height: 100%;
       position: absolute;
       top: 0;
       left: 0;
       background-image: url("https://i.pinimg.com/originals/43/ed/a3/43eda34e5d5580d4ab08898a58810a2a.gif");
       background-size: cover;
   }

  li {
      float: left;
      width: 120px;
  }

  ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      overflow: hidden;
  }

  a {
      font-size: 20px;
      font-family: sans-serif;
      color: black;
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

  nav ul li#space1 {
      flex: 1;
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

  #topheader .navbar-nav li>a:hover,
  #topheader .navbar-nav li>a:focus {
      color: #0B84ED;
  }

  #topheader .navbar-nav li.active>a {
      color: #0B84ED;
  }

  happy:hover {
      background-color: #fff;

  }

  .active {
      color: #0B84ED !important;
  }

  .split {
      height: 100%;
      width: 50%;
      position: fixed;
      z-index: 1;
      top: 46px;
      overflow-x: hidden;
      padding-top: 20px;
  }

  .left {
      left: 0;
      width: 10%;
      opacity: 100%-10%;
      background:#ccffcc;
      border-right: groove;
      border-color: #000066;
      border-width: 3px;
      opacity: 0.6;
  }

  .right {
      right: 0;
      border-left: groove;
      border-color: #000066;
      border-width: 3px;
      width: 45%;
      opacity: 100%-10%;
      /*background: #ffcccc;*/
      opacity: 0.7;
      background-image: url("https://media.ex-cdn.com/EXP/media.vntravellive.com/files/news/2019/05/27/7-trai-nghiem-thu-vi-o-lucerne-thuy-si-130557.jpg");
  }

  .center {
      top: 100px;
      left: 17%;
      width: 45%;
      opacity: 100%-10%;
  }


  .happy:hover {
      background-color: #ff0000 !important;
      color: white;
  }

  .active {
      color: #0B84ED !important;
  }



  .sidenav a {
      padding: 6px 8px 6px 16px;
      text-decoration: none;
      font-size: 18px;
      color: #000000;
      display: block;
  }

  .sidenav a:hover {
      color: #1c8fed;
  }

  main {
      display: flex;
  }

  main>* {
      border: 1px solid;
  }

  table {
      border-collapse: collapse;
      font-family: helvetica
  }

  td,
  th {
      border: 1px solid;
      padding: 10px;
      min-width: 170px;
      background: white;
      box-sizing: border-box;
      text-align: left;
  }

  .table-container {
      height: 300px;
      width: 50vw;
      overflow-y: auto;
      overflow-x: hidden;
      margin-left: 10%;
  }

  thead th {
      position: -webkit-sticky;
      /* position: sticky; */
      top: 0;
      z-index: 2;
      background: hsl(20, 50%, 70%);
  }

  thead th:first-child {
      left: 0;
      z-index: 3;
  }


  tbody {
      overflow: scroll;
      height: 200px;
  }

  tr> :first-child {
      position: -webkit-sticky;
      /* position: sticky;  */
      background: hsl(180, 50%, 70%);
      left: 0;
  }

  tr> :first-child {
      box-shadow: inset 0px 1px black;
  }

  /* dropdown hobbies */
  .submit {
      width: 30%;
      height: 5%;
      position: absolute;
      top: 90%;
      left: 35%;
      background-color: #eb6d9a;
      background-size: cover;
      font-family: 'Arial Black', Gadget, sans-serif;
  }

  .search {
      width: 50%;
      height: 93.5%;
      position: absolute;
      top: 46px;
      left: 25%;
      padding: 0px 10px 10px 10px;
      border: 2px solid rgb(235, 109, 154);
      background-color: rgb(255, 255, 255);
      background-size: cover;
      font-family: 'Arial', Gadget, sans-serif;
  }

  .dropbtn {
      background-color: #ce2243;
      color: white;
      padding: 16px;
      font-size: 16px;
      border: none;
      cursor: pointer;
  }

  .dropbtn:hover,
  .dropbtn:focus {
      background-color: #eb6d9a;
  }

  .dropdown {
      position: relative;
      display: inline-block;
      width: 100%;
  }

  .dropdown-content {
      display: none;
      position: absolute;
      background-color: #f7c9e1;
      width: 80%;
      height: 80vh;
      box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
      z-index: 0;
  }

  .dropdown-content a {
      color: black;
      padding: 16px 16px;
      text-decoration: none;
      display: block;
  }

  .dropdown a:hover {
      background-color: #ddd;
  }

  .show {
      display: block;
  }

  .text-box {
      /*filter: blur(2px);  -webkit-filter: blur(2px);*/
  
      width: 550px;
      height: 250px;
      border-style: groove;
      border-color: green;
      border-width: 7px;
      background-color: #f8f8f8;
      overflow-x: hidden;
      overflow-y: auto;
      margin-left: 35px;
      background-image: url("https://w0.peakpx.com/wallpaper/82/984/HD-wallpaper-beautiful-nature-nature-beautiful-scenery-other.jpg");
      color: yellow;
      /*background: gray;*/
      font-size : 16px;
      font-weight: bold;
      
  }
  .van-tho{
      height:60px;
      width:70%;
      background-color:pink;
      border-style: groove;
      border-color: coral;
      border-width: 7px;
      font-size:18px;
      margin-top:10px;
      text-align: center;
      color: #0000ff;
  }
  
</style>

<body>
    <div class="background" id = "background<%=request.getAttribute("currentEmotion") %>">
        <header class="navbarbg" id="topheader"
            style="background-color: #e96c98;height: 46px;width: 100%;position: fixed;top: 0;left: 0;z-index: 1">
            <nav>
                <ul class="navbar-nav">
                    <li>
                        <a href="profile.jsp">
                            <img class="avatar-small" src="${pageContext.servletContext.contextPath}/ProcessImage?emailOrPhone=${sessionScope.user.emailOrPhone}" width="35" height="35"> 
                        <% 
                            Profile profile = (Profile) session.getAttribute("user");
                        %>
                        
                        <%=profile.getFirstName() %>
                        
                    </a>
                    </li>
                    <li> <a class="tooltip active" data-tooltip="Search" href="search.jsp" id="search"> <i
                                class="fas fa-search  "></i>
                        </a> </li>
                    <li> <a class="tooltip" class="active" data-tooltip="Home" href="" id="home"> <i
                                class="fas fa-home    "></i>
                        </a> </li>

                    <li> <a class="tooltip" data-tooltip="Friend" href="\" id="friend"> <i
                                class="fas fa-user-alt    "></i>
                        </a> </li>
                    </a> </li>
                    <li id="space1"></li>
                    <li> <a class="tooltip " data-tooltip="Message" href="chatbox.jsp" id="message"> <i
                                class="fas fa-comments    "></i>
                        </a> </li>
                    <li> <a class="tooltip" class="active" data-tooltip="Call" href="#" id="Call"> <i
                                class="fas fa-phone    "></i>
                        </a> </li>
                    <li> <a class="tooltip" class="active" data-tooltip="Notification" href="#" id="notification"> <i
                                class="fas fa-bell    "></i>
                        </a> </li>
                    <li>
                    <a href="login.jsp"><label>Log out</label></a>
                </li>
                </ul>
            </nav>
        </header>
        <div class="split left">
            <div class="centered">
                <div class="sidenav">
                    <ul>
                        <li>
                            <ul class="game">
                                <a href="/" style="font-size:40px"> <i class="fas fa-gamepad    "></i></a>
                                <li>
                                    <a href="https://gamevui.vn/pikachu/game" target="_blank">Pikachu</a>
                                </li>
                                <li>
                                    <a href="https://gamevui.vn/angry-birds/game" target="_blank">Angry Birds</a>
                                </li>
                                <li>
                                    <a href="https://gamevui.vn/ngoi-den-trong-rung/game" target="_blank">Fire&Water</a>
                                </li>
                                <li>
                                    <a href="https://gamevui.vn/dua-xe/game" target="_blank">Car</a>
                                </li>
                                <li>
                                    <a href="https://gamevui.vn/sudoku-tri-tue/game" target="_blank">Sudoku</a>
                                </li>
                            </ul>
                            <ul class="tool">
                                <a href="#" style="font-size:40px"><i class="fas fa-toolbox"></i></a>
                                <li>
                                    <a href="https://fast.com/" target="_blank">CodePTIT</a>
                                </li>
                                <li>
                                    <a href="https://www.google.com/search?q=weather&oq=weather&aqs=chrome..69i57j0l7.1001j0j7&sourceid=chrome&ie=UTF-8"
                                        target="_blank">Weather</a>
                                </li>
                                <li>
                                    <a href="https://tools.pdf24.org/vi/" target="_blank">PDF Tool</a>
                                </li>
                                <li>
                                    <a href="https://snapedit.app/vi" target="_blank"> Photoshop</a>
                                </li>
                            </ul>
                            
                            <ul class="">
                                <a href="#" style="font-size:40px"><i class="fa fa-soccer-ball-o"></i></a>
                                <li>
                                    <a href="https://rakhoi6.com/" target="_blank">World cup</a>
                                </li>
                                <li>
                                    <a href="https://www.fb88hot.com/"
                                        target="_blank">Betting</a>
                                </li>
                                <li>
                                    <a href="https://onefootball.com/en/matches" target="_blank">Match</a>
                                </li>
                                <li>
                                    <a href="https://vi.wikipedia.org/wiki/Cristiano_Ronaldo">Ronaldo</a>
                                </li>
                            </ul>

                        </li>
                    </ul>
                </div>
            </div>
        </div>
            <div class="split center">
                <div class="centered">
                    <form action="ProcessTamTrang" method = "post">
                        <button name="happy" class="happy" type="submit"
                                style="height:80px;width:70%;background-color:pink;border-radius: 20px; font-size:40px;margin-top:10px;">
                            <div>
                                HAPPY
                            </div>
                        </button>
                        <button name="chill" class="happy" type="submit"
                                style="height:80px;width:70%;background-color:#9999ff;border-radius: 20px; font-size:40px;margin-top:10px;">
                            <div>
                                CHILL
                            </div>
                        </button>
                        <button name="normal" class="happy" type="submit"
                                style="height:80px;width:70%;background-color:#ffff66;border-radius: 20px; font-size:40px;margin-top:10px;">
                            <div>

                                NORMAL
                            </div>
                        </button>
                        <button name="sad" class="happy" type="submit"
                                style="height:80px;width:70%;background-color:#9900cc;border-radius: 20px; font-size:40px;margin-top:10px;">
                            <div>

                                SAD
                            </div>
                        </button>
                        <button name="heartbroken" class="happy" type="submit"
                                style="height:80px;width:70%;background-color:#000066;border-radius: 20px; font-size:40px;margin-top:10px;">
                            <div>

                                HEART BROKEN
                            </div>
                        </button>
                        <%if (request.getAttribute("song") != null) {%>
                        <a href="<%=request.getAttribute("song")%>" target="_blank"><h4 class="van-tho"> <%=request.getAttribute("chon")%> </h4></a>
                        <%}%>
                       
                    </form>
                </div>
            </div>
            <div class="split right">
                <div class="centered">
                    <form action="ProcessTravelAdress" method="post">
                        <label for="cars" style="font-weight: bold;">Choose a place:</label><button type="submit"style="font-weight: bold;"> OK</button>
                        <select name="adress" id="cars" value="<%= request.getAttribute("adress")%>" style="font-weight: bold;">
                            <optgroup label="Some of the beautiful places in Viet Nam" >
                                <option style="font-weight: bold;" value="Ha Noi">Viet Nam</option>
                                <option style="font-weight: bold;" value="Nghe An">Nghe An</option>
                                <option style="font-weight: bold;" value="Ha Giang">Ha Giang</option>
                                <option style="font-weight: bold;"value="Ha Noi">Ha Noi</option>
                                <option style="font-weight: bold;"value="Quang Ninh">Quang Ninh</option>
                                <option style="font-weight: bold;"value="Da Nang">Da Nang</option>
                                <option style="font-weight: bold;"value="TP Ho Chi Minh">TP Ho Chi Minh</option>
                            </optgroup>
                        </select>
                        <br><br>
                    </form>
                    <div class="image" >
                        <!--<img style="height:40vh;width:100%;object-fit: contain;margin-bottom: 20px;" 
                             src="https://statics.vinpearl.com/dia-diem-du-lich-mien-bac-1-ngay-4_1628240785.jpg" alt="">-->
                        <% if (request.getAttribute("adress")!=null){%>
                        <img  style="height:40vh;width:100%;object-fit: contain;margin-bottom: 20px; " 
                            src="${pageContext.servletContext.contextPath}/ProcessImageAdress?adress=${requestScope.adress}">
                        <%}%>
                        
                        <% if (request.getAttribute("adress")==null){%>
                        <img style="height:40vh;width:100%;object-fit: contain;margin-bottom: 20px;" 
                            src="https://media.suckhoecong.vn/thumb_x800x450/Images/Uploaded/Share/2019/02/18/ngam-nhung-hinh-anh-tuyet-dep-ve-viet-nam-tren-bao-anh11550481157.jpg">
                        <%}%>
                    </div>

                    <div class="text-box" style="transform: translate(5%,0%); " >
                        <% if (request.getAttribute("adress")!= null) {%>
                        <h2 style="transform: translate(10%,0%)">You have to go there if you travel to <%= request.getAttribute("adress")%>!</h2>
                            <% } %>
                        <% if (request.getAttribute("adress")==null) {%>
                            <p style="transform: translate(7%,0%)" >
                                Viet Nam is a country in Southeast Asia, at the eastern edge of mainland <br><br>Southeast Asia. 
                                If you are searching for a country to travel to and relax, <br><br>you shouldn't miss a beautiful place like Viet Nam.
                                Also, Vietnamese <br><br> people are very friendly, and you will feel like you are in your home.<br>
                            </p>
                        <% } %>
                        <p style="transform: translate(10%,0%)">
                            <%= util.StringUtil.getString(request.getAttribute("description"))%>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>