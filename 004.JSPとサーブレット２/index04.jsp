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
            html += name + "です" + "<br>";
            html += year +"年" + month + "月" + day + "日" +"生まれです" + "<br>";
            html += "よろしくです<br><br>";
            return html;
        }
        Boolean isSuccess() {
            return true;
        }
        %>
        <%
        Boolean isSuccess = isSuccess();
        if (isSuccess == true) {
            for (int i = 0;i < 10 ;i++ ) {
                out.println(getMyProf());
            }
            out.print("正しく処理できました");
        } else {
            out.print("正しく実行できませんでした");
        }
        %>

    </body>
</html>
