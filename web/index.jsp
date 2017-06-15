<%-- 
    Document   : index
    Created on : Dec 8, 2016, 4:26:21 AM
    Author     : Mohamed
--%>

<%@page import="Model.movie"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset=utf-8>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pluton Theme by BraphBerry.com</title>
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
    </head>

    <body style="background:#2F2F2F">
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
        <div class="section secondary-section " id="portfolio">
            <div class="triangle"></div>
            <div class="container">
                <div class=" title">
                    <h1 style="color:white;">What do you want?</h1>
                    <p style="color:white;">Here You can find all what you want.</p>
                </div>
                <center>
                    <form action="SearchMovieController">
                        <table>
                            <tr>
                                <td><select name="method">
                                        <option selected>Name</option>
                                        <option>Year</option>
                                        <option>Actor</option>
                                    </select></td>
                                <td><input type="text" name ="movie" placeholder="Write here.."></td>
                            </tr>
                        </table>
                    </form>
                </center>
                <!-- Start details for portfolio project 1 -->
                    <!-- End details for portfolio project 9 -->
                    
                   
                    <ul id="portfolio-grid" class="thumbnails row">
                        <%
                            ArrayList <movie> allMovies=(ArrayList <movie>)request.getAttribute("allMovies");
                            for(int i=0;i<allMovies.size();i++){
                                 
                        
                        %>
                        <li class="span4 mix web">
                            <div class="thumbnail">
                                <img style="width:640px;height:400px;" src="<%=allMovies.get(i).getMovie_imgpath()%>" alt="project 1">
                                <a href="MovieController?movie_id=<%=allMovies.get(i).getMovie_movie_id()%>" >
                                    <h3><%=allMovies.get(i).getMovie_name()%></h3>
                                </a>
                                <p><%=allMovies.get(i).getMovie_description()%></p>
                                <div class="mask"></div>
                            </div>
                        </li>
                        <%}%>
                    </ul>
                </div>
            </div>
        
        <div class="footer">
            <p>&copy; 2016 All Rights Reserved</p>
        </div>
        <div class="scrollup">  
            <a href="#">
                <i class="icon-up-open"></i>
            </a>
        </div>
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
    </body>
</html>
</html>
