<%-- 
    Document   : vehicleRegistration
    Created on : Apr 2, 2019, 2:00:20 AM
    Author     : Primary Office
--%>

<%@page import="javax.servlet.http.HttpSession"%>

<%
    HttpServletResponse httpResponse = (HttpServletResponse) response;

    httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.addHeader("Cache-Control", "post-check=0, pre-check=0");
    httpResponse.setHeader("Pragma", "no-cache");
    httpResponse.setDateHeader("Expires", 0);

//    HttpSession se = request.getSession();
//
//    if (se.getAttribute("userID") == null) {
//        response.sendRedirect("index.jsp");
//        return;
//    }
//    String first = (String) se.getAttribute("fName");
//    String ID = (String) se.getAttribute("userID");


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
        <!-- <script src="formulacal.js"></script> -->
        <script src="js/insurence.js"></script>
        <link rel="stylesheet" href="css/cake.css">
    </head>
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
                        <a class="nav-link js-scroll-trigger" href="#services">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
                    </li>

                    <%  
    
                        HttpSession s = request.getSession();
                        if (s.getAttribute("userID") != null) {

                            String userName = (String) s.getAttribute("fName");
//                           
                            

                    %>

                    <li class="nav-item">
                        <div class="dropdown nav-link js-scroll-trigger">
                            <button class="" type="button" data-toggle="dropdown"><i class="fa fa-user-circle" style="border: none;"></i><%= userName%></button>
                            <ul class="dropdown-menu">
                                <a href="logout"><li>Logout</li></a>
                                <a href="memberDashBoard.jsp"><li>Dashboard</li></a>
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
                                <a href="login.jsp"><li>Login</li></a>
                            </ul>
                        </div>
                    </li>

                    <%    }%>

                </ul>
            </div>

        </div>
    </nav>
    <body onload='hideTotal()'>
        <button   onclick="window.location.href = '\logout'" class="myButton">logout</button>
        <div id="wrap">

            <form class="form-group" action="vehicleRegistrationContoller" method="post" id="insurenceform" >
                <div>
                    <div class="cont_details">
                        <fieldset>
                            <br>
                            <br>
                            <h3>Vehicle Details</h3>
                            
                            <br/>
                            <label for='name'>Brand</label>
                            <input type="text" id="brand" name='brand'  required=""/>
                            <br/>
                            <label for='name'>Vehicle number</label>   
                            <input type="text" id="vehicleNumber" name='vehicleNumber'  required=""/><!--
                            --><br/>
                            <label for='address'>Chassis Number</label>
                            <input type="text" id="chassis" name='chassis'  required=""/>
                            <br/>
                            <label for='phonenumber'>Engine Number</label>
                            <input type="text"  id="engine" name='engine' required=""/>
                            <br/>
                        </fieldset>
                    </div>


                    <div class="cont_order">
                        <fieldset>

                            <legend>Select your choices </legend>
                            <label >Type of Vehicle</label>
                            <label class='radiolabel'><input type="radio"  name="selectedcake" value="Motor Bike" onclick="calculateTotal()" />Motor Bike</label><br/>
                            <label class='radiolabel'><input type="radio"  name="selectedcake" value="Three wheeler" onclick="calculateTotal()" />Three whealer</label><br/>
                            <label class='radiolabel'><input type="radio"  name="selectedcake" value="Car" onclick="calculateTotal()" />Car</label><br/>
                            <label class='radiolabel'><input type="radio"  name="selectedcake" value="Van" onclick="calculateTotal()" />Van</label><br/>
                            <label class='radiolabel'><input type="radio"  name="selectedcake" value="Lorry" onclick="calculateTotal()" />Lorry</label><br/>
                            <label class='radiolabel'><input type="radio"  name="selectedcake" value="Bus" onclick="calculateTotal()" />Bus</label><br/>
                            <br/>
                            <label >Manufacture Year</label>

                            <select id="filling" name='filling' onchange="calculateTotal()">
                                <option value="None">Select Filling</option>
                                <option value="year1">1 year</option>
                                <option value="year2">2 year</option>
                                <option value="year3">3 year</option>
                                <option value="year4">4 year</option>
                                <option value="year5">5 year</option>
                                <option value="year5more">More than 5 years</option>
                                <option value="year10more">Over 10 years</option>
                            </select>
                            <br/>
                            <p>
                                <label for='includeFlood' class="inlinelabel">Include Flood cover</label>
                                <input type="checkbox" id="includeFlood" name='includeFlood' value="yes" onclick="calculateTotal()" />
                            </p>

                            <p>
                                <label class="inlinelabel" for='includeinscription'>Include passengers</label>
                                <input type="checkbox" id="includeinscription" name="includeinscription" value="yes" onclick="calculateTotal()" />

                            </p>
                            <div id="totalPrice"></div>

                        </fieldset>
                    </div>
                    <input type='hidden'  value='<%  out.print(""+s.getAttribute("userID"));%>' name="userId" />
                    <input type='hidden'  value='0' id="calcTotal" name="total" />

                    <input type='submit' id='submit' value='Submit' onclick="calculateTotal()" />
                </div>  
            </form>
        </div><!--End of wrap-->
    </body>

</html>
