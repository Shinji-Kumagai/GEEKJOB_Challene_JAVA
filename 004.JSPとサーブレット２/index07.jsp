<%-- 課題「引数、戻り値1」の3人分のプロフィールのうち1人だけ住所が値nullの状態で定義し、ループ処理で全員分のプロフィールをid以外表示する処理を実行する。この際、歯抜けになっているデータはcontinueで飛ばす --%>
<%@page contentType="text/html" pageEncoding="Shift_JIS"%>

<!DOCTYPE html>
<html>
    <head>
        <title>My JSP PAGE</title>
    </head>
    <body>
        <%!
        String[] someone(int id){
            String[] info = {null};
            String[] someone01 = {"0000", "誰か", "いつか", "どこか"};
            String[] someone02 = {"1111", "校長先生", "千年前", null};
            String[] somedog03 = {"2222", "ベル", "20年くらい前", "福島"};

            switch(id) {
                case 1:
                    info = someone01;
                    break;
                case 2:
                    info = someone02;
                    break;
                case 3:
                    info = somedog03;
                    break;
            }
            return info;
        }
        %>
        <%
        int[] ids = {1,2,3};
        for (int id : ids) {
            String[] person = someone(id);
            out.print("名前は"+person[1]);
            out.print(" 生まれは"+person[2]);
            if (person[3] == null) {
                out.print("<br>");
                continue;
            }
            out.print(" 住所は"+person[3]);
            out.print("<br>");
        }
        %>

    </body>
</html>
