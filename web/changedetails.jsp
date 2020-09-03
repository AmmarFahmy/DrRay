
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
        <link rel="icon" href="images/logo.png">
        <title>DrRay</title>
    </head>
    <body>

        <div class="hedding">
            <h1>DrRay Sri Lanka</h1> <br>
            <h1>Panel For Change Details </h1>
        </div>
        <%

            String id = request.getParameter("userID");

            ResultSet rs = models.usermodel.displaychanged(id);
            while (rs.next()) {
                String userID = rs.getString("userID");
                String user_Name = rs.getString("user_Name");
                String u_firstName = rs.getString("u_firstName");
                String u_lastName = rs.getString("u_lastName");
                String u_Phone = rs.getString("u_Phone");
                String u_Email = rs.getString("u_Email");
                String u_NICNum = rs.getString("u_NICNum");
                String u_SLMCNum = rs.getString("u_SLMCNum");

        %>

        <form action="changedetails" method="post">
            <div class="change-form" data-aos="fade-up">

                <div class="row">
                    <div class="col-4">
                        <h3 class="input-names">User ID </h3>
                    </div>
                    <div class="col-8">
                        <input type="text" class="form-control" placeholder="<%=userID%>" name="userid" value="<%=userID%>" readonly>
                    </div>
                </div>

                <div class="row">
                    <div class="col-4">
                        <h3 class="input-names">User Name</h3>
                    </div>
                    <div class="col-8">
                        <input type="text" class="form-control" placeholder="<%=user_Name%>" name="username" value="<%=user_Name%>" ng-minlength="{{user.userName.minlength}}" ng-maxlength="{{user.userName.maxlength}}" ng-required="{{user.userName.minlength}}"> 
                    </div>
                </div>

                <div class="row">
                    <div class="col-4">
                        <h3 class="input-names">First Name</h3>
                    </div>
                    <div class="col-8">
                        <input type="text" class="form-control" placeholder="<%=u_firstName%>" name="fname" value="<%=u_firstName%>" ng-minlength="{{user.uFname.minlength}}" ng-maxlength="{{user.uFname.maxlength}}" ng-required="{{user.uFname.required}}"> 
                    </div>
                </div>

                <div class="row">
                    <div class="col-4">
                        <h3 class="input-names">Last Name</h3>
                    </div>
                    <div class="col-8">
                        <input type="text" class="form-control" placeholder="<%=u_lastName%>" name="lname" value="<%=u_lastName%>" ng-minlength="{{user.uLname.minlength}}" ng-maxlength="{{user.uLname.maxlength}}" ng-required="{{user.uLname.required}}"> 
                    </div>
                </div>

                <div class="row">
                    <div class="col-4">
                        <h3 class="input-names">Phone Number</h3>
                    </div>
                    <div class="col-8">
                        <input type="text" class="form-control" placeholder="<%=u_Phone%>" name="phone" value="<%=u_Phone%>" ng-model="uPhoneNum" onkeypress="allowNumbersOnly(event)" maxlength="10" ng-minlength="{{user.uPhoneNum.minlength}}" ng-required="{{user.uPhoneNum.required}}"> 
                    </div>
                </div>

                <div class="row">
                    <div class="col-4"
                         ><h3 class="input-names">User Email </h3>
                    </div>
                    <div class="col-8">
                        <input type="email" class="form-control" placeholder="<%=u_Email%>" name="email" value="<%=u_Email%>" ng-model="userEmail" ng-pattern="/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/" ng-required="{{user.userEmail.required}}"> 
                    </div>
                </div>

                <div class="row">
                    <div class="col-4">
                        <h3 class="input-names">NIC Number</h3>
                    </div>
                    <div class="col-8">
                        <input type="text" class="form-control" placeholder="<%=u_NICNum%>" name="u_NICNum" value="<%=u_NICNum%>" ng-model="uNICNum" onkeypress="allowNumbersOnly(event)" maxlength="9" ng-minlength="{{user.uNICNum.minlength}}" ng-required="{{user.uNICNum.required}}"> 
                    </div>
                </div>

                <div class="row">
                    <div class="col-4">
                        <h3 class="input-names">SLMC Registration Number</h3>
                    </div>
                    <div class="col-8">
                        <input type="text" class="form-control" placeholder="<%=u_SLMCNum%>" name="u_SLMCNum" value="<%=u_SLMCNum%>" ng-model="uSLMC" onkeypress="allowNumbersOnly(event)" maxlength="5" ng-minlength="{{user.uSLMC.minlength}}" ng-required="{{user.uSLMC.required}}"> 
                    </div>
                </div>

                <input type="submit" class="btn btn-primary btn-block changebtn" style="margin-top: 2em;" value="Change Details" name="reqbtn">


            </div>

            <%}%>

        </form>

    <center>
        <button class="backBtn" onclick="window.history.go(-1); return false;"><i class="fa fa-arrow-left"></i></button>
    </center>


    <script>
        AOS.init();
    </script>


</body>
</html>
