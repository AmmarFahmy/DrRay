<%-- 
    Document   : admin page
    Created on : Mar 4, 2019, 8:15:02 PM
    Author     : Randika
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="models.usermodel" %>

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

        <title>Admin</title>

    </head>
    <body>
        <div class="hedding" data-aos="fade-up" data-aos-duration="2500">
            <h1>XYZ DRIVER'S ASSOCIATION</h1> <br>
            <h1>All Members Panel</h1> </div>
        <div class="allmembers-form">
            <table class="table table-dark" style="margin-top: 3em;"  data-aos="fade-up" data-aos-duration="2500">
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>User Name</th>
                        <th>First Name</th>
                        <th>Last Name</th> 
                        <th>Status</th> 
                        <th>Change Status</th>
                        <th></th>
                    </tr>
                </thead>
                <% models.usermodel a = new models.usermodel();
                    HttpSession ses = request.getSession(true);
                    ResultSet rs = a.allmemberdisplay();
                    String status;
                    while (rs.next()) {

                        String userID = rs.getString("userID");
                        String user_Name = rs.getString("user_Name");
                        String u_firstName = rs.getString("u_firstName");
                        String u_lastName = rs.getString("u_lastName");
                        int u_status = rs.getInt("u_status");

                        if (u_status == 0) {
                            status = "Deactivated";
                        }else if (u_status == 8) {
                            status = "Claim Admin";
                        } else if (u_status == 9) {
                            status = "Admin";
                        } else if (u_status == 10) {
                            status = "Main Admin";
                        } else {
                            status = "User";
                        }
                %>
                <tr>
                    <td><%= userID%></td>
                    <td><%=user_Name%></td>
                    <td><%=u_firstName%> </td> 
                    <td><%=u_lastName%> </td> 
                    <td><%=status%> </td> 

                    <td>
                        <form action="addRemoveAdmin" method="POST">
                            <input type="text" name="uid" style="display: none;" value="<%= userID%>">

                            <select class="changeAdmin" name="changeAdmin">
                                <%if (u_status != 10) {%>
                                <option value="0">Deactivate</option>
                                <option value="2">User</option>
                                <option value="8">Claim Admin</option>
                                <option value="9">Admin</option>
                                <%} else {%>   
                                <option value="10">Main Admin</option>
                                <%}%>    
                            </select>
                    </td>
                    <td>
                        <input type ="submit" class="btn btn-primary  btn-lg btn-block allmembtn" name="changeBtn" value="Change">
                        </form>
                    </td>
                </tr>

                <%}%>
            </table>
            
            <center>
                <button class="backBtn" onclick="window.history.go(-1); return false;"><i class="fa fa-arrow-left"></i></button>
            </center>
        </div>

        <script>
            AOS.init();


        </script>
    </body>
</html>