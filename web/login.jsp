<%--
    Author     : ammar
--%>

<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
     
        <link rel="stylesheet" type="text/css" href="css/Style.css">
        
        <script src="js/Script.js"></script>
        
        <link rel="icon" href="images/logo.png">
        
        <title>Insurance</title>
        
    </head>
    <body>
        
        <div class="login_form clear-filter" filter-color="blue">
            <div class="content">
                <div class="col-md-4 ml-auto mr-auto">
                    <div class="outer">
                        <div class="middle">
                            
                            <form class="" method="POST" action="login">
                                <div class="blur"></div>
                                <div class="card-body">
                                    
                                    <div class="input-group no-border input-lg" 
                                         data-aos="zoom-in" data-aos-duration="2500">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class=" fa fa-user-circle"></i>
                                            </span>
                                        </div>
                                        <input type="text" name="uname" class="form-control" placeholder="User Name or Email...">
                                    </div>

                                    <div class="input-group no-border input-lg" 
                                         data-aos="zoom-in" data-aos-duration="2500">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class=" fa fa-key"></i>
                                            </span>
                                            <span class="show_hide" onclick="showhide()"><i class=" fa fa-eye"></i></span>  
                                        </div>
                                        <input type="password" id="userPassword" name="pw" placeholder="Password..." class="form-control" />
                                      
                                    </div>
                                </div>


                                <div class="card-footer text-center" >
                                    <input type="submit" class="loginBtn" value="Login" data-aos="fade-up" data-aos-duration="2500">
                                    
                                    <div class="reg_form" data-aos="fade-up" data-aos-duration="3000">
                                        <h6>
                                            <a href="registration.jsp" class="link">Create Account</a>
                                        </h6>
                                        
                                        <h6>
                                            <a style="color:greenyellow" href="thorughEmail/resetPW.jsp" class="link">Forgot your password?</a>
                                        </h6>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                
                </div>
            </div>
        </div>
        
        <script>
            AOS.init();
        </script>
        
    </body>
</html>
