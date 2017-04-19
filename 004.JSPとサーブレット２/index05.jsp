<!-- 戻り値としてある人物のid(数値),名前,生年月日、住所を返却するメソッドを作成し、受け取った後はid以外の値を表示する -->
<%@ page contentType="text/html;charset=Shift_JIS"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My JSP PAGE</title>
    </head>
    <body>
        <%!
        String[] someone(){
            String[] someone = {"0000", "誰か", "いつか", "どこか"};
            return someone;
        }
        %>
        <%
        String[] person = someone();
        out.print(person[1]);
        out.print(person[2]);
        out.print(person[3]);
        %>

    </body>
</html>
