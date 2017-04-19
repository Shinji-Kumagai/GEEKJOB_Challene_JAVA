<%-- 
    Document   : index1-6
    Created on : 2017/04/12, 22:13:03
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
        <form action="index1-6-2.jsp" method="get">
            雑貨（1,000円） <input type="number" min="0" name="goods">
            生鮮食品（2,000円） <input type="number" min="0" name="food">
            その他（3,000円） <input type="number" min="0" name="other">
            <input type="submit" value="レジに並ぶ">
        </form>
    </body>
</html>
