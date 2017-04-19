<%-- 
    Document   : index1-3
    Created on : 2017/04/12, 21:38:37
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
            String intro1 = "こんにちは。くまがいです。<br>";
            String intro2 = "JSP (Java Server Pages) を勉強中です。";
            out.print(intro1 + intro2);
        %>
    </body>
</html>
