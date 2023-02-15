<%@taglib uri="/WEB-INF/tlds/custom.tld" prefix="dates" %>
<%@page import="java.util.*" %>
<%@page import="dao.UserDAO"%>
<!DOCTYPE html>
<html>

    <jsp:include page="WEB-INF/head_tag.jsp">
        <jsp:param name="title" value="Your profile" />
    </jsp:include>
    <style>
        .split {
      height: 100%;
      width: 50%;
      position: fixed;
      z-index: 1;
      top: 46px;
      overflow-x: hidden;
      padding-top: 20px;
  }
    .right {
      right: 0;
      width: 33%;
      opacity: 100%-10%;
      background: white;
      
  }

        p {
            font-size: 20px;
            font-family: sans-serif;
            color: black;
        }

        .background {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            background-image: url("https://cur.glitter-graphics.net/pub/2926/2926044swemslxwu6.gif?fbclid=IwAR2jp9Mk6-zKP_n0shTw_mGWeE-zUqdTfyCfQ2R_8tOAdGroCAP61OjaeCU ");
            background-size: cover;
        }

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
            height: 100%;
            position: absolute;
            top: 0;
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
            width: 100%;
            overflow: no-content;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
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

        .menu {
            display: none;
            position: absolute;
            background-color: #f7c9e1;
            width: 100%;
            overflow: auto;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }
    </style>
    <body>
        <%@include file="WEB-INF/top_nav.jspf" %>
        <form action="ProcessProfileHobby" method="post">
             <div class="split right">
                <div class="centered">
                    <div class="dropdown">
                                            <button type="button" onclick="myFunction()" class="dropbtn">Hobbies</button>
                                            <div id="myDropdown" class="dropdown-content">
                                            <ul style="list-style-type: none; margin: 0; padding: 0; overflow: hidden;">
                                                <li>
                                                    <a href="">Sport</a>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="cycling" value="1"> Cycling</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="tennis" value="2"> Tennis</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="soccer" value="3"> Soccer</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="volleyball" value="4"> Volleyball</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="basketball" value="5"> Basketball </li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="golf" value="6"> Golf</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="swimming" value="7"> Swimming</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="badminton" value="8"> Badminton</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="skiing" value="9"> Skiing</li>
                                                </li>
                                            </ul>


                                            <ul style="list-style-type: none; margin: 0; padding: 0; overflow: hidden;">

                                                <li>
                                                    <a href="">Music</a>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="k-pop" value="11"> K-pop</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="v-pop" value="12"> V-pop</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="ballad" value="13"> Ballad</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="rock" value="14"> Rock</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="rap" value="15"> Rap</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="bolero" value="16"> Bolero </li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="jazz" value="17"> Jazz</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="classial" value="18"> Classical</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="edm" value="19"> EDM</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="us-uk" value="20"> US-UK</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="opera" value="21"> Opera</li>
                                                </li>
                                            </ul>

                                            <ul style="list-style-type: none; margin: 0; padding: 0; overflow: hidden;">
                                                <li>
                                                    <a href="">Movie</a>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="romantic" value="22"> Romantic</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="action film" value="23"> Action film</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="comedy" value="24"> Comedy</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="horror" value="25"> Horror</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="drama" value="26"> Drama</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="sci-fi" value="27"> Sci-fi</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="cartoon" value="28"> Cartoon</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="adventure" value="29"> Adventure</li>
                                                </li>
                                            </ul>

                                            <ul style="list-style-type: none; margin: 0; padding: 0; overflow: hidden;">
                                                <li>
                                                    <a href="">Read Book</a>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="thriller" value="30"> Thriller</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="short story" value="31"> Short story</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="novel" value="32"> Novel</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="poem" value="33"> Poem</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="fairy tale" value="35"> Fairy tale</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="funny story" value="36"> Funny story</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="love story" value="37"> Love story</li>
                                                </li>
                                            </ul>

                                            <ul style="list-style-type: none; margin: 0; padding: 0; overflow: hidden;">
                                                <li>
                                                    <a href="">More</a>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="sleep" value="38"> Sleep</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="eat-drink" value="39"> Eat-Drink</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="camping" value="40"> Camping</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="travelling" value="41"> Travelling</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="shopping" value="42"> Shopping</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="cooking" value="43"> Cooking</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="sing" value="44"> Sing</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="table Tennis" value="10"> Table Tennis</li>
                                                <li style="float: left; width: 120px;"><input type="checkbox" name="sci-fi book" value="34"> Sci-fi book</li>
                                                </li>
                                            </ul>
                                                <button type="submit">Set Your Hobbies</button>
                                            <br><br>
                                            <br><br>
                                            
                                        </div>
                                        </div> 
                                </div>
                            </div>
        </form>
        <section class="container-fluid" id="main-body">
            <div class="row no-pad">
                <div class="col-md-8 no-pad">
                    <div class="profile-header">   
                        
                        <div class="profile-header-top">

                            <span id="profile-button-add-cover">
                                <form action="UploadImage" id="frmUploadPhoto" 
                                      enctype="multipart/form-data" method="post" >
                                    <i class="fa fa-camera" aria-hidden="true"></i> 
                                    Update Profile Picture
                                    <input class="input-cover-photo" type="file" 
                                           id="userCoverPhoto" name="userCoverPhoto"/>
                                </form>
                            </span>
                            <img src="${pageContext.servletContext.contextPath}/ProcessImage?emailOrPhone=${sessionScope.user.emailOrPhone}" style="transform: translate(220%,0%)" >
                            
                            <h3 style="transform: translate(200%,290%);color: black">
                                ${sessionScope.user.lastName}
                                ${sessionScope.user.firstName}
                            </h3>
                            <!-- <a href="" id="profile-button-update-info">Update Info <span>1</span></a>
                            <a href="" id="profile-button-view-log">View Activity Log <span>5</span></a> -->      
                        </div>
                        
                    </div>
                    <div class="profile-body">
                        <div class="profile-body-header">
                            <h3><i class="fa fa-user" aria-hidden="true"></i> About</h3>
                        </div>
                        
                        <div class="profile-body-content">
                            <div class="row no-pad">
                                <div class="col-md-4 profile-body-content-tool no-pad">
                                    
                                <form action="ProcessUploadGallery" id="frmUploadGallery" 
                                      enctype="multipart/form-data" method="post" >
                                    <i class="fa fa-camera" aria-hidden="true"></i> 
                                    Add Picture To Your Gallery
                                    <input class="input-cover-photo" type="file" 
                                           id="userGallery" name="userGallery"/>
                                </form>
                                    <!--<img src="${pageContext.servletContext.contextPath}/ProcessGalleryById" width ="100" height="100">-->
                                    <% String email_mobile = profile.getEmailOrPhone(); %>
                                    <%ArrayList<Integer> idList = UserDAO.getGalleryId(email_mobile); %>
                                    <% for (Integer x : idList) { %>
                                    <img src="${pageContext.servletContext.contextPath}/ProcessGalleryById?id=<%= ""+x%>" width ="100" height="100">
                                    <% } %>
                            
                            
                                </div>
                                <div class="col-md-8 profile-body-content-editing">
                                    <h4>Overview</h4>
                                    <div class="overview-form">
                                        <div class="alert-danger">
                                            <%= util.StringUtil.getString(session.getAttribute("error")) %>
                                        </div>
                                        <form action="ProcessProfile" method="post">
                                            <label>First Name:</label>
                                            <input required type="text" name="first-name" maxlength="30"
                                                   value = "<%=profile.getFirstName()%>"/>

                                            <label>Last Name:</label>
                                            <input required type="text" name="last-name" maxlength="30" 
                                                   value = "<%=profile.getLastName()%>"/>

                                            <label>Email/Mobile:</label>
                                            <input required type="text" name="mobile-or-email"
                                                   value = "<%=profile.getEmailOrPhone()%>"/>

                                            <label>Password:</label>
                                            <input required type="password" name="user-password" 
                                                   value ="<%= profile.getPassword()%>"/>

                                           <label>Sex:</label>
                                            <%if(profile.getSex().equals("male")){ %>
                                            <input checked type="radio" name="sex" id="male" value="1"> <label
                                                class="light" for="male">Male</label>
                                            <input type="radio" name="sex" id="female" value="2"> <label
                                                class="light" for="female">Female</label>
                                                <%}else{%>
                                                <input  type="radio" name="sex" id="male" value="1"> <label
                                                class="light" for="male">Male</label>
                                            <input checked type="radio" name="sex" id="female" value="2"> <label
                                                class="light" for="female">Female</label>
                                            <%}%>
                                            
                                            <label style="display:block;">University</label>
                                            <%if(UserDAO.getUniversity(profile.getEmailOrPhone()).equals("ptit")){%>
                                                <input checked type="radio" name="university" value="ptit"><label class="light">PTIT</label>
                                                <input  type="radio" name="university" value="other"><label class="light">Other</label>
                                            <%}else{%>
                                            <input  type="radio" name="university" value="ptit"><label class="light">PTIT</label>
                                                <input checked type="radio" name="university" value="other"><label class="light">Other</label>
                                            <%}%>
                                            
                                            <label style="display:block;">Birthday</label>
                                            <div class="reg-input">
                                                <select name="day" id="days">
                                                    <option>Day</option>
                                                </select>
                                                <select name="month" id="months">
                                                    <option>Month</option>
                                                </select>
                                                <select name="year" id="years">
                                                    <option>Year</option>
                                                </select>
                                            </div>
                                            <button name="action" value="update-profile" type="submit">Save Changes</button>
                                        </form>
                                    </div>
                                </div>
                                
                                </div>                 
                            </div>
                        </div>
                                                   
                    </div>
                </div>
                
                
            </div>
                                                 
        </section>
        <script>
            $(function () {
                $('#userCoverPhoto').change(function() {
                    $('#frmUploadPhoto').submit();
                });
                
                $('#userGallery').change(function() {
                    $('#frmUploadGallery').submit();
                });
                
                var day = "${dates:getDatePart(sessionScope.user.birthday)[0]}";
                var month = "${dates:getDatePart(sessionScope.user.birthday)[1]}";
                var year = "${dates:getDatePart(sessionScope.user.birthday)[2]}";
                for (var i = 1; i <= 31; i++) {
                    if (i == day) $("#days").append("<option selected>" + i + "</option>");
                    else $("#days").append("<option>" + i + "</option>");
                }

                for (var i = 1; i <= 12; i++) {
                    if (i == month) $("#months").append("<option selected>" + i + "</option>");
                    else $("#months").append("<option>" + i + "</option>");
                }

                for (var i = 2016; i >= 1905; i--) {
                    if (i == year) $("#years").append("<option selected>" + i + "</option>");
                    else $("#years").append("<option>" + i + "</option>");
                }
                
                var selectedSex = "${sessionScope.user.sex}";
                $("input[name=sex][value=" + selectedSex + "]").prop('checked', true);
                
                var viewportHeight = $(window).height();
                $("#online-list").css("max-height", viewportHeight);
            });
        </script>
        <script>
            function myFunction() {
                document.getElementById("myDropdown").classList.toggle("show");
            }
        </script>
        <script src="js/app.js"></script>
    </body>

</html>
