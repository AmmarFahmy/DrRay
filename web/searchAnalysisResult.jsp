


<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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

        <link rel="icon" href="images/logo.png">
        <title>DrRay</title>

    </head>
    <body>
        <div class="hedding" data-aos="fade-up" data-aos-duration="2500">
            <h1>DrRay Sri Lanka</h1> <br>
        </div>
        <div class="allmembers-form">
            <table class="table table-dark" style="margin-top: 3em;"  data-aos="fade-up" data-aos-duration="2500">
                <thead>
                    <tr>
                        <th>Unique ID</th>
                        <th>MRI Scan</th>
                        <th>Cancer Site</th>
                        <th>Tumor Type</th>
                        <th>Gender</th> 
                        <th>Mean Value</th>
                        <th>Variance</th>
                        <th>Standard Deviation</th>
                        <th>Entropy</th>
                        <th>Skewness</th>
                        <th>Contrast</th>
                        <th>Homogeneity</th>
                        <th>Dissimilarity</th>
                        <th>Correlation</th>
                    </tr>
                </thead>
                <%

                    Connection connection = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/drray?useTimezone=true&serverTimezone=UTC", "root", "");
                        Statement stmt = connection.createStatement();
                        String patient = request.getParameter("patient");
                        String sqlString = "select * from `searchanalysis` where `Patient`='" + patient + "' || `Sex`='" + patient + "' || `Tumour_Type`='" + patient + "'";
                        ResultSet rs = stmt.executeQuery(sqlString);
                        
//                        String sqlString2 = "SELECT COUNT(*) FROM `searchanalysis` WHERE `Patient`='" + patient + "' || `Sex`='" + patient + "' || `Tumour_Type`='" + patient + "'";
//                        ResultSet rs2 = stmt.executeQuery(sqlString2);
//                        System.out.println(rs2);

                        while (rs.next()) {

                %>
                <tr>
                    <td><%=rs.getString("Patient")%></td>
                    <td><%
//                        Blob blob = rs.getBlob("image");
//                        byte byteArray[] = blob.getBytes(1, (int) blob.length());
//                        response.setContentType("image/gif");
//                        OutputStream os = response.getOutputStream();
//                        os.write(byteArray);
//                        os.flush();
//                        os.close();
%></td>
                    <td><%=rs.getString("Cancer_Site")%></td>
                    <td><%=rs.getString("Tumour_Type")%> </td> 
                    <td><%=rs.getString("Sex")%> </td> 
                    <td><%=rs.getString("Mean")%> </td>
                    <td><%=rs.getString("Variance")%> </td>
                    <td><%=rs.getString("Standard_Deviation")%> </td>
                    <td><%=rs.getString("Entropy")%> </td>
                    <td><%=rs.getString("Skewness")%> </td>
                    <td><%=rs.getString("Contrast")%> </td>
                    <td><%=rs.getString("Homogeneity")%> </td>
                    <td><%=rs.getString("Dissimilarity")%> </td>
                    <td><%=rs.getString("Correlation")%> </td>
                </tr>

                <% }

                    } catch (Exception e) {
                        System.out.println("ooops somthing happen " + e);
                    }
                %>
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