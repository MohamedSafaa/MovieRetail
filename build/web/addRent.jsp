<%@page import ="java.text.ParseException"%>
<%@page import ="java.text.SimpleDateFormat"%>
<%@page import ="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.Account"%>
<%@page import="Model.movie"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/styleS.css" media="screen" title="no title">
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
        <title>Add Rent</title>
    </head>
    <body style="background:#2F2F2F;">
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
        <%
            String openRent = "NO";
            openRent = (String) request.getAttribute("openRent");
            if (openRent == null) {
                openRent = "message";
            }
            int movie_id = Integer.parseInt(request.getParameter("movie_id"));
            movie temp = new movie();
            movie mov = temp.getMovieDetails(movie_id);

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            String d = format.format(date);
        %>


        <div class="container">
            <form action="BalanceController">
                <table>

                    <tr>
                        <td><input type="hidden" name="movie_id" value="<%=mov.getMovie_movie_id()%>"></td>
                    </tr>
                    <tr>
                        <td><input class="rent_button" style="background: #808080" type="submit" value="Verify Balance"></td>
                    </tr>

                </table>

            </form> 

            <form class="" action="RentController" method="post">
                <table>
                    <tr>
                        <td class="headlineColor">Movie Name: </td>
                        <td><%=mov.getMovie_name()%></td>
                    </tr>
                    <tr>
                        <td class="headlineColor">Price: </td>
                        <td><%=mov.getMovie_price()%></td>
                    </tr>
                    <tr>
                        <td><input type="hidden" name="date" value="<%=d%>"></td>
                    </tr>
                    <tr>
                        <td><input type="hidden" name="movie_id" value="<%=mov.getMovie_movie_id()%>"></td>

                    </tr>
                    <tr>
                        <td class="headlineColor">Duration: </td>
                        <td><input type="text" name="duration" value="10"></td>
                        <td>Days</td>
                    </tr>
                    <%if (openRent.equals("YES")) {%>
                    <tr>
                        <td ><input class="rent_button" style="background: #808080" type="submit" value="Rent"><td>
                    </tr>
                    <%}%>

                    <%if (openRent.equals("message")) {%>
                    <tr>
                    <script>window.alert("Please verify your balance first To be able to rent this movie");</script>
                    <td ><p>Please verify your balance first To be able to rent this movie</p><td>
                        </tr>
                        <%}%>
                        <%if (openRent.equals("NO")) {%>
                    <tr>
                    <script>window.alert("your  balance not enough to rent");</script>
                    <td ><p>your  balance not enough to rent</p><td> 
                        </tr>
                        <%}%>


                </table>
            </form>

        </div>
    </body>
</html>
