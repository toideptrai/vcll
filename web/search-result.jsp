 <%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.ResultSearch" %>
<%@page import="dao.UserDAO" %>
<!DOCTYPE html>
<html>

<head>
    <style>
        .background {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            background-image: url("https://cur.glitter-graphics.net/pub/2926/2926044swemslxwu6.gif?fbclid=IwAR2jp9Mk6-zKP_n0shTw_mGWeE-zUqdTfyCfQ2R_8tOAdGroCAP61OjaeCU");
            background-size: cover;
        }

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            background-color: pink;
        }

        td,
        th {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #ffffff;
        }

        a {
            color: black;
            text-decoration: none;
        }

        button {
            background-color: #3e2314;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            
        }
        button:hover{
            background-color: #ccc;
            color: #333;
        }
    </style>
    <link rel="stylesheet" href="style.css">
</head>

<body>


    <div>
        <div class="background">
            <h2 style="text-align:center; font-size: 30px;">Các con vợ hợp với bạn</h2>
            <table style="font-size: 20px;">
                <tr>
                    <th>Full Name</th>
                    <th>Email/Phone</th>
                    <th>Match Rate</th>
                    <th></th>
                </tr>
                <div id="search-result">
                    <% 
                        ArrayList<ResultSearch> resultSearchList = (ArrayList<ResultSearch>) request.getAttribute("result");
                    %>
                    <%for(ResultSearch x : resultSearchList){%>
                    <form action="ProcessChatInHobbySearch" method ="post">
                    <tr>
                        <% if (UserDAO.getUniversity(x.getEmailOrPhone()).equals("ptit")){%>
                        <td><a href=""><img style='width: 40px' src='img/zyro-image.png'><%=x.getFullName()%></a> </td>
                        <% } else {%>
                        <td><a href=""><%=x.getFullName()%></a> </td>
                        <% }%>
                        <td> <a href=""><%=x.getEmailOrPhone()%></a> </td>
                        <td><%=x.getMatchRate()%> </td>
                        <td><button type="submit" class="chat" name ="emailCrush" value ="<%= x.getEmailOrPhone()%>">Send Massage</button></td>
                    </tr>
                    </form>
                    <%}%>
            </div>
            </table>
        </div>
    </div>

</body>

</html>