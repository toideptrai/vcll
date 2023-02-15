<%@page import="dao.UserDAO"%>
<%@page import="model.Profile"%>
<!DOCTYPE html>
<html>

<head>
    <title>SEARCH</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
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
</head>

<body>
    <%@include file="/WEB-INF/top_nav.jspf" %>
    <div class="background">
        <div class="search">
             <div class="alert-danger">
                 <%= util.StringUtil.getString(request.getAttribute("error"))%>
            </div>
            <form action="ProcessHobbiesSearch" method="post">
                <div style="display:flex">
                            <div style="display:block ; padding-right: 60px;">
                                <br><br>
                                <p><strong>Age</strong></p>

                                <div style="display:flex">
                                    <span> From </span><input style="width:40px" type="text" name="from-age">
                                    <span> To </span><input style="width:40px" type="text" name="to-age">
                                </div>
                            </div>

                            <div style="display:block ; padding-right: 60px;">
                                <br><br>
                                <p><strong>Gender</strong></p>
                                <div style="display:flex">
                                    <input type="radio" name="gioitinh" value="male"> Male
                                    <input type="radio" name="gioitinh" value="female"> Female
                                    <input type="radio" name="gioitinh" value="both"> Both
                                </div>
                            </div>
                            <br><br>
                            <% if (UserDAO.getUniversity(profile.getEmailOrPhone()).equals("ptit")) { %>

                            <div style="display:block">
                                <br>
                                <p><strong> University <img style='width: 40px' src='img/zyro-image.png'> <strong style="color:red">VIP</strong></strong></p>


                                <div style="display:flex">

                                    <input checked="true" type="radio" name="university" value="all"> All
                                    <input type="radio" name="university" value="ptit"> PTIT
                                    <input type="radio" name="university" value="other"> Other
                                </div>
                            </div>
                            <%}%>
                            <br><br><!-- comment -->
                        </div>

            <div class="dropdown">
                <button style="transform: translate(0%,30%)"type="button" onclick="myFunction()" class="dropbtn">Hobbies</button>
                <div id="myDropdown" class="dropdown-content">
                <ul>
                    <li>
                        <a href="">Sport</a>
                    <li><input type="checkbox" name="cycling" value="1"> Cycling</li>
                    <li><input type="checkbox" name="tennis" value="2"> Tennis</li>
                    <li><input type="checkbox" name="soccer" value="3"> Soccer</li>
                    <li><input type="checkbox" name="volleyball" value="4"> Volleyball</li>
                    <li><input type="checkbox" name="basketball" value="5"> Basketball </li>
                    <li><input type="checkbox" name="golf" value="6"> Golf</li>
                    <li><input type="checkbox" name="swimming" value="7"> Swimming</li>
                    <li><input type="checkbox" name="badminton" value="8"> Badminton</li>
                    <li><input type="checkbox" name="skiing" value="9"> Skiing</li>
                    </li>
                </ul>



                <ul>
                    <li>
                        <a href="">Music</a>
                    <li><input type="checkbox" name="k-pop" value="11"> K-pop</li>
                    <li><input type="checkbox" name="v-pop" value="12"> V-pop</li>
                    <li><input type="checkbox" name="ballad" value="13"> Ballad</li>
                    <li><input type="checkbox" name="rock" value="14"> Rock</li>
                    <li><input type="checkbox" name="rap" value="15"> Rap</li>
                    <li><input type="checkbox" name="bolero" value="16"> Bolero </li>
                    <li><input type="checkbox" name="jazz" value="17"> Jazz</li>
                    <li><input type="checkbox" name="classial" value="18"> Classical</li>
                    <li><input type="checkbox" name="edm" value="19"> EDM</li>
                    <li><input type="checkbox" name="us-uk" value="20"> US-UK</li>
                    <li><input type="checkbox" name="opera" value="21"> Opera</li>
                    </li>
                </ul>

                <ul>
                    <li>
                        <a href="">Movie</a>
                    <li><input type="checkbox" name="romantic" value="22"> Romantic</li>
                    <li><input type="checkbox" name="action film" value="23"> Action film</li>
                    <li><input type="checkbox" name="comedy" value="24"> Comedy</li>
                    <li><input type="checkbox" name="horror" value="25"> Horror</li>
                    <li><input type="checkbox" name="drama" value="26"> Drama</li>
                    <li><input type="checkbox" name="sci-fi" value="27"> Sci-fi</li>
                    <li><input type="checkbox" name="cartoon" value="28"> Cartoon</li>
                    <li><input type="checkbox" name="adventure" value="29"> Adventure</li>
                    </li>
                </ul>

                <ul>
                    <li>
                        <a href="">Read Book</a>
                    <li><input type="checkbox" name="thriller" value="30"> Thriller</li>
                    <li><input type="checkbox" name="short story" value="31"> Short story</li>
                    <li><input type="checkbox" name="novel" value="32"> Novel</li>
                    <li><input type="checkbox" name="poem" value="33"> Poem</li>
                    <li><input type="checkbox" name="fairy tale" value="35"> Fairy tale</li>
                    <li><input type="checkbox" name="funny story" value="36"> Funny story</li>
                    <li><input type="checkbox" name="love story" value="37"> Love story</li>
                    </li>
                </ul>

                <ul>
                    <li>
                        <a href="">More</a>
                    <li><input type="checkbox" name="sleep" value="38"> Sleep</li>
                    <li><input type="checkbox" name="eat-drink" value="39"> Eat-Drink</li>
                    <li><input type="checkbox" name="camping" value="40"> Camping</li>
                    <li><input type="checkbox" name="travelling" value="41"> Travelling</li>
                    <li><input type="checkbox" name="shopping" value="42"> Shopping</li>
                    <li><input type="checkbox" name="cooking" value="43"> Cooking</li>
                    <li><input type="checkbox" name="sing" value="44"> Sing</li>
                    <li><input type="checkbox" name="table Tennis" value="10"> Table Tennis</li>
                    <li><input type="checkbox" name="sci-fi book" value="34"> Sci-fi book</li>
                    </li>
                </ul>
                <br><br>
                <br><br>
            </div>
            </div>
        
            <button class="submit" type="submit" name="submit" value="submit">Search</button>
        </form>

    </div>
    </div>
            <script>
            function myFunction() {
                document.getElementById("myDropdown").classList.toggle("show");
            }
        </script>
</body>

</html>