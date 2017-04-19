<%-- 
    Document   : index1-8
    Created on : 2017/04/13, 10:41:35
    Author     : 20156

    課題「配列の作成」で作成した配列の"soeda"を"33"に変更してください。
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    
            <%
            String[] arr = new String[7];
            arr[0] = "10";
            arr[1] = "100";
            arr[2] = "33";
            arr[3] = "hayashi";
            arr[4] = "-20";
            arr[5] = "118";
            arr[6] = "END";

            out.print(Arrays.toString(arr));
        %>
    </body>
</html>
