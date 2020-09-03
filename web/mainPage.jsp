

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <!--        Online
                 Latest compiled and minified CSS 
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
                 jQuery library 
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                 Popper JS 
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
                 Latest compiled JavaScript 
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
                <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
                Online-->

        <!--Offline-->
        <link rel="stylesheet" href="Styles/bootstrap.min.css">
        <link rel="stylesheet" href="Styles/bootstrap.min.css">
        <script src="Styles/jquery.min.js"></script>
        <script src="Styles/popper.min.js"></script>
        <script src="Styles/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styles/font-awesome.min.css">
        <link rel="stylesheet" href="Styles/aos.css">
        <script src="Styles/aos.js"></script>
        <!--Offline-->

        <link rel="stylesheet" type="text/css" href="css/now-ui-kit.css">
        <link rel="stylesheet" type="text/css" href="css/Style.css">
        <link rel="stylesheet" type="text/css" href="css/split.css">

        <script src="js/Script.js"></script>



        <link rel="icon" href="images/logo.png">
        <title>DrRay</title>

    </head>
    <body>

        <div class="login_form clear-filter" filter-color="blue">
            <div class="content">
                <div class="col-md-4 ml-auto mr-auto">
                    <div class="outer">

                        <div class="middle">
                            <div class="mTitle"  data-aos="fade-down" data-aos-duration="3500">
                                
                            </div>
                            <form class="form" method="action=">
                                <div class="blur"></div>
                                <div class="card-footer text-center" >
                                    <a href="premiumDetails.jsp" class="btn btn-primary  btn-lg btn-block loginBtn" data-aos="zoom-in" data-aos-duration="3500">Premium details</a>
                                    <div class="reg_form" data-aos="fade-up" data-aos-duration="3500">
                                    </div>
                                </div>
                                <div class="card-footer text-center" >
                                    <a href="claimDetails.jsp" class="btn btn-primary  btn-lg btn-block loginBtn" data-aos="zoom-in" data-aos-duration="3500">Claim details</a>
                                    <div class="reg_form" data-aos="fade-up" data-aos-duration="3500">
                                    </div>
                                </div>
                            </form>


                            <!--Report section-->
                            <%
                                try {
                                    Connection connection = DBConnection.connectionClass.getConnection();
                                    Statement statement = connection.createStatement();
                                    String sql = "select SUM(premiumAmmount+paidAmmount) AS xyz from premiumdetails";
//                                        String sql = "select * from premiumdetails";
                                    ResultSet resultSet = statement.executeQuery(sql);
                            %>
                            <div class="container reportSection">
                                <div class="blur"></div>
                                <h2 class="mTitle">Report</h2>
                                <div class="panel panel-default">
                                    <div class="panel-body mTitle   ">
                                        Total outstanding :<%=resultSet.getString("xyz")%>
                                    </div>
                                </div>
                            </div>
                            <%

                                    connection.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                            <!--Report section-->
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
