
<!--importing libraries -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.vehicleRegistration"%>

<!--making session-->
<%
    //poddak check karnnai demmee
    HttpServletResponse httpResponse = (HttpServletResponse) response;

    httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.addHeader("Cache-Control", "post-check=0, pre-check=0");
    httpResponse.setHeader("Pragma", "no-cache");
    httpResponse.setDateHeader("Expires", 0);

    HttpSession se = request.getSession();

    if (se.getAttribute("userID") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String first = (String) se.getAttribute("fName");
    String ID = "" + se.getAttribute("userID");

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

        <link rel="icon" href="images/logo.png">
        <title>DrRay</title>

        <script src="js/Script.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="index.jsp">
                    <i class="fa fa-car"></i><span>DrRay Sri Lanka</span>
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

                        <%                        HttpSession s = request.getSession();
                            if (s.getAttribute("userID") != null) {

                                String userName = (String) s.getAttribute("fName");

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

                        <%    }  %>

                    </ul>
                </div>

            </div>
        </nav>
        <!--table-->

        <br>
        <br>
        <br>
        <br
            >

        <table id="table" border="1"  id="table" class="table table-primary  table-striped text-light table-hover" >
            <tr>

                <td>VehicleId</td>
                <td>Brand</td>
                <td>Chassis number</td>
                <td>Engine number</td>
                <td>Type of vehicle</td>
                <td>Manufacture Year</td>
                <td>Flood Cover</td>
                <td>Passenger</td>
                <td>Total</td>
                <td>Veicle Number</td>
                <td>Status</td>
            </tr>

            <!--Array List-->
            <%                List<vehicleRegistration> regs = vehicleRegistration.getAllRegistrationById(ID);
                for (vehicleRegistration reg : regs) {
            %>
            <tr>
                <td><% out.print(reg.getVehicleId());%></td>
                <td><% out.print(reg.getBrand());%></td>
                <td><% out.print(reg.getChassisnumber());%></td>
                <td><% out.print(reg.getEngineNumber());%></td>
                <td><% out.print(reg.getTypeOfVehicle());%></td>
                <td><% out.print(reg.getManufactureYear());%></td>
                <td><% out.print(reg.getFloodCover());%></td>
                <td><% out.print(reg.getPassengerCover());%></td>
                <td><% out.print(reg.getTotal());%></td>
                <td><% out.print(reg.getVehicleNumber());%></td>

                <% if (reg.getVehicleStatus() == 1) { %>
                <!--half paid-->

                <td><form method="post" action="payment.jsp"><input type="hidden" name="vehicle_id" value="<%out.print(reg.getVehicleId());%>"/><input type="hidden" name="total" value="<%out.print(reg.getTotal());%>"/><button type="submit" >Pay</button></form></td>
                        <%} else if (reg.getTotal() != 0.) {%>
                <td><button  disabled>Pay</button></td>
                <%} else {%>
                <!--full paid-->  
                <td><button  disabled>Paid</button></td>
                <%}%>
                <!--meka check krnna ai mn iye ohma kla wada kle na ne-->
                <!--ok. thawa thiyenawada? dn balanna hri ne podk db 1 total eka blnna eke toatal eka natiwelane -->
            </tr>
            <%
                }

            %>

        </table>
    </body>
</html>
