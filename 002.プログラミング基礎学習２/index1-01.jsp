<%-- 
    Document   : index1-1
    Created on : 2017/04/13, 1:22:01
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
            int a = 2;
            String msg = "";
            switch (a) {
                case 1:
                    msg = "one";
                    break;
                case 2:
                    msg = "two";
                    break;
                default:
                    msg = "想定外";
                    break;
            }
            out.print(msg);
        %>
    </body>
</html>
