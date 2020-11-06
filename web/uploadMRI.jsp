<%-- 
    Document   : uploadMRI
    Created on : Sep 3, 2020, 4:41:58 PM
    Author     : ammar
--%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
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

        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>


        <link rel="stylesheet" type="text/css" href="css/Style.css">

        <link rel="icon" href="images/logo.png">

        <script src="js/Script.js"></script>
        <script src="js/validation.js"></script>

        <title>DrRay</title>

    </head>
    <body>

        <div class="registatiom_form clear-filter" filter-color="blue">
            <div class="content">
                <div class="col-md-4 ml-auto mr-auto">
                    <div class="outer">
                        <div class="middle">
                            <form class="RegForm" name="uploadForm" method="POST" action="uploadImages" ng-app="regForm" enctype="multipart/form-data">
                                <div class="blur"></div>
                                <div class="card-body">

                                    <div class="input-group no-border input-lg" data-aos="zoom-in" data-aos-duration="2500">
                                        <input type="text" class="form-control" name="patient" placeholder="Enter a unique ID" required=""/>
                                    </div>

                                    <div class="input-group no-border input-lg" data-aos="zoom-in" data-aos-duration="2500">
                                        <input type="text" class="form-control" name="Cancer_Site" placeholder="Cancer Site" required=""/>
                                    </div>

                                    <div class="input-group no-border input-lg" data-aos="zoom-in" data-aos-duration="2500">
                                        <input type="text" class="form-control" name="Tumour_Type" placeholder="Tumour Type" required=""/>
                                    </div>

                                    <div class="input-group no-border input-lg" data-aos="zoom-in" data-aos-duration="2500">
                                        <input type="text" class="form-control" name="Sex" placeholder="Gender" required=""/>
                                    </div>
                                    
                                    <div class="input-group no-border input-lg" data-aos="zoom-in" data-aos-duration="2500">
                                        <input type="text" class="form-control" name="Mean" placeholder="Mean" required=""/>
                                    </div>
                                    
                                    <div class="input-group no-border input-lg" data-aos="zoom-in" data-aos-duration="2500">
                                        <input type="text" class="form-control" name="Variance" placeholder="Variance" required=""/>
                                    </div>
                                    
                                    <div class="input-group no-border input-lg" data-aos="zoom-in" data-aos-duration="2500">
                                        <input type="text" class="form-control" name="Standard_Deviation" placeholder="Standard_Deviation" required=""/>
                                    </div>
                                    
                                    <div class="input-group no-border input-lg" data-aos="zoom-in" data-aos-duration="2500">
                                        <input type="text" class="form-control" name="Entropy" placeholder="Entropy" required=""/>
                                    </div>
                                    
                                    <div class="input-group no-border input-lg" data-aos="zoom-in" data-aos-duration="2500">
                                        <input type="text" class="form-control" name="Skewness" placeholder="Skewness" required=""/>
                                    </div>
                                    
                                    <div class="input-group no-border input-lg" data-aos="zoom-in" data-aos-duration="2500">
                                        <input type="text" class="form-control" name="Contrast" placeholder="Contrast" required=""/>
                                    </div>
                                    
                                    <div class="input-group no-border input-lg" data-aos="zoom-in" data-aos-duration="2500">
                                        <input type="text" class="form-control" name="Homogeneity" placeholder="Homogeneity" required=""/>
                                    </div>
                                    
                                    <div class="input-group no-border input-lg" data-aos="zoom-in" data-aos-duration="2500">
                                        <input type="text" class="form-control" name="Dissimilarity" placeholder="Dissimilarity" required=""/>
                                    </div>
                                    
                                    <div class="input-group no-border input-lg" data-aos="zoom-in" data-aos-duration="2500">
                                        <input type="text" class="form-control" name="Correlation" placeholder="Correlation" required=""/>
                                    </div>

                                    <div data-aos="zoom-in" data-aos-duration="2500">
                                        <input type="file" class="form-control" name="file" accept="image/*" required=""/>
                                    </div>

                                </div>


                                <div class="card-footer text-center">
                                    <button class="loginBtn" data-aos="fade-up" data-aos-duration="2500">Upload</button>
                                </div>

                            </form>
                            <div data-aos="zoom-in" data-aos-duration="2500">
                                <center>
                                    <button class="backBtn" onclick="window.history.go(-1); return false;"><i class="fa fa-arrow-left"></i></button>
                                </center>
                            </div>
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
