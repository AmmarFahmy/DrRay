<%-- 
    Document   : outstanding
    Created on : Mar 22, 2019, 8:45:38 PM
    Author     : ASUS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="models.usermodel"%>
<%@page import="models.usermodel"%>
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
        <title>Outstanding Balances</title>
    </head>
    <body>
        <div class="hedding" data-aos="fade-up" data-aos-duration="2500">
            <h1>XYZ DRIVER'S ASSOCIATION</h1> <br>
            <h1>Outstanding</h1>
        </div>
        <div class="allmembers-form">
            <table class="table table-dark" style="margin-top: 3em;"  data-aos="fade-up" data-aos-duration="2500">
                <tr>
                    <th>User Id</th>
                    <th>User Name</th>
                    <th>Name</th>
                    <th>User Email</th>
                    <th>Vehicle Number</th>
                    <th>Payment ID</th>
                    <th>Premium</th>
                    <th>Paid Value</th>
                    <th>Vehicle ID</th>
                    <th>Outstanding Value</th>
                </tr>
                <%  ResultSet rs = models.usermodel.outstanding();
                    while (rs.next()) {

                        String pvalue = rs.getString("paid");

                        String userID = rs.getString("userID");
                        String user_Name = rs.getString("user_Name");
                        String u_firstName = rs.getString("u_firstName");
                        String u_Email = rs.getString("u_Email");
                        String vehicleid = rs.getString("vehicle_Id");
                        String paymentid = rs.getString("payment_id");
                        String paidvalue = rs.getString("Amount");

                        String vehiclnum = rs.getString("Vehicle_Number");
                        String premium = rs.getString("total");
                        double outval = Double.parseDouble(premium) - Double.parseDouble(paidvalue);
                        //String uotstanding=

                     if (outval != 0) {
                %>

                <tr>
                    <td><%= userID%></td>
                    <td><%=user_Name%></td>
                    <td><%=u_firstName%> </td>
                    <td><%=u_Email%> </td>
                    <td><%=vehiclnum%></td>
                    <td><%=paymentid%></td>
                    <td><%=premium%></td>
                    <td><%=paidvalue%></td>
                    <td><%=vehicleid%></td>
                    <td><%=outval%></td>
                    <td> <form action="outstandingcontroller" method="POST">
                            <input type="text" value="<%= userID%>" style="display: none;" name="request">
                            <input type="text" value="<%=u_firstName%>" style="display: none;" name="namerequest">
                            <input type="text" value="<%=u_Email%>" style="display: none;" name="emailrequest">
                            <input type="text" value="<%=vehiclnum%>" style="display: none;" name="vehicleidrequest">
                            <input type ="submit" class="btn btn-primary  btn-lg btn-block allmembtn" value="Inform Custormer" name="reqbtn">
                        </form>
                    </td>
                </tr> 
                
                <%  }
                    }
                %>        
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
