<%@page import="Model.Rent"%>
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
    <title>Show Rent</title>
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
            int movie_id=Integer.parseInt(request.getParameter("movie_id"));
            movie temp=new movie();
            movie mov=temp.getMovieDetails(movie_id);
            
            Rent tempRent=new Rent();
            String id = (String)session.getAttribute("user");
            int userid = Integer.parseInt(id);
            Rent rent=tempRent.findRent(movie_id,userid);
            Rent renttemp=new Rent();
            boolean openMessage=false;
              if(rent==null){
                  rent=renttemp;
                  openMessage=true;
              }    
      %>
      <%if(openMessage){%>
      <script>
          window.alert("you don't have any rents for this movie");
      </script>      <%}%>
    <div class="container rent_list">
        <img  style="width:600px;height:600px;"  class="float_left" src="<%=mov.getMovie_imgpath()%>" alt="" />
        <form action="ExtendRentController">  
      <table class="float_right">
        <tr>
          <td class="headlineColor">Movie Name: </td>
          <td><%=mov.getMovie_name()%></td>
        </tr>
        <tr>
          <td class="headlineColor">Price: </td>
          <td><%=mov.getMovie_price()%></td>
        </tr>
        <tr>
          <td class="headlineColor">Starting Date: </td>
          <td><%=rent.getRent_startdate()%></td>
        </tr>
        <tr>
          <td class="headlineColor">Duration: </td>
          <td><%=rent.getRent_dauration()%></td>
        </tr>
        <tr><td><br><br></td></tr>
        <tr>
            <td>Extend: </td>
            <td><input type="text" name="duration"></td>
            <td>Days<td>
        </tr>
        <tr>
            <td><input style="background: #808080; color: #ffffff; padding: 10px 25px;" type="submit" value="Extend" ></td>
        </tr>
        
        <tr>
            <td><input type="hidden" name="movie_id" value="<%=mov.getMovie_movie_id()%>"></td>
        </tr>
      </table>
        </form>
        <div class="rent_button float_right" style="margin-right:100px"><a href="ReturnMovieController?movie_id=<%=mov.getMovie_movie_id()%> ">Return</a></div>
        
    </div>
        
  </body>
</html>
