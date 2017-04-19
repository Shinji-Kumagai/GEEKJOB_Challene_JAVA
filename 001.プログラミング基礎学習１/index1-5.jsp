<%-- 
    Document   : index1-5
    Created on : 2017/04/12, 21:52:34
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
            int n = 1;
            if (n == 1) {
                out.print("1です");
            } else if (n == 2) {
                out.print("プログラミングキャンプ");
            } else {
                out.print("その他です。");
            }
        %>
    </body>
</html>
