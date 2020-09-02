<%-- 
    Document   : PremiumDetails
    Created on : Mar 28, 2019, 5:21:57 PM
    Author     : Nirvan zentinal
--%>


<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.allModels"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <!--Latest compiled and minified CSS--> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!--jQuery library--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!--Popper JS--> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        <!--Latest compiled JavaScript--> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

        <link rel="stylesheet" type="text/css" href="css/now-ui-kit.css">
        <link rel="stylesheet" type="text/css" href="css/Style.css">
        <link rel="stylesheet" type="text/css" href="css/Styles2.css">
        <link rel="stylesheet" type="text/css" href="css/Switch.css">
        <link rel="stylesheet" type="text/css" href="css/split.css">

        <script src="js/Script.js"></script>

        <title>Finance manager</title>

    </head>
    <body>
        <div class="login_form clear-filter" filter-color="blue">
            <div class="content">
                <div class="col-md-4 ml-auto mr-auto">






                    <!--Left side--> 


                    <div class="split left">
                        <div class="centered">


                            <div class="middle1">
                                <div class="mTitle"  data-aos="fade-down" data-aos-duration="3000">
                                    <h1 class="fTitle" data-aos-duration="2500">Premium Details</h1>
                                </div>





                                <table data-aos="zoom-in" data-aos-duration="2500"class="table table-dark" id="table">
                                    <div class="blur"></div>
                                    <thead class="tHead">
                                        <tr>
                                            <th>Payment ID</th>
                                            <th>User ID</th>
                                            <th>User name</th>
                                            <th>Name</th>
                                            <th>User email</th>
                                            <th>Vehicle number</th>
                                            <th>Vehicle ID</th>
                                            <th>Payment ID</th>
                                            <th>Premium amount</th>
                                            <th>Paid amount</th>
                                            <th>Outstanding amount</th>


                                        </tr>
                                    </thead>

                                    <%
                                        try {
                                            model.allModels am = new model.allModels();
                                            HttpSession ses = request.getSession(true);
                                            ResultSet rs = am.displayPremiumDetails();

                                            while (rs.next()) {

                                                String paymentID = rs.getString("payment_id");
                                                String userID = rs.getString("userID");
                                                String userName = rs.getString("user_Name");
                                                String Name = rs.getString("u_firstName");
                                                String uEmail = rs.getString("u_Email");
                                                String vehicleNum = rs.getString("Vehicle_Number");
                                                String vehicleID = rs.getString("vehicle_Id");
                                                String premiumAmount = rs.getString("total");
                                                String paidAmount = rs.getString("Amount");
                                                

                                                
                                                

                                                int pre= Integer.parseInt(premiumAmount);
                                                int pa = Integer.parseInt(paidAmount);
                                                int res = pre - pa;
                                    %>

                                    <tbody>
                                        <tr class="trStyle">
                                            <td><%= paymentID%></td>
                                            <td><%= userID%></td>
                                            <td><%= userName%></td>
                                            <td><%= Name%></td>
                                            <td><%= uEmail%></td>
                                            <td><%= vehicleNum%></td>
                                            <td><%= vehicleID%></td>
                                            <td>Rs. <%= premiumAmount%></td>
                                            <td>Rs. <%= paidAmount%></td>
                                            <td>Rs. <%= res%></td>
                                            
                                        </tr>
                                    </tbody>
                                    <%
                                            }
                                        } catch (Exception d) {
                                            System.out.println("D =" + d);
                                        }
                                    %>
                                </table>

                                <script>
                                    var table = document.getElementById('table');

                                    for (var i = 1; i < table.rows.length; i++)
                                    {
                                        table.rows[i].onclick = function ()
                                        {
                                            rIndex = this.rowIndex;

                                            console.log(rIndex);
                                            document.getElementById("idname").value = this.cells[0].innerHTML;
                                            document.getElementById("userName").value = this.cells[1].innerHTML;
                                            document.getElementById("reason").value = this.cells[2].innerHTML;
                                            document.getElementById("reqDate").value = this.cells[4].innerHTML;
                                            document.getElementById("claimeddate").value = this.cells[5].innerHTML;
                                            document.getElementById("claimedAmount").value = this.cells[6].innerHTML;
                                            document.getElementById("paidAmount").value = this.cells[7].innerHTML;
                                            var sel = document.getElementById("selectBox");
                                            console.log(sel.value);
                                        };
                                    }
                                </script>
                            </div>


                        </div>
                    </div>

                    <!--Right side-->

                    <div class="split right">
                        <div class="centered " >

                            <form method="POST" action="updateClaim">
                                <div class="updateSection rContainer tHead" data-aos="fade-up" data-aos-duration="3000">
                                    <div class="blur"></div>
                                    Payment ID :<br>            
                                    <input type="text" name="paymentID" id="paymentID" readonly class="rOnly"><br> 
                                    User ID :      
                                    <input type="text" name="userID" id="userID"><br> 
                                    User name :
                                    <input type="text" name="userName" id="userName"><br> 
                                    Name : <br>
                                    <input type="text" name="name" id="name"><br> 
                                    User email : <br>
                                    <input type="text" name="userEmail" id="userEmail"><br> 
                                    Vehicle number:  
                                    <input type="text" name="vehicleNumber" id="vehicleNumber"><br> 
                                    Vehicle ID : 
                                    <input type="text" name="vehicleID" id="vehicleID"><br><br> 
                                    Premium amount : 
                                    <input type="text" name="premiumAmount" id="premiumAmount"><br><br> 
                                    Paid amount : 
                                    <input type="text" name="paidAmount" id="paidAmount"><br><br> 
                                    
                                    
                                    <div class="updateBtn">
                                        <input type="submit" name="PUpdate" id="PUpdate" value="Update"></div>
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