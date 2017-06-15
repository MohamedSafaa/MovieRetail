<%-- 
    Document   : editProfile
    Created on : Dec 11, 2016, 3:39:57 AM
    Author     : Mohamed
--%>

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
    <body style="background:#2F2F2F;">

        <%  ArrayList<String> data = (ArrayList) request.getAttribute("AccountInfo");
            String userName = String.valueOf(data.get(1));
            String userRealName = String.valueOf(data.get(2));
            String userPassword = String.valueOf(data.get(3));
            String userType = String.valueOf(data.get(4));
            String userMail = String.valueOf(data.get(5));
            String userPicture = String.valueOf(data.get(6));
            String cridetCard = String.valueOf(data.get(7));
            String userBalance = String.valueOf(data.get(8));
        %>




        <script type="text/javascript" >

            function validation(form) {

                var real_oldPassword = "<% out.print(userPassword);  %>";

                var userName = form.username.value;
                var userOldPassword = form.oldPassword.value;
                var userNewPassword = form.newPassword.value;
                var userRealName = form.realname.value;
                var userEmail = form.email.value;
                var confirmPassword = form.confirmpassword.value;
                var userCridetCard = form.creditcard.value;
                var userCridetCardAmount = form.creditcardAmount.value;


                document.getElementById("usernameError").className = "hidden";
                document.getElementById("realnameError").className = "hidden";
                document.getElementById("oldPasswordError").className = "hidden";
                document.getElementById("newPasswordError").className = "hidden";
                document.getElementById("confirmPasswordError").className = "hidden";
                document.getElementById("cridetCardError").className = "hidden";
                document.getElementById("amountError").className = "hidden";


                var checkValid = false;



                if (userOldPassword.length != 0) {

                    if (userOldPassword != real_oldPassword) {
                        alert("if");
                        document.getElementById("oldPasswordError").className = "";
                        checkValid = true;
                    } else {

                        if (userNewPassword != confirmPassword) {
                            document.getElementById("confirmPasswordError").className = "";
                            checkValid = true;
                        }
                        if (userNewPassword.length < 6) {
                            document.getElementById("newPasswordError").className = "";
                            checkValid = true;
                        }
                    }
                } else {

                    if (userNewPassword.length > 0 || confirmPassword.length > 0) {

                        document.getElementById("oldPasswordError").className = "";
                        checkValid = true;
                    }

                }



                if (userCridetCardAmount.search("[0 1 2 3 4 5 6 7 8 9]+[.][0 1 2 3 4 5 6 7 8 9]+") === 0 && userCridetCardAmount.search("[^ 0 1 2 3 4 5 6 7 8 9 .]") < 0) {
                    document.getElementById("amountError").className = "hidden";
                } else {
                    document.getElementById("amountError").className = "";
                    checkValid = true;

                }
                if (userName.length === 0) {
                    document.getElementById("usernameError").className = "";
                    checkValid = true;
                } else {
                    document.getElementById("usernameError").className = "hidden";
                }
                if (userRealName.length === 0) {
                    document.getElementById("realnameError").className = "";
                    checkValid = true;
                } else {
                    document.getElementById("usernameError").className = "hidden";
                }

                if (userCridetCard.length < 6) {
                    document.getElementById("cridetCardError").className = "";
                    checkValid = true;
                } else {
                    document.getElementById("cridetCardError").className = "hidden";
                }
                if (userEmail.length < 6 || userEmail.search(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)) {
                    document.getElementById("emailError").className = "";
                    checkValid = true;
                } else {
                    document.getElementById("emailError").className = "hidden";
                }
                if (checkValid)
                    return false;

                return true;
            }
        </script>






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
        <H1>Edit Profile</H1>
        <form action="InfoUpdateController" onsubmit="return validation(this)">
            <table style="margin-left:10px;">
                <tr class="info">
                    <td>UserName :</td> 
                    <td><input type="text"  name="username"   value ="<% out.print(userName);%>"      style="width:600px;height:40px;">   </td>
                    <td class="hidden" id="usernameError"><span>invalid userName</span></td>
                </tr>

                <tr class="info">
                    <td>User Real Name :</td> 
                    <td><input type="text"  name="realname"   value ="<% out.print(userRealName);%>"      style="width:600px;height:40px;">   </td>
                    <td class="hidden" id="realnameError"><span>invalid Name</span></td>
                </tr>
                <tr class="info">
                    <td>Email :</td> 
                    <td><input type="text" value="<% out.print(userMail);%>" name="email" style="width:600px;height:40px;"></td>
                    <td class="hidden" id="emailError"><span>invalid Email address </span></td>

                </tr>

                <tr class="info">
                    <td>OldPassword :</td>
                    <td><input type="password" name="oldPassword" style="width:600px;height:40px;"></td>
                    <td class="hidden" id="oldPasswordError"><span>invalid Password</span></td>

                </tr>
                <tr class="info">
                    <td>NewPassword : </td>
                    <td><input type="password" name="newPassword" style="width:600px;height:40px;"></td>
                    <td class="hidden" id="newPasswordError"><span>invalid Password</span></td>

                </tr>
                <tr class="info">
                    <td>ConfirmPassword : </td>
                    <td><input type="password" name="confirmpassword" style="width:600px;height:40px;"></td>
                    <td class="hidden" id="confirmPasswordError"><span>password not match</span></td>

                </tr>

                <tr class="info">
                    <td>CreditCard : </td>
                    <td><input type="text" value="<% out.print(cridetCard);%>" name="creditcard" style="width:600px;height:40px;"></td>
                    <td class="hidden" id="cridetCardError"><span>invalid Cridet Card number</span></td>

                </tr>

                <tr class="info">
                    <td>current balance in CridetCard: </td>
                    <td><input type="text" value="<% out.print(userBalance);%>" name="creditcardAmount" style="width:600px;height:40px;"></td>
                </tr>

                <tr class="info">
                    <td></td>
                    <td colspan="2"><input type="submit" value="Update" style="width:600px;height:40px;"></td>
                    <td class="hidden" id="amountError"><span>invalid Amount of money</span></td>
                </tr>
            </table>
        </form>
    </body>
</html>


