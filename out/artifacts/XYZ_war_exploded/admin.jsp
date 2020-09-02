<%-- 
    Document   : admin page
    Created on : Mar 4, 2019, 8:15:02 PM
    Author     : Randika
--%>

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


        <link rel="stylesheet" type="text/css" href="css/Style.css">

        <script src="js/Script.js"></script>

        <title>Admin</title>

    </head>
    <body>
        <%
            HttpSession se = request.getSession();
            
            
            if (se.getAttribute("userID") == null) {
                response.sendRedirect("index.jsp?loginerror=failed");
            }
            

        %>
        
        <div class="hedding" data-aos="fade-up" data-aos-duration="2500">
            <h1>XYZ DRIVER'S ASSOCIATION</h1> <br>
            <h1>Admin Panel</h1> </div>

        <div class="button" align="center">
            <form action="adminservlet" method="post">
                <input type="submit" class="btn btn-lg changebtn" data-aos="fade-up" data-aos-duration="2500"  value="All Members" name="action">
                <br>
                <input type="submit" class="btn btn-lg changebtn" data-aos="fade-up" data-aos-duration="2500"  value="Outstanding Balances" name="action">
                <br>
                <input type="submit" class="btn btn-lg changebtn" data-aos="fade-up" data-aos-duration="2500"  value="User Profile Requests" name="action">
                <br>
                <input type="submit" class="btn btn-lg changebtn" data-aos="fade-up" data-aos-duration="2500"  value="Vehical Registration Request" name="action">
                <br>
                
                <% 
                    
                    String uStaus = (String) se.getAttribute("userStatus");
                    
                    if(uStaus == "MainAdmin"){ 
                %>
                
                <input type="submit" class="btn btn-lg changebtn" data-aos="fade-up" data-aos-duration="2500"  value="Add/Remove Admin" name="action">
                <br>
                
                <%
                    }
                %>    

            </form> 
        </div>






        <script>
            AOS.init();
        </script>
    </body>
</html>
