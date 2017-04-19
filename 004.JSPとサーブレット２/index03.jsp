<%@ page contentType="text/html;charset=Shift_JIS"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
    </head>
    <body>
        <%!
// 引き数が3つのメソッドを定義する。1つ目は適当な数値を、2つ目はデフォルト値が5の数値を、最後はデフォルト値がfalse(boolean)のtypeを引き数として定義する。1つ目の引き数に2つ目の引き数を掛ける計算をするメソッドを作成し、typeがfalseの時はその値を表示、trueのときはさらに2乗して表示する。
        Integer kakeru(int n, int j, boolean type) {
            // 3つ入っていた場合
            int num =  n * j;
            if(type == true) {
                num *= num;
            }
            if (type == false) {
                num = num;
            }
            return num;
        }
        Integer kakeru(int n, int j) {
            // 二つだけの場合
            return kakeru(n, j, false);
        }
        Integer kakeru(int n, boolean type) {
            // 二つだけの場合
            return kakeru(n, 5, type);
        }
        Integer kakeru(int n) {
            return kakeru(n, 5, false);
        }
        %>
        <%
        out.println("3");
        out.println(kakeru(4,7, true));
        out.println("<Br>");

        out.println("2");
        out.println(kakeru(4, true));
        out.println("<Br>");

        out.println("2");
        out.println(kakeru(4,7));
        out.println("<Br>");

        out.println("1");
        out.println(kakeru(2));
        out.println("<Br>");
        %>
    </body>
</html>
