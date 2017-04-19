<%-- 
    Document   : index1-9
    Created on : 2017/04/13, 10:43:20
    Author     : 20156

    以下の順で、連想配列を作成してください。
    "1"に"AAA", "hello"に"world", "soeda"に"33", "20"に"20"
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HashMap<String, String> hm = new HashMap<String, String>();
            hm.put("1", "AAA");
            hm.put("hello", "world");
            hm.put("soeda", "33");
            hm.put("20", "20");
            String a = hm.get("1");
            out.print(hm);

        %>
    </body>
</html>
