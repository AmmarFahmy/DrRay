<%-- 
    Document   : pyamentsuccess
    Created on : Apr 4, 2019, 2:43:10 PM
    Author     : Pasindu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    </head>
    <body>
        <style>
            /* body {
                font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif;
            } */
        </style>
        <script>
            Swal.fire(
                    'Good job!',
                    'Payment successful!',
                    'success'
                    ).then((result) => {
  if (result.value) {
      window.location.href = "./Details.jsp";
//    Swal.fire(
//      'Deleted!',
//      'Your file has been deleted.',
//      'success' dn haridow eka goda thda thada ela thawa monwada thiyennee? full payment 
//      klama buttone ekaa paid krmuda ekath wait kiyla watenne. ok
//    )
  }
})
        </script>
    </body>
</html>