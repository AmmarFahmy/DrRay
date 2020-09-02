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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css">

        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

        <link rel="stylesheet" type="text/css" href="css/now-ui-kit.css">
        <link rel="stylesheet" type="text/css" href="css/Style.css">
        <link rel="stylesheet" type="text/css" href="css/Styles2.css">
        <link rel="stylesheet" type="text/css" href="css/Switch.css">
        <link rel="stylesheet" type="text/css" href="css/split.css">
        <script src="JS/MyScript.js"></script>
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
                                    <h1 class="fTitle" data-aos-duration="2500">Claim Details</h1>
                                </div>





                                <table data-aos="zoom-in" data-aos-duration="2500"class="table table-dark" id="table">
                                    <div class="blur"></div>
                                    <thead class="tHead">
                                        <tr>
                                            <th>ID</th>
                                            <th>User name</th>
                                            <th>Reason</th>
                                            <th>Status</th>
                                            <th>Request date</th>
                                            <th>Claim date</th>
                                            <th>Claim amount</th>
                                            <th>Paid amount</th>
                                            <th>Outstanding amount</th>
                                        </tr>
                                    </thead>

                                    <%
                                        try {
                                            model.allModels am = new model.allModels();
                                            HttpSession ses = request.getSession(true);
                                            ResultSet rs = am.displayClaimDetails();

                                            while (rs.next()) {

                                                String userID = rs.getString("userID");
                                                String userName = rs.getString("user_name");
                                                String Reason = rs.getString("reason");
                                                String status = rs.getString("status");
                                                String reqDate = rs.getString("requestDate");
                                                String claimedDate = rs.getString("claimedDate");
                                                String claimAmmount = rs.getString("claimAmount");
                                                String paidAmount = rs.getString("paidAmount");

                                                int c = Integer.parseInt(claimAmmount);
                                                int p = Integer.parseInt(paidAmount);
                                                int res = c - p;
                                    %>

                                    <tbody>
                                        <tr class="trStyle">
                                            <td><%= userID%></td>
                                            <td><%= userName%></td>
                                            <td><%= Reason%></td>
                                            <td><%= status%></td>
                                            <td><%= reqDate%></td>
                                            <td><%= claimedDate%></td>
                                            <td><%= claimAmmount%></td>
                                            <td><%= paidAmount%></td>
                                            <td><%=res%></td>
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
                                    ID :<br>            
                                    <input type="text" name="idname" id="idname" readonly class="rOnly"><br> 
                                    User name :      
                                    <input type="text" name="userName" id="userName"><br> 
                                    Reason :
                                    <textarea rows="2" cols="20" wrap="hard" name="reason" id="reason" class="wrap">
                                    </textarea> 
                                    Status :  <br>
                                    <select class="selectBox" name="statusBox">
                                        <option value="Pending"id="rej" selected="selected">Select...</option>
                                        <option value="Accept" id="acc">Accept</option>
                                        <option value="Pending">Pending</option>
                                        <option value="Reject"id="rej">Reject</option>
                                    </select><br>
                                    Request date : <br>
                                    <input type="date" name="reqDate" id="reqDate"><br> 
                                    Claimed date : <br>
                                    <input type="date" name="claimeddate" id="claimeddate"><br> 
                                    Claimed amount :  
                                    (Rs.)<input type="tetx" name="claimeAmount" id="claimedAmount"><br> 
                                    Paid amount : 
                                    (Rs.)<input type="tetx" name="paidAmount" id="paidAmount"><br><br> 
                                    <div class="updateBtn">
                                        <input type="submit" name="CUpdate" id="CUpdate" value="Update"></div>
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