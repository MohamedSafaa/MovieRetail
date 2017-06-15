<%-- 
    Document   : profile
    Created on : Dec 9, 2016, 9:14:57 PM
    Author     : Mohamed
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset=utf-8>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ASM Movies</title>
        <!-- Load Roboto font -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <!-- Load css styles -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/pluton.css" />
        <!--[if IE 7]>
            <link rel="stylesheet" type="text/css" href="css/pluton-ie7.css" />
        <![endif]-->
        <link rel="stylesheet" type="text/css" href="css/jquery.cslider.css" />
        <link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css" />
        <link rel="stylesheet" type="text/css" href="css/animate.css" />
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/apple-touch-icon-72.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57.png">
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <style>
            table , td {
                text-align: left;
            }
        </style>

        <!-- ScrollUp button end -->
        <!-- Include javascript -->
        <script src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.mixitup.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/modernizr.custom.js"></script>
        <script type="text/javascript" src="js/jquery.bxslider.js"></script>
        <script type="text/javascript" src="js/jquery.cslider.js"></script>
        <script type="text/javascript" src="js/jquery.placeholder.js"></script>
        <script type="text/javascript" src="js/jquery.inview.js"></script>
        <!-- Load google maps api and call initializeMap function defined in app.js -->
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&amp;callback=initializeMap"></script>
        <!-- css3-mediaqueries.js for IE8 or older -->
        <!--[if lt IE 9]>
            <script src="js/respond.min.js"></script>
        <![endif]-->
        <script type="text/javascript" src="js/app.js"></script>

        <style>
            .info{
                font-family:Times New Roman; 
                font-size: 25px ;
                color: white ;
                margin-bottom: 10px;

            }
        </style>
    </head>
    <body style="background:#2F2F2F;">
        <%
            String id = (String) session.getAttribute("user");
            int userID = Integer.parseInt(id);
            Connection connection = DBConnection.getActiveConnection();
            Statement statement = connection.createStatement();

            String selectQuery = "select * from ia_project.account where ia_project.account.account_id = '" + userID + "'";

            ResultSet result = statement.executeQuery(selectQuery);
            result.first();

            String userName = result.getString("account_username");
            String userRealName = result.getString("account_name");
            String userPassword = result.getString("account_password");
            int userType = result.getInt("account_type");
            String userMail = result.getString("account_mail");
            String userPicture = result.getString("account_picPath");
            int cridetCard = result.getInt("account_cridetCard");
            float userBalance = result.getFloat("balance");

            ArrayList<String> results = new ArrayList<String>();
            results.add(id);
            results.add(userName);
            results.add(userRealName);
            results.add(userPassword);
            results.add("" + userType);
            results.add(userMail);
            results.add(userPicture);
            results.add("" + cridetCard);
            results.add("" + userBalance);

        %>
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container">
                    <a href="#" class="brand">
                        <img src="images/logo1.jpg" width="120" height="40" alt="Logo" />
                        <!-- This is website logo -->
                    </a>
                    <!-- Navigation button, visible on small resolution -->
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <i class="icon-menu"></i>
                    </button>
                    <!-- Main navigation -->
                    <div class="nav-collapse collapse pull-right">
                        <ul class="nav" id="top-navigation">
                            <li class="active">
                                <a href="Controller">Home</a>
                            </li>
                            <li>
                                <a href="profile.jsp">Profile</a>
                            </li>
                            <li>
                                <a href="LogOutController">LogOut</a>
                            </li>
                        </ul>
                    </div>
                    <!-- End main navigation -->
                </div>
            </div>
        </div>
        <div style="float:left;width:25%;margin-left:20px;display:inline;">
            <img width="640" height="400" src="images/profile.jpg" >
        </div>
        <div style="width:30%;margin-left:20px;display:inline-block;">
            <!--<h1 style="color:blue; margin:0px;"> Mohamed </h1>
            <form action="Controller">
            <table>
                <tr>
                    <td style="color:white;width:30px;"><font size="5">Email:</font></td>
                    <td style="color:blue;width:30px;"><font size="5">mohamedtotti122@gmail.com</font></td>
                </tr>
                <tr><td> </td> <td> </td></tr>
                <tr><td> </td> <td> </td></tr>
                <tr><td> </td> <td> </td></tr>
                <tr><td> </td> <td> </td></tr>
                <tr>
                    <td style="color:white;width:30px;" ><font size="5">Gender:<font></td>
                    <td style="color:blue;width:30px;"><font size="5">Male</font></td>
                </tr>
                <tr><td> </td> <td> </td></tr>
                <tr><td> </td> <td> </td></tr>
                <tr><td> </td> <td> </td></tr>
                <tr><td> </td> <td> </td></tr>
                <tr>
                    <td style="color:white;width:30px;"><font size="5">Age:</font></td>
                    <td style="color:blue;width:30px;" ><font size="5">15 years old</font></td>
                </tr>
                <tr><td> </td> <td> </td></tr>
                <tr><td> </td> <td> </td></tr>
                <tr><td> </td> <td> </td></tr>
                <tr><td> </td> <td> </td></tr>
                <tr>
                    <td style="color:white;width:30px;"><font size="5">CreditCard:</font></td>
                    <td style="color:blue;width:30px;" ><font size="5">12345678</font></td>
                </tr>
                <tr><td> </td> <td> </td></tr>
                <tr><td> </td> <td> </td></tr>
                <tr><td> </td> <td> </td></tr>
                <tr><td> </td> <td> </td></tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Edit" style="width:100%;height:50px"></td>
                </tr>
            </table>
            </form>-->
            <div class="info" style="margin-left:0px">
                <h1 style="margin-left:0px; color:silver; "><%=userRealName%></h1>
            </div>
            <div class="info">
                User Name : <%=userName%>
            </div>
            <div class="info"> 
                User Email : <%=userMail%>
            </div>
            <div class="info">
                Credit Card : <%=cridetCard%>
            </div>
            <div class="info">
                Account Balance : <%=userBalance%>
            </div>
            <div class="info">
                Account Type : <%if(userType == 1)out.print("Normal User");else{out.print("Admin");}%>
            </div>
            <div class="info">
                <form action="editProfileController">
                    <input type="submit" value="Edit" style="width:80%;height:40px;">
                </form>
            </div>
        </div>
    </body>
</html>
