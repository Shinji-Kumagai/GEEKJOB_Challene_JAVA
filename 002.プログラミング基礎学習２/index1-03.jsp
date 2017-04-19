<%-- 
    Document   : index1-3
    Created on : 2017/04/13, 1:39:46
    Author     : 20156
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
//            int num = 8;
            long num = 8;

            for (int i = 1; i < 21; i++) {
                num *= 8;
            }
            out.print(num); // -9223372036854775808 
        %>
    </body>
</html>
