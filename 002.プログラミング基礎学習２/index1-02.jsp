<%-- 
    Document   : index1-2
    Created on : 2017/04/13, 1:26:11
    Author     : 20156
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--<h1>保留</h1>-->
        <%
//            やりたいこと
//            key が 文字列じゃなくて文字だった場合だけ switch の分を実行したい

//             char key = 'a';
//            String key = "aaa";
            String key = "A";

            String msg = "";
//            if (key instanceof String) {
//
//            } else if(key instanceof char) {
//            
//            
            switch (key) {
//                case 'A':
                case "A":
                    msg = "英語";
                    break;
//                case 'あ':
//                    msg = "日本語";
//                    break;
                default:
                    msg = "";
                    break;
            }
//            }
            out.print(msg);

        %>
    </body>
</html>
