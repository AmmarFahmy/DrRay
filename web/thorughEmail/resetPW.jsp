<%-- 
    Document   : resetPW
    Created on : Mar 27, 2019, 8:49:45 PM
    Author     : ISK
--%>

<%@page import="models.checkInputsfromDB"%>
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
        
        <link rel="stylesheet" type="text/css" href="../css/now-ui-kit.css">
        <link rel="stylesheet" type="text/css" href="../css/Style.css">
        
        <script src="../js/Script.js"></script>
        <script src="../js/validation.js"></script>
        <title>Insurance</title>
        
    </head>
    <body>
        
        <div class="login_form clear-filter" filter-color="blue">
            <div class="content">
                <div class="col-md-4 ml-auto mr-auto">
                    <div class="outer">
                        <div class="middle">
            
                        
                            <form class="" method="POST" action="../reset">
                                <div class="blur"></div>
                                <div class="card-body">
                                    
                                <div class="input-group no-border input-lg" 
                                         data-aos="zoom-in" data-aos-duration="2500">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class=" fa fa-envelope"></i>
                                        </span>
                                    </div>
                                        <input type="email" name="resetReqMail" class="form-control" placeholder="Enter your Email...">
                                </div>
                                    
                                </div>
                                <span id='message' data-aos="fade-up" data-aos-duration="2500"></span>

                                <div class="card-footer text-center" >
                                    <input type="submit" class="resetReq" id="resetReq" value="Send Email" data-aos="fade-up" data-aos-duration="2500" >
                                </div>

                            </form>
                            
                        </div>
                    </div>
                
                </div>
            </div>
        </div>
        
        <script>
            AOS.init();
            
            $('#newpw1, #newpw2').on('keyup', function () {
                
                var value1 = document.getElementById('newpw1').value;
                var value2 = document.getElementById('newpw2').value;
                    if(value1.length>4 && value2.length>4) {
                        
                        if ($('#newpw1').val() == $('#newpw2').val()) {
                            $('#message').html('Passwords are Matching').css('color', 'green');
                            $('#resetReq').removeAttr('disabled', true).css({cursor:"pointer"}); 
                        } else {
                            $('#message').html('Passwords are not Matching').css('color', 'red');
                            $('#resetReq').attr('disabled').css({cursor:"not-allowed"});  
                        }  
                    }
                    
                    else if(value1.length>4 && value2.length<5){
                        $('#message').html('Passwords are not Matching').css('color', 'red');
                        $('#resetReq').attr('disabled').css({cursor:"not-allowed"});  
                    }
                    
                    else{
                        $('#message').html('Passwords should be more than five letters').css({color:"red"});
                        $('#resetReq').attr('disabled', true).css({cursor:"not-allowed"}); 
                    }
                  
            });
         
        </script>
        
    </body>
</html>
