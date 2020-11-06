
<%@page import="javax.servlet.http.HttpSession"%>
<!--making session-->
<%
    HttpServletResponse httpResponse = (HttpServletResponse) response;

    httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.addHeader("Cache-Control", "post-check=0, pre-check=0");
    httpResponse.setHeader("Pragma", "no-cache");
    httpResponse.setDateHeader("Expires", 0);

    HttpSession s = request.getSession();

    if (s.getAttribute("userID") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

        <link rel="stylesheet" type="text/css" href="css/now-ui-kit.css">
        <link rel="stylesheet" type="text/css" href="css/Style.css">

        <script src="js/Script.js"></script>
        <link rel="icon" href="images/logo.png">
        <title>DrRay</title>
    </head>

    <body>



        <%  HttpSession se = request.getSession();
            if (se.getAttribute("userID") != null) {
                String userName = (String) se.getAttribute("fName");
            } else {
                String userName = "Login";
            }

        %>


    </ul>
</div>

</div>
</nav>-->

<div class="hedding" data-aos="fade-up" data-aos-duration="2500">
    <br>
    <br>
    <h1>DrRay Sri Lanka</h1> <br>
    <h2>Users dashboard</h2> </div>


<div class="button" align="center">
    <button onclick="window.location.href = 'uploadMRI.jsp'"class="btn btn-primary  btn-lg  " data-aos="fade-up" data-aos-duration="2500">Upload MRI or CT Scan Image</button>
    <br>
    <button onclick="window.location.href = ''" data-aos="fade-up" data-aos-duration="2500" type="button" class="btn btn-primary  btn-lg  " >Upload Scanned Image to Detect Tumor</button>
    <br>
    <br>
    <br>
    <br>
    <button onclick="window.location.href = 'index.jsp'" data-aos="fade-up" data-aos-duration="2500" type="button" class="btn btn-primary  btn-lg  " >Home </button>
</div>

<script>
    AOS.init();
</script>
</body>
</html>
