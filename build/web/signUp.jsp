<%-- 
    Document   : signUp
    Created on : Dec 11, 2016, 4:31:30 AM
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
                color: whitesmoke ;
            }
            .hidden{
                display: none;
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

        
        <script type="text/javascript" > 
        
        function validation(form){
           
            var userName = form.username.value;
            var userPassword = form.password.value;
            var userEmail =  form.email.value;
            var  confirmPassword =form.confirmpassword.value;
            var userCridetCard = form.creditcard.value;
            var userCridetCardAmount = form.amount.value;
            var userRealName = form.realname.value;
            
            var checkValid = false ;
            
            if(userPassword.length < 6){
                 document.getElementById("passwordError").className = "";
                 checkValid = true ;
            }else{
                 document.getElementById("passwordError").className = "hidden";
            }
            
            if(confirmPassword !== userPassword || confirmPassword.length === 0){
                document.getElementById("confirmPasswordError").className = "";
                
                checkValid = true ;
            }else{
                 document.getElementById("confirmPasswordError").className = "hidden";
            }
           
            if(userCridetCardAmount.search("[^0-9]") >= 0){
                document.getElementById("amountError").className = "";
                checkValid = true ;
            }else{
                 document.getElementById("amountError").className = "hidden";
            }
            if(userName.length === 0){
                document.getElementById("usernameError").className = "";
                checkValid = true ;
            }else{
                 document.getElementById("usernameError").className = "hidden";
            }
             if(userRealName.length === 0){
                document.getElementById("realnameError").className = "";
                checkValid = true ;
            }else{
                 document.getElementById("usernameError").className = "hidden";
            }
            
            if( userCridetCard.length < 6){
                document.getElementById("cridetCardError").className = "";
                checkValid = true ;
            }else{
                 document.getElementById("cridetCardError").className = "hidden";
            }
            if( userEmail.length < 6  || userEmail.search(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)){
                document.getElementById("emailError").className = "";
                checkValid = true ;
            }else{
                 document.getElementById("emailError").className = "hidden";
            }
            if(checkValid)
             return false;
   
            return true;
        }
        </script>
        
        
    </head>
   <body style="background:#2F2F2F">
        
        <br><br><br><br>
    <center>
        <img src="images/logo1.jpg" alt="logo">
        <h1>Welcome to Sign up page</h1>
        <form action="signUpController" name="signUpform" onsubmit="return validation(this)">
            <table>
                <tr class="info">
                    <td>Username :</td> 
                    <td><input type="text" name="username" style="width:400px;height:40px;"></td>
                    <td class="hidden" id="usernameError"><span>invalid userName</span></td>
                </tr>
                
                 <tr class="info">
                    <td>Name :</td> 
                    <td><input type="text" name="realname" style="width:400px;height:40px;"></td>
                    <td class="hidden" id="realnameError"><span>invalid Name</span></td>
                </tr>

                
                
                <tr class="info">
                    <td>Email :</td> 
                    <td><input type="text" name="email" style="width:400px;height:40px;"></td>
                    <td class="hidden" id="emailError"><span>invalid Email address </span></td>
                </tr>
                
                
                <tr class="info">
                    <td>Password : </td>
                    <td><input type="password" name="password" style="width:400px;height:40px;"></td>
                    <td class="hidden" id="passwordError"><span>invalid Password</span></td>
                </tr>
                <tr class="info">
                    <td>ConfirmPassword : </td>
                    <td><input type="password" name="confirmpassword" style="width:400px;height:40px;"></td>
                    <td class="hidden" id="confirmPasswordError"><span>password not match</span></td>
                </tr>
                
                <tr class="info">
                    <td>CreditCard : </td>
                    <td><input type="text" name="creditcard" style="width:400px;height:40px;"></td>
                    <td class="hidden" id="cridetCardError"><span>invalid Cridet Card number</span></td>
                </tr>
                
                
                <tr class="info">
                    <td>CreditCard Amount: </td>
                    <td><input type="text" name="amount" style="width:400px;height:40px;"></td>
                    <td class="hidden" id="amountError"><span>invalid Amount of money</span></td>
                </tr>
                
                
                
                <tr class="info">
                    <td> </td>
                    <td><input type="submit" value="sign up" style="width:400px;height:40px;"></td>
                    <td class="hidden" id="passwordError"><span>invalid Password</span></td>
                </tr>
                
               
            </table>
            
            
            
        </form>
        </center>
    </body>
</html>
