<%@page import="Model.movie"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Show Movie</title>
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
    <div class="container">
        <%
            movie mov=(movie)request.getAttribute("movie");
               
        %>
      <h1><%=mov.getMovie_name()%></h1>
      <h3 class="headlineColor"><%=mov.getMovie_year()%></h3>
      <img  style="width:500px;height:500px;"  src="<%=mov.getMovie_imgpath()%>" alt="" />
      <table class="float_right">
        <tr>
          <td style="color: #CACBC4">Price:</td>
          <td><%=mov.getMovie_price()%></td>
        </tr>
        <tr>
          <td class="headlineColor">Rate:</td>
          <td><%=mov.getMovie_rate()%></td>
        </tr>
        <tr>
          <td class="headlineColor">RentCounter:</td>
          <td><%=mov.getMovie_rentcount()%></td>
        </tr>
      </table>
      <h2 class="clear headlineColor">Description</h2>
      <p><%=mov.getMovie_description()%></p>
      <br>
      <a href="addRent.jsp?movie_id=<%=mov.getMovie_movie_id()%>" class="rent_button">Rent</a>
      <a class="rent_button" href="showRent.jsp?movie_id=<%=mov.getMovie_movie_id()%>">Show Rent</a>
    </div>
  </body>
</html>
