<%@page import="controllers.dbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    HttpServletResponse httpResponse = (HttpServletResponse) response;

    httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.addHeader("Cache-Control", "post-check=0, pre-check=0");
    httpResponse.setHeader("Pragma", "no-cache");
    httpResponse.setDateHeader("Expires", 0);

    HttpSession se = request.getSession();
    
    String ID = String.valueOf(se.getAttribute("userID"));
    
    String uname="";
    Connection con = dbConnection.getConnection();
    Statement st = con.createStatement();
    String Sql = "select user_name from users where userID = '" + ID + "'";
    
    ResultSet rs1 = st.executeQuery(Sql);
    
    if (rs1.first()) {
        uname = rs1.getString("user_name");
    }
    
    if (se.getAttribute("userID") == null) {
        response.sendRedirect("index.jsp");
        return; 
   }


%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- jQuery library %-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Popper JS %-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript %-->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

        <link rel="stylesheet" type="text/css" href="css/now-ui-kit.css">
        <link rel="stylesheet" type="text/css" href="css/Style.css">

        <script src="js/Script.js"></script>
        <script>
            $(document).ready(function () {
                $('#paymenttable').DataTable();
                $('#claimtable').DataTable();
            });
        </script>
    </head>
    <body>

        <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
            <a class="navbar-brand js-scroll-trigger" href="index.jsp">
                <i class="fa fa-car"></i>
                <span>XYZ DRIVER'S ASSOCIATION</span>
            </a>
            <form class="form-inline" action="logout" method="post">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Log out</button>
            </form>
        </nav>
        <div class="container" style="padding-top: 50px;" >
            <h2 class="header" style="color: aquamarine">Your Claim Details</h2>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-sm-3">
                        <!--main buttons%-->
                        <button type="button" style="width: 100%;" class="btn btn-outline-success btn-block" data-toggle="modal" data-target="#claim" aria-label="Left Align" >
                            Request Claim
                        </button>
                    </div>
                    <div class="col-sm-9">
                        <table  id="claimtable" class="table table-dark table-bordered" >
                            <thead>
                                <tr>
                                    <th>#ID</th>
                                    <th>Request Date</th>
                                    <th>Reason</th>
                                    <th>Claim Amount</th>
                                    <th>Status</th>
                                    <th>Payed Amount</th>
                                    <th>Payed Date</th>
                                </tr>
                            </thead>

                            <!--get claims reports to display%-->

                            <tbody>
                                <%
                                    
                                    
                                    String S = "select * from users,claimdetails"
                                            + " where claimdetails.user_name = users.user_name and users.userID = '" + ID + "'";
                                    ResultSet rs = st.executeQuery(S);
                                    while (rs.next()) {
                                %>
                                <tr>
                                    <td>
                                        #<%out.print(rs.getString("ID"));%>
                                    </td>
                                    <td>
                                        <%out.print(rs.getString("requestDate"));%>
                                    </td>
                                    <td>
                                        <%out.print(rs.getString("reason"));%>
                                    </td>
                                    <td>
                                        <%out.print(rs.getString("claimAmount"));%>
                                    </td>
                                    <td>
                                        <%out.print(rs.getString("status"));%>
                                    </td>
                                    <td>
                                        <%out.print(rs.getString("paidAmount"));%>
                                    </td>
                                    <td>
                                        <%out.print(rs.getString("claimedDate"));%>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--End of Container%-->
        <!--Claim Modal%-->
        <div class="modal fade" id="claim" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Request A Claim</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        By submitting this request, you agree to our terms and conditions under the clause "Claims".
                        <hr>
                        <div class="row">
                            <div class="col-sm-12">
                                <br>
                                <form action="requestClaim" method="post">
                                    <div class="form-group" style="display:none">
                                        <input type="text" name="UNAME" value="<%=uname%>">
                                    </div>
                                    <div class="form-group">
                                        <label for="reason">Reason For Claim</label>
                                        <textarea class="form-control" style="color: black" autofocus="" id="reason" name="reason" rows="3" required=""></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="amount">Estimated Amount</label>
                                        <input  type="number" style="color: black" min="1"  class="form-control" id="amount" name="amount" placeholder="1.00" required="">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Request</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>   
            </div>
        </div>

    </body>
</html>
