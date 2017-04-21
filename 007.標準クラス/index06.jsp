<%-- 自分のメールアドレスの「@」以降の文字を取得して、表示してください。 --%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
    </head>
    <body>
<%
String email = "myemailaddress@gmail.com";
int mark = email.indexOf("@");
String str = email.substring(mark);
out.print(str);
// @gmail.com
%>
    </body>
</html>
