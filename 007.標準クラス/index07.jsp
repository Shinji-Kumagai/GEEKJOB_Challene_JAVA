<%-- 以下の文章の「I」⇒「い」に、「U」⇒「う」に入れ替える処理を作成し、結果を表示してください。
「きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます」 --%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
    </head>
    <body>
        <%
        String str = "きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます";
        str = str.replace("I", "い");
        str = str.replace("U", "う");
        out.print(str);
        %>

    </body>
</html>
