<%@taglib uri="/WEB-INF/tlds/custom.tld" prefix="dates" %>
<%@page import="java.util.*" %>
<%@page import="dao.UserDAO"%>
<!DOCTYPE html>
<html>

    <jsp:include page="WEB-INF/head_tag.jsp">
        <jsp:param name="title" value="Crush profile" />
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
      border: 1px solid #ccc;
      right: 0;
      width: 33%;
      opacity: 100%-10%;
      background: white;
      padding-bottom: 300px;
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
            background-color: white;
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
        <div class="split right" style="transform: translate(0%,39.4%)">
                <div class="centered">
                    <div class="dropdown">
                                            <button type="button" onclick="myFunction()" class="dropbtn">Hobbies</button>
                                            <div id="myDropdown" class="dropdown-content">
                                            <ul style="list-style-type: none; margin: 0; padding: 0; overflow: hidden;">
                                                
                                            <%ArrayList<String> hobbyList = UserDAO.getHobbyCrush((String)session.getAttribute("crush")); %>
                                    <% for (String x : hobbyList) { %>
                                    <li><h6 style="font-size: 15px;font-weight: bold">  -    <%=x%></h6></li>
                                    <% } %>
                                                
                                            </ul>

                                            <br><br>
                                            <br><br>
                                            
                                        </div>
                                        </div> 
                                </div>
                            </div>
        <section class="container-fluid" id="main-body">
            <div class="row no-pad">
                <div class="col-md-8 no-pad">
                    <div class="profile-header">
                        <div class="profile-header-top">
                            <img src="${pageContext.servletContext.contextPath}/ProcessImage?emailOrPhone=${sessionScope.crush}" style="transform: translate(220%,0%)" >
                            
                        </div>
                        
                    </div>
                    <div class="profile-body">
                        <div class="profile-body-header">
                            <h3><i class="fa fa-user" aria-hidden="true"></i> About</h3>
                            
                        </div>
                        
                        <div class="profile-body-content">
                            <div class="row no-pad">
                                <div class="col-md-4 profile-body-content-tool no-pad">
                                    <%ArrayList<Integer> idList = UserDAO.getGalleryId((String)session.getAttribute("crush")); %>
                                    <% for (Integer x : idList) { %>
                                    <img src="${pageContext.servletContext.contextPath}/ProcessGalleryById?id=<%= ""+x%>" width ="100" height="100">
                                    <% } %>
                                 
                                </div>
                                <div class="col-md-8 profile-body-content-editing">
                                    <h4>Overview</h4>
                                    <div class="overview-form">
                                            <label>Full Name:</label>
                                            <input required type="text" name="first-name" maxlength="30"
                                                   value = "<%= UserDAO.getFullNameCrush((String)session.getAttribute("crush"))%>" />

                                            <label>Email/Mobile:</label>
                                            <input required type="text" name="mobile-or-email"
                                                   value = "${sessionScope.crush}"/>


                                            <label>Birthday:</label>
                                            <input required type="text" name="first-name" maxlength="30"
                                                   value = "<%= UserDAO.getBirthdayCrush((String)session.getAttribute("crush"))%>" />
                                        
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
            function myFunction() {
                document.getElementById("myDropdown").classList.toggle("show");
            }
        </script>                                           
        <script src="js/app.js"></script>
    </body>

</html>
