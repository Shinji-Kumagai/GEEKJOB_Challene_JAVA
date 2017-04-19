<%-- 
    Document   : index1-4
    Created on : 2017/04/12, 21:41:40
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
        <%
            final int a = 10;
            int b = 5, c = -5;
            out.println(a + b);
            out.println(a - b);
            out.println(a * c);
            out.println(a / c);

        %>
    </body>
</html>
