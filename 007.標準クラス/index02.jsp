<%-- 現在の日時を「年-月-日 時:分:秒」で表示してください。 --%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
    </head>
    <body>
<%
Date date = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
out.print(sdf.format(date));
// 2017-04-19 15:19:24
%>
    </body>
</html>
