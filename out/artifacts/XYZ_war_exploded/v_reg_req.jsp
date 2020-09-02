<%-- 
    Document   : v_reg_req
    Created on : Mar 28, 2019, 2:23:42 PM
    Author     : ASUS
--%>

<%@page import="java.sql.ResultSet"%>
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

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

        <link rel="stylesheet" type="text/css" href="css/now-ui-kit.css">
        <link rel="stylesheet" type="text/css" href="css/Style.css">

        <script src="js/Script.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehicle Registration Requests</title>
    </head>
    <body>
        <div class="hedding" data-aos="fade-up" data-aos-duration="2500">
            <h1>XYZ DRIVER'S ASSOCIATION</h1> <br>
            <h1>Vehicle Request Handle</h1> </div>
        <div class="allmembers-form">
            <table class="table table-dark" style="margin-top: 3em;"  data-aos="fade-up" data-aos-duration="2500">
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>User Name</th>
                        <th>First Name</th>
                        <th>Last Name</th> 
                        <th>Brand</th>
                        <th>Vehicle Number</th>
                        <th>Vehicle Id</th>
                        <th>Premium</th>
                    </tr>
                </thead>
                <% models.usermodel a = new models.usermodel();
                    HttpSession ses = request.getSession(true);
                    ResultSet rs = a.display_vehicle_req();
                    while (rs.next()) {

                        String userID = rs.getString("userID");
                        String user_Name = rs.getString("user_Name");
                        String u_firstName = rs.getString("u_firstName");
                        String u_lastName = rs.getString("u_lastName");
                        String premium = rs.getString("total");
                        String vehicleID = rs.getString("VehicleId");
                        String brand = rs.getString("Brand");
                        String u_Email = rs.getString("u_Email");
                                         String vehicleNumber = rs.getString("Vehicle_Number");%>

                <tr>
                    <td><%= userID%></td>
                    <td><%=user_Name%></td>
                    <td><%=u_firstName%> </td> 
                    <td><%=u_lastName%> </td>
                    <td><%=brand%></td>
                    <td><%=vehicleNumber%> </td>
                    <td><%=vehicleID%> </td>
                    <td><%=premium%></td>
                    <td> <form action="vehicle_req_contoler" method="POST">
                            <input type="text" value="<%= userID%>" style="display: none;" name="request">
                            <input type="text" value="<%=u_firstName%>" style="display: none;" name="namerequest">
                            <input type="text" value="<%=u_Email%>" style="display: none;" name="emailrequest">
                            <input type="text" value="<%=vehicleID%>" style="display: none;" name="vehicleidrequest">
                            <input type ="submit" class="btn btn-primary  btn-lg btn-block allmembtn" value="Accept Request" name="reqbtn">
                            </td>
                            </tr> 
                        </form>





                        <%}%>
            </table>

            <center>
                <button class="backBtn" onclick="window.history.go(-1); return false;"><i class="fa fa-arrow-left"></i></button>
            </center>
        </div>

    </body>
    <script>
        AOS.init();


    </script>
</html>
