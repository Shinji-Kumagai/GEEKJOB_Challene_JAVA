<%-- 自分のプロフィール(名前、生年月日、自己紹介)を3行に分けて表示するユーザー定義メソッドを作り、メソッドを10回呼び出して下さい --%>
<%@ page contentType="text/html;charset=Shift_JIS"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My JSP PAGE</title>
    </head>
    <body>
        <%!
        String getMyProf(){
            String html = "";
            String name = "熊谷 ";
            int year = 1997, month = 02, day = 25;
            html += name + "です。" + "<br>";
            html += year +"年" + month + "月" + day + "日" +"生まれです。" + "<br>";
            html += "よろしくです。<br><br>";
            return html;
        }
        %>
        <%
        for (int i = 0;i < 10 ;i++ ) {
            out.println(getMyProf());
        }
        %>

    </body>
</html>
