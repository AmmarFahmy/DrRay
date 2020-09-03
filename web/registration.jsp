

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
                            <h3 align="center">Registration Form</h3>
                            <form class="RegForm" name="RegForm" method="POST" action="register" ng-app="regForm" ng-controller="regFormC" >
                                <div class="blur"></div>
                                <div class="card-body">

                                    <div class="input-group no-border input-lg" 
                                         data-aos="zoom-in" data-aos-duration="2500">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class=" fa fa-user-circle"></i>
                                            </span>
                                        </div>

                                        <input type="text" class="form-control" name="uFname" id="uFname"
                                               placeholder="First Name..." ng-model="uFname"
                                               ng-minlength="{{user.uFname.minlength}}" 
                                               ng-maxlength="{{user.uFname.maxlength}}" 
                                               ng-required="{{user.uFname.required}}" />
                                    </div>

                                    <div class="error_message">
                                        <span ng-show="RegForm.uFname.$dirty && RegForm.uFname.$error.required">First Name is required!</span>
                                        <span ng-show="RegForm.uFname.$error.minlength">First Name is too short!</span>
                                        <span ng-show="RegForm.uFname.$error.maxlength">First Name is too long!</span>
                                    </div>

                                    <div class="input-group no-border input-lg" 
                                         data-aos="zoom-in" data-aos-duration="2500">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class=" fa fa-user-circle"></i>
                                            </span>
                                        </div>

                                        <input type="text" class="form-control" name="uLname" id="uLname"
                                               placeholder="Last Name..." ng-model="uLname"
                                               ng-minlength="{{user.uLname.minlength}}" 
                                               ng-maxlength="{{user.uLname.maxlength}}" 
                                               ng-required="{{user.uLname.required}}" />
                                    </div>

                                    <div class="error_message">
                                        <span ng-show="RegForm.uLname.$dirty && RegForm.uLname.$error.required">Last Name is required!</span>
                                        <span ng-show="RegForm.uLname.$error.minlength">Last Name is too short!</span>
                                        <span ng-show="RegForm.uLname.$error.maxlength">Last Name is too long!</span>
                                    </div>



                                    <div class="input-group no-border input-lg" 
                                         data-aos="zoom-in" data-aos-duration="2500">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class=" fa fa-envelope"></i>
                                            </span>
                                        </div>
                                        <input type="email" name="userEmail" id="userEmail" 
                                               placeholder="Email..." class="form-control" 
                                               ng-model="userEmail"
                                               ng-pattern="/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/"
                                               ng-required="{{user.userEmail.required}}" />

                                    </div>

                                    <div class="error_message">
                                        <span ng-show="RegForm.userEmail.$dirty && RegForm.userEmail.$error.required">Email is required!</span>
                                        <span ng-show="RegForm.userEmail.$error.pattern">Please enter a valid Email!</span>
                                    </div>



                                    <div class="input-group no-border input-lg" 
                                         data-aos="zoom-in" data-aos-duration="2500">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class=" fa fa-user-circle"></i>
                                            </span>
                                        </div>
                                        <input type="text" name="uNICNum" class="form-control" placeholder="NIC number..." 
                                               ng-model="uNICNum"
                                               onkeypress="allowNumbersOnly(event)" maxlength="9"
                                               ng-minlength="{{user.uNICNum.minlength}}" 
                                               ng-required="{{user.uNICNum.required}}" />
                                    </div>

                                    <div class="error_message">
                                        <span ng-show="RegForm.uNICNum.$dirty && RegForm.uNICNum.$error.required">NIC number is required!</span>
                                        <span ng-show="RegForm.uNICNum.$error.minlength">NIC number should contain 9 numbers!</span>
                                    </div>  



                                    <div class="input-group no-border input-lg" 
                                         data-aos="zoom-in" data-aos-duration="2500">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class=" fa fa-user-circle"></i>
                                            </span>
                                        </div>
                                        <input type="text" name="uSLMC" class="form-control" placeholder="SLMC Registration number..." 
                                               ng-model="uSLMC"
                                               onkeypress="allowNumbersOnly(event)" maxlength="5"
                                               ng-minlength="{{user.uSLMC.minlength}}" 
                                               ng-required="{{user.uSLMC.required}}" />
                                    </div>

                                    <div class="error_message">
                                        <span ng-show="RegForm.uSLMC.$dirty && RegForm.uSLMC.$error.required">SLMC Registration number is required!</span>
                                        <span ng-show="RegForm.uSLMC.$error.minlength">The registration number should contain 5 digits !</span>
                                    </div>



                                    <div class="input-group no-border input-lg" 
                                         data-aos="zoom-in" data-aos-duration="2500">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class=" fa fa-phone"></i>
                                            </span>
                                        </div>
                                        <input type="text" name="uPhoneNum" class="form-control" placeholder="Phone number..." 
                                               ng-model="uPhoneNum"
                                               onkeypress="allowNumbersOnly(event)" maxlength="10"
                                               ng-minlength="{{user.uPhoneNum.minlength}}" 
                                               ng-required="{{user.uPhoneNum.required}}" />
                                    </div>

                                    <div class="error_message">
                                        <span ng-show="RegForm.uPhoneNum.$dirty && RegForm.uPhoneNum.$error.required">Phone number is required!</span>
                                        <span ng-show="RegForm.uPhoneNum.$error.minlength">Phone number should contain 10 numbers!</span>
                                    </div>  



                                    <div class="input-group no-border input-lg" 
                                         data-aos="zoom-in" data-aos-duration="2500">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class=" fa fa-user-circle"></i>
                                            </span>
                                        </div>

                                        <input type="text" class="form-control" name="userName" id="userName"
                                               placeholder="User Name..." ng-model="userName"
                                               ng-minlength="{{user.userName.minlength}}" 
                                               ng-maxlength="{{user.userName.maxlength}}" 
                                               ng-required="{{user.userName.minlength}}" />
                                    </div>

                                    <div class="error_message">
                                        <span ng-show="RegForm.userName.$dirty && RegForm.userName.$error.required">User Name is required!</span>
                                        <span ng-show="RegForm.userName.$error.minlength">User name is too short!</span>
                                        <span ng-show="RegForm.userName.$error.maxlength">User name is too long!</span>
                                    </div>

                                </div>


                                <div class="card-footer text-center">

                                    <button class="loginBtn" ng-disabled="RegForm.$invalid"
                                            data-aos="fade-up" data-aos-duration="2500">Register</button>

                                    <div class="reg_form_back_tologin" data-aos="fade-up" data-aos-duration="3000">
                                        <h6>Go back to
                                            <a href="login.jsp" class="back_link">Login</a>
                                        </h6>
                                    </div>
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
