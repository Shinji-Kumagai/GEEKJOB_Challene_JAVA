<%-- 引き数に1つのid(数値)をとり、3人分のプロフィール(項目は課題5参照)をあらかじめメソッド内で定義しておく。引き数のid値により戻り値として返却するプロフィールを誰のものにするか選択する。それ以降などは課題「戻り値2」と同じ扱いにする。 --%>
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
        %>
        <%
        String[] person = someone(3);
        out.print(person[1]);
        out.print(person[2]);
        out.print(person[3]);
        // out.print(someone(2));
        %>

    </body>
</html>
