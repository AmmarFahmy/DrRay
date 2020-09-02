<%-- 
    Document   : memberDashBoard
    Created on : Apr 2, 2019, 1:15:51 AM
    Author     : Primary Office
--%>

<%@page import="javax.servlet.http.HttpSession"%>
<!--making session-->
<%
     HttpServletResponse httpResponse = (HttpServletResponse) response;

    httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.addHeader("Cache-Control", "post-check=0, pre-check=0");
    httpResponse.setHeader("Pragma", "no-cache");
    httpResponse.setDateHeader("Expires", 0);

    HttpSession s = request.getSession();

    if (s.getAttribute("userID") == null) {
        response.sendRedirect("index.jsp");
        return; 
   }

    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

        <link rel="stylesheet" type="text/css" href="css/now-ui-kit.css">
        <link rel="stylesheet" type="text/css" href="css/Style.css">

        <script src="js/Script.js"></script>
    </head>

    <body>

        <button   onclick="window.location.href = '\logout'" class="myButton">logout</button>

        
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" id="mainNav">
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
                        <a class="nav-link js-scroll-trigger" href="#services">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
                    </li>
                    
                    <%
                        HttpSession se = request.getSession();
                        
                        if(se.getAttribute("userID")!=null){
                            
                            String userName = (String)se.getAttribute("fName");
                        
                    %>
                    
                        <li class="nav-item">
                            <div class="dropdown nav-link js-scroll-trigger">
                                <button class="" type="button" data-toggle="dropdown"><i class="fa fa-user-circle" style="border: none;"></i><%= userName  %></button>
                                    <ul class="dropdown-menu">
                                        <a href="logout"><li>Logout</li></a>
                                        
                                    </ul>
                            </div>
                        </li>
                    
                    <%  }  else{ 
                            String userName = "Login";
                        %>    
                        
                        <li class="nav-item">
                            <div class="dropdown nav-link js-scroll-trigger">
                                <button class="" type="button" data-toggle="dropdown"><i class="fa fa-user-circle" style="border: none;"></i><%= userName  %></button>
                                    <ul class="dropdown-menu">
                                        <a href="login.jsp"><li>Login</li></a>
                                    </ul>
                            </div>
                        </li>

                    <%    }  %>
                    
                </ul>
            </div>
            
        </div>
    </nav>
        
        <div class="hedding" data-aos="fade-up" data-aos-duration="2500">
            <br>
            <br>
            <h1>XYZ DRIVER'S ASSOCIATION</h1> <br>
            <h2>Members dashboard</h2> </div>




        <div class="button" align="center">
            <button onclick="window.location.href = 'vehicleRegistration.jsp'"class="btn btn-primary  btn-lg  " data-aos="fade-up" data-aos-duration="2500">Vehicle registration </button>
            <br>
            <!--<button onclick="window.location.href = 'payment.jsp'" type="button" class="btn btn-primary  btn-lg  " data-aos="fade-up" data-aos-duration="2500">Payments </button>-->
            
            <button type="button" class="btn btn-primary  btn-lg  " data-aos="fade-up" data-aos-duration="2500">Submit claim </button>
            <br>
            <button onclick="window.location.href = 'Details.jsp'" data-aos="fade-up" data-aos-duration="2500" type="button" class="btn btn-primary  btn-lg  " >Details </button>
            <br>

            <br>

        </div>






        <script>
            AOS.init();
        </script>
    </body>
</html>
