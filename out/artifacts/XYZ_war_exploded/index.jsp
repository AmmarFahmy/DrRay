<%-- 
    Document   : index
    Created on : Mar 29, 2019, 4:33:37 PM
    Author     : ISK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1" name="viewport" />

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css'>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

        <link rel="stylesheet" type="text/css" href="css/mainStyle.css">
        <link rel="stylesheet" type="text/css" href="css/Style.css">

        <script src="js/mainScript.js"></script>
        <script src="js/Script.js"></script>


        <title>XYZ DRIVER'S ASSOCIATION</title>
    </head>

    <body>
        <div class='thetop'></div>
        <!--header-->
        <div class="header">
            <div class="container">
                <div class="row">

                    <div class="col-6">
                        <ul class="mailphone">
                            <li style="border-right: 1px solid #DBE2FA;padding-right: 1em;"> 
                                <i class="fa fa-envelope"></i>
                                <a href="mailto:kelljared9@gmail.com">kelljared9@gmail.com</a>
                            </li>

                            <li style="margin-left: 1em;">
                                <i class="fa fa-phone"></i>
                                <span>011-1234567</span>
                            </li>
                        </ul>
                    </div>

                    <div class="col-6">
                        <ul class="headersocialIcons">
                            <li style="border-left:none;">
                                <i class="fa fa-facebook-f"></i>
                            </li>

                            <li>
                                <i class="fa fa-twitter"></i>
                            </li>

                            <li>
                                <i class="fa fa-instagram"></i>
                            </li>

                            <li>
                                <i class="fa fa-linkedin"></i>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>


        <!-- Navigation Bar -->

        <nav class="navbar navbar-expand-lg navbar-light bg-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="index.jsp">
                    <i class="fa fa-car"></i><span>XYZ DRIVER'S ASSOCIATION</span>
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" 
                        data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon" ></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#about">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" 
                               onclick="smoothScroll(document.getElementById('services'))">Services</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" 
                               onclick="smoothScroll(document.getElementById('contact_us'))">Contact</a>
                        </li>

                        <%
                            HttpSession se = request.getSession();
                            if (se.getAttribute("userID") != null) {

                                String userName = (String) se.getAttribute("fName");

                        %>

                        <li class="nav-item">
                            <div class="dropdown nav-link js-scroll-trigger">
                                <button class="" type="button" data-toggle="dropdown"><i class="fa fa-user-circle" style="border: none;"></i><%= userName%></button>
                                <ul class="dropdown-menu">
                                    <%
                                        String US = (String) se.getAttribute("US");
                                        int userS = Integer.parseInt(US);
                                        
                                        if(userS>1){
                                    %>
                                    
                                    <li>
                                   
                                 
                                    <%
                                        String uStaus = (String) se.getAttribute("userStatus");

                                        if (uStaus == "Admin" || uStaus == "ClaimAdmin") {
                                    %>
                                        <a href="mainPage.jsp"><li>&nbsp;&nbsp;&nbsp;Claim Dashboard</li></a>
                                    <%
                                        }
                                        else if (uStaus == "Admin" || uStaus == "MainAdmin") {
                                    %>
                                        <a href="admin.jsp"><li>&nbsp;&nbsp;&nbsp;Admin Dashboard</li></a>
                                    <%
                                        }else{
                                    %>
                                        <a href="memberDashBoard.jsp"><li>&nbsp;&nbsp;&nbsp;Dashboard</li></a>
                                    <%
                                        }
                                    %>
                                    </li>
                                    <hr>
                                    <% } %>
                                    
                                    <a href="logout"><li>&nbsp;&nbsp;&nbsp;Logout</li></a>

                                </ul>
                            </div>
                        </li>

                        <%  } else {
                            String userName = "Login";
                        %>    

                        <li class="nav-item">
                            <div class="dropdown nav-link js-scroll-trigger">
                                <button class="" type="button" data-toggle="dropdown"><i class="fa fa-user-circle" style="border: none;"></i><%= userName%></button>
                                <ul class="dropdown-menu">
                                    <a href="login.jsp"><li>&nbsp;&nbsp;&nbsp;Login</li></a>
                                    <hr>
                                    <a href="registration.jsp"><li>&nbsp;&nbsp;&nbsp;Register</li></a>
                                </ul>
                            </div>
                        </li>

                        <%    }%>

                    </ul>
                </div>

            </div>
        </nav>

        <!--Main Slider-->
        <div class="main_slider">

            <div class="container>" 
                 <div class="row">
                    <div class="col">

                        <!-- carousel code -->
                        <div id="carouselExampleIndicators" class="carousel slide">

                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>

                            <div class="carousel-inner skyblue">

                                <!-- first slide -->
                                <div class="carousel-item active skyblue skyblue1">
                                    <div class="carousel-caption d-md-block">
                                        <h3 data-animation="animated bounceInLeft">
                                            WE ARE THE BEST INSURANCE PROVIDER IN THE COUNTRY
                                            
                                        </h3>

                                        <h3 data-animation="animated bounceInRight">
                                            SUPPORT EACH OTHERS WITH FRIENDLY HANDS
                                        </h3>

                                        
                                    </div>
                                </div>

                                <!-- second slide -->
                                <div class="carousel-item skyblue skyblue2">
                                    <div class="carousel-caption d-md-block">
                                        <h3 class="icon-container" data-animation="animated bounceInDown">
                                            <span class="fa fa-car"></span>
                                        </h3>
                                        <h3 data-animation="animated bounceInUp">
                                            NOW YOU CAN REGISTER FREE AND ADD VEHICLES TO OUR INSURANCE 
                                            <BR>LIMITED TIME ONLY!!
                                        </h3>
                                        <button class="btn btn-primary btn-lg" 
                                                onclick="window.location.href='registration.jsp'" data-animation="animated zoomInRight">Register</button>
                                    </div>
                                </div>

                                <!-- third slide -->
                                <div class="carousel-item skyblue skyblue3">
                                    <div class="carousel-caption d-md-block">
                                        <h3 class="icon-container" data-animation="animated zoomInLeft">
                                            <span class="fa fa-car"></span>
                                        </h3>
                                        <h3 data-animation="animated flipInX">
                                            FEEL FREE TO CONTACT US !!
                                        </h3>
                                        <button class="btn btn-primary btn-lg" data-animation="animated lightSpeedIn"
                                                onclick="smoothScroll(document.getElementById('contact_us'))">Contact us</button>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>

            <div class="Services" id="services">
                <div class="container">

                    <h1 data-aos="zoom-in" data-aos-duration="2000">OUR SERVICES</h1>

                    <div class="row">

                        <div class="col-sm m-4 p-4 serviceCol" data-aos="zoom-in" data-aos-offset="300" 
                             data-aos-duration="2000" data-aos-easing="ease-in-sine">
                            <fieldset>
                                <legend><i class="fa fa-money"></i></legend>
                                <h2>Service 1</h2>
                                <p>
                                    Welcome to Allianz Sri Lanka Allianz Insurance Lanka 
                                    Limited is a fully owned subsidiary of Allianz S.E. 
                                    of Germany, the largest General Insurance Company in ...
                                </p>

                            </fieldset>
                        </div>

                        <div class="col-sm m-4 p-4 serviceCol" data-aos="flip-left" data-aos-duration="2500">

                            <fieldset>
                                <legend><i class="fa fa-car"></i></legend>
                                <h2>Service 1</h2>
                                <p>
                                    Welcome to Allianz Sri Lanka Allianz Insurance Lanka 
                                    Limited is a fully owned subsidiary of Allianz S.E. 
                                    of Germany, the largest General Insurance Company in ...
                                </p>

                            </fieldset>
                        </div>

                        <div class="col-sm m-4 p-4 serviceCol" data-aos="zoom-" data-aos-offset="300" 
                             data-aos-duration="2000" data-aos-easing="ease-in-sine">
                            <fieldset>
                                <legend><i class="fa fa-wrench"></i></legend>
                                <h2>Service 1</h2>
                                <p>
                                    Welcome to Allianz Sri Lanka Allianz Insurance Lanka 
                                    Limited is a fully owned subsidiary of Allianz S.E. 
                                    of Germany, the largest General Insurance Company in ...
                                </p>

                            </fieldset>
                        </div>

                    </div>

                </div>
            </div>


            <div class="get_our_services" data-aos="fade-up" data-aos-duration="2500">

                <div class="container">
                    <div class="row">
                        <div class="col-8">
                            <h3>Get Our Service</h3>
                            <p>Welcome to Allianz Sri Lanka Allianz Insurance Lanka 
                                Limited is a fully owned subsidiary of Allianz S.E. of Germany,
                                the largest General Insurance Company in ...
                            </p>
                        </div>

                        <div class="col-4 ">
                            <button onclick="smoothScroll(document.getElementById('contact_us'))">Contact Us</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="prices">
                <div class="container">

                    <h1 data-aos="zoom-in" data-aos-duration="2000" data-aos-delay="500">PRICES</h1>

                    <div class="row" >

                        <div class="col-sm m-4 p-4 priceceCol" data-aos="fade-up" data-aos-duration="2000" data-aos-delay="500">
                            <h5>Starter</h5>
                            <p>
                                <span class="sign">$</span><span class="value">3</span>/ per month<br>
                                Up to 5 users<br>
                                Basic support on Github<br>
                                Monthly updates<br>
                                Free cancelation
                            </p>
                        </div>

                        <div class="col-sm m-4 p-4 priceceCol" data-aos="fade-up" data-aos-duration="2000" data-aos-delay="500">
                            <h5>Professional</h5>
                            <p>
                                <span class="sign">$</span><span class="value">6</span>/ per month<br>
                                Up to 5 users<br>
                                Basic support on Github<br>
                                Monthly updates<br>
                                Free cancelation
                            </p>
                        </div>

                        <div class="col-sm m-4 p-4 priceceCol" data-aos="fade-up" data-aos-duration="2000" data-aos-delay="500">
                            <h5>Business</h5>
                            <p>
                                <span class="sign">$</span><span class="value">9</span>/ per month<br>
                                Up to 5 users<br>
                                Basic support on Github<br>
                                Monthly updates<br>
                                Free cancelation
                            </p>
                        </div>

                        <div class="col-sm m-4 p-4 priceceCol" data-aos="fade-up" data-aos-duration="2000" data-aos-delay="500">
                            <h5>Enterprise</h5>
                            <p>
                                <span class="sign">$</span><span class="value">12</span>/ per month
                                Up to 5 users
                                Basic support on Github
                                Monthly updates
                                Free cancelation
                            </p>
                        </div>

                    </div>
                </div>
            </div>

            <div class="contact_us" id="contact_us">
                <div class="container">

                    <h1 data-aos="zoom-in" data-aos-duration="2000" data-aos-delay="500">Contact Us</h1>

                    <div class="row">

                        <div class="col-sm"  data-aos="fade-up" data-aos-duration="2000" data-aos-delay="500">
                            <h5><i class="fa fa-map-marker"></i>&nbsp;&nbsp;ADDRESS</h5>
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;141, Mattakkuliya Church Rd, Colombo</p>

                            <h5><i class="fa fa-phone"></i>&nbsp;&nbsp;PHONE NUMBER</h5>
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;011-1234567</p>

                            <h5><i class="fa fa-envelope"></i>&nbsp;&nbsp;EMAIL</h5>
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kelljared9@gmail.com</p>
                        </div>

                        <div class="col-sm"  data-aos="fade-up" data-aos-duration="2000" data-aos-delay="500">
                            <form class="contact_from">
                                <input type="text" name="fullName" placeholder="Full Name">
                                <br>
                                <input type="email" name="email" placeholder="Email">
                                <br>
                                <textarea class="Umessage" placeholder="Message"></textarea>

                                <br>
                                <button type="submit" name="submit">Send</button>
                            </form>
                        </div>

                    </div>

                </div>

            </div>

            <div class='scrolltop'>
                <div class='scroll icon'>
                    <a href="#" class="scroll-btn pinkBg" target="_blank">
                        <i class="glyphicon glyphicon-play whiteText fa fa-4x fa-angle-up" aria-hidden="true"></i>
                        <span class="ripple pinkBg"></span>
                        <span class="ripple pinkBg"></span>
                        <span class="ripple pinkBg"></span>
                    </a>
                </div>
            </div>

            <div class="map_location"  data-aos="fade-up" data-aos-duration="2000" data-aos-delay="300">
                <div class="container">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.3040496541953!2d79.87564541409559!3d6.9734097197056695!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2587cd46bd389%3A0x19cdcb23a74dcc59!2sNorthshore+College+of+Business+and+Technology!5e0!3m2!1sen!2slk!4v1554007562910!5m2!1sen!2slk" 
                            width="100%" height="350" frameborder="0" style="border:0" allowfullscreen></iframe>
                </div>
            </div>

            <footer class="page-footer font-small  footer">
                <div class="footer-copyright text-center py-3">© 2018 Copyright:
                    <a href="index.jsp"> XYZ DRIVER'S ASSOCIATION</a>
                </div>
            </footer>

            <script src="js/mainSlider.js"></script>
            <script>
                                AOS.init();

<!-- Scroll to top Js -->

                                $(window).scroll(function () {
                                    if ($(this).scrollTop() > 50) {
                                        $('.scrolltop:hidden').stop(true, true).fadeIn();
                                    } else {
                                        $('.scrolltop').stop(true, true).fadeOut();
                                    }
                                });
                                $(function () {
                                    $(".scroll").click(function () {
                                        $("html,body").animate({scrollTop: $(".thetop").offset().top}, "1000");
                                        return false
                                    })
                                })

            </script>
    </body>
</html>
