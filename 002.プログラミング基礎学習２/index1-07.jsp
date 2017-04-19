<%-- 
    Document   : index1-7
    Created on : 2017/04/13, 2:02:40
    Author     : 20156

    以下の順番で、要素が格納された配列を作成してください。
    "10", "100", "soeda", "hayashi", "-20", "118", "END"
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
            arr[2] = "soeda";
            arr[3] = "hayashi";
            arr[4] = "-20";
            arr[5] = "118";
            arr[6] = "END";

            out.print(Arrays.toString(arr));
        %>

    </body>
</html>
