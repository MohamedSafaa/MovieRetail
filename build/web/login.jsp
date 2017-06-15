<%-- 
    Document   : login
    Created on : Dec 11, 2016, 4:08:06 AM
    Author     : Mohamed
--%>

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
            .info{
                font-family:Times New Roman; 
                font-size: 25px ;
                color: white ;
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

    </head>
    <body style="background:#2F2F2F">
             
         <%   
            Cookie[] cookies ;
            cookies = request.getCookies() ;
            if (cookies!=null){
            for( Cookie cookie : cookies)// el cookie btegy m3 el request m4 btro7 ll server 4ayla el max age bta3ha bt7tfez beh 3le el client w 34an kda lma b3'yro 3la el server b3mel addCookie tany
                // 7ata law 2falt el tab bta3 el app da talma fate7 el browser fa el session btfdal 7aya fa hagy afta7 el app hy2ra el cookie 3la tool 3ady
                if(cookie.getName().equals("user") == true){
                    session.setAttribute("user",cookie.getValue());
                    System.out.println("fe ellogin page l2a el cookie : " +cookie.getValue());
                    response.sendRedirect("Controller");
                }
            }
            %>
           
        
    <center>
        <br><br><br><br>
        <img src="images/logo1.jpg" alt="logo">
        <h1>Welcome to ASM Movies</h1>
        <br><br>
        
        
        
        <form action="loginController" method="post">

            <table>
                <tr class="info">
                    <td>UserName :</td> 
                    <td><input type="text" name="username" style="width:600px;height:40px;"></td>
                </tr>
                <tr class="info">
                    <td>Password :</td> 
                    <td><input type="password" name="password" style="width:600px;height:40px;"></td>
                </tr>
                <tr class="info">
                    <td> </td>
                    <td style="text-align: center;"><input type="submit" value="log in" style="width:25%;height:30px;"></td>
                </tr>
            </table>
        </form>
        <br>
        <form action="signUp.jsp">
            <table>
                <tr style="font-family:Times New Roman;font-size: 20px ;color: black;text-align: center;">
                    <td> </td>
                    <td style="color:whitesmoke;">Are you not registered ?</td>
                </tr>
                <tr>
                    <td> </td>
                    <td><input type="submit" value="Sign up" style="width:600px;height:35px;"></td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
