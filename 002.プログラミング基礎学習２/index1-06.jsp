<%-- 
    Document   : index1-6
    Created on : 2017/04/13, 1:58:04
    Author     : 20156
    
    while文を利用して、以下の処理を実現してください。
    1000を2で割り続け、100より小さくなったらループを抜ける処理
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
int n = 1000;
while(n >= 100){
    n = n / 2;
}
out.print(n); // 62 
%>
    </body>
</html>
