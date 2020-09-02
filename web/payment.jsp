<%-- 
    Document   : Member
    Created on : Mar 18, 2019, 12:06:04 PM
    Author     : Pasindu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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

    // String first = (String)se.getAttribute("fName");
//     String ID = ""+se.getAttribute("userID");
    //
    String total = request.getParameter("total");
    String vehicle_id = request.getParameter("vehicle_id");
    out.print("<font color=red size=6>");
    // out.print(ID);
    out.print("</br>");
//                out.print(first);
    out.print("Your Total is " + total);//To display parsed total

    out.print("</font>");

%>
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

        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>


        <link rel="stylesheet" type="text/css" href="css/now-ui-kit.css">
        <link rel="stylesheet" type="text/css" href="css/Style.css">
        <script src="js/validation.js"></script>
        <title>JSP Page</title>

        <style>
            .form-control:focus {
                border: 1px solid #f96332;
                -webkit-box-shadow: none;
                box-shadow: none;
                outline: 0 !important;
                color: #000;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <!--<button   onclick="window.location.href = '\logout'" class="myButton">logout</button>-->


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
        <!--      //session -->
        <% //
//                    Members member = (Members)session.getAttribute("Member");
//                    session.setAttribute("Member", member);
//                    if(member == null)
//                    {
//                        out.print("<h2> Please Signin first</h2>");
//                    }else{
//                        
        %><!--end of the session-->




        <!--form-->
        <% //out.print(ID);%>
        <div class="hedding" data-aos="fade-up" data-aos-duration="2500">
            <div class="container" style="padding-top: 30px">



                <form class="col-6 offset-3" id="myForm" name="PaymentForm" action="paymentController" method="post" >
                    <input type="hidden" name="mem_id" value="<% // out.print(member.getId());%>">
                    <h3>Payment Gateway</h3>
                    <hr>


                    <div class="form-group">
                        <label for="fname">Name on card</label>
                        <input type="text" name="cardname" class="form-control" id="cardname" 
                               required onkeypress="return (event.charCode > 64 &&
                                               event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)"
                               placeholder=" Name..." >
                    </div>




                    <div class="form-group">


                        <label for="fname">Amount</label>
                        <input type="number" min='0' max='<%out.print(total); %>' name="amount" class="form-control" id="amount"  required
                               placeholder=" Amount" onkeypress='validate(event)'>
                    </div>






                    <div class="form-group">
                        <label for="upassword">Card Number</label>
                        <input type="text" name="cardno" class="form-control" id="cardno"  required
                               placeholder="card number"   onkeypress='validate(event)'>
                    </div>

                    <div class="form-group">
                        <label for="upassword">CSV</label>
                        <input type="text" name="csv" class="form-control" id="csv"  required
                               placeholder="csv"   maxlength="3" minlength="3" onkeypress='validate(event)'>
                    </div>

                    <div class="form-group">
                        <label for="upassword">Date of Expire</label>
                        <input type="date" name="doe" class="form-control" id="doe"  required>
                    </div>

                    <br>         
                    <!--This pass the total value to makepaymentcontroller to check is paid or not-->
                    <input type="hidden" name="total"  value='<% out.print(total); %>'>
                    <input type="hidden" name="vehicle_id"  value='<% out.print(vehicle_id); %>'>


                    <button type="submit" id="submit-btn" class="btn btn-primary float-right" onclick="">Pay Now</button>
                    <div class="clearfix"></div>
                    <input type="text" value="<%out.print(""+s.getAttribute("userID"));%>" style="display:none;" name="getuid">
                    <button onclick="window.location.href = 'memberDashboard.jsp'" type="button" class="btn btn-primary  btn-lg  " >Back </button>

                </form>
                <hr>
            </div>
        </div>

        <script>
            AOS.init();
        </script>
    </body>
</html>
