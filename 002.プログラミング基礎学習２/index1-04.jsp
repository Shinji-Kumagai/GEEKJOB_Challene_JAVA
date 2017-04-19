<%-- 
    Document   : index1-4
    Created on : 2017/04/13, 1:45:14
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
String a = "A";
for(int n = 0; n < 29; n++) {
    a += "A";
}
out.print(a);
%>
    </body>
</html>
