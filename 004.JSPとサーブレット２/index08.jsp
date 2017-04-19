<%-- 先にInteger limit=2を定義しておき、課題7の処理のうち2人目(limitで定義した値の人数)まででループ処理を抜けるようにする --%>
<%@ page contentType="text/html;charset=Shift_JIS"%>
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
            String[] someone02 = {"1111", "校長先生", "千年前", "海"};
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
        int limit = 2;
        int count = 0;
        %>
        <%
        int[] ids = {1,2,3};
        for(int id : ids) {
            if(count == limit) {
                break;
            }
            String[] person = someone(id);
            out.print(person[1]);
            out.print(person[2]);
            out.print(person[3]);
            out.print("<br>");
            count++;
        }
        // String[] person = someone(3);
        // out.print(someone(2));
        %>

    </body>
</html>
