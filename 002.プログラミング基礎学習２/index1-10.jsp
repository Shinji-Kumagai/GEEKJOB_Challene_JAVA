<%-- 
    Document   : index1-10
    Created on : 2017/04/13, 14:00:36

    クエリストリングから渡された数値を1ケタの素数で可能な限り分解し、
    元の値と素因数分解の結果を表示するようにしてください。
    2ケタ以上の素数が含まれた数値の場合は、
    「元の値　1ケタの素因数　その他」と表記して、その他　に含んでください。
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String msg = "URLの最後に<br>"
                    + "?n=〇 <br>"
                    + "をつけてページを更新してください。<br>"
                    + "〇には好きな数字を入れてください。";
            if (request.getParameter("n") == null) {
                out.print(msg);
            } else {
                final int S = Integer.parseInt(request.getParameter("n")); // 定数
                int n = S; // これから計算に使う値

                String proccess = ""; // 素因数分解の過程を格納する変数の初期化
                boolean boo = false;
                int pm2 = 0, pm3 = 0, pm5 = 0, pm7 = 0; // pm = Prime Number（素数) // 何回割ったのかを記録するための変数

//            素因数分解しながら何回割ったのかを記録
                while (n % 2 == 0) {
                    n /= 2;
                    pm2++;
                }
                while (n % 3 == 0) {
                    n /= 3;
                    pm3++;
                }
                while (n % 5 == 0) {
                    n /= 5;
                    pm5++;
                }
                while (n % 7 == 0) {
                    n /= 7;
                    pm7++;
                }

                if (pm2 >= 1) { // 素数2が1回でも使われたら
                    String s2 = "2"; // 式を初期化し
                    for (int i = 1; i < pm2; i++) { // 使われた分だけ連結する
                        s2 += " * 2";
                    }
                    proccess += s2; // 式を代入
                    boo = true;  // 次から連結するときは'*'もいっしょに連結
                }

                if (pm3 >= 1) {
                    String s3 = "3";
                    for (int i = 1; i < pm3; i++) {
                        s3 += " * 3";
                    }
                    proccess = (boo == true) ? proccess + " * " + s3 : proccess + s3;
                    boo = true;
                }

                if (pm5 >= 1) {
                    String s5 = "5";
                    for (int i = 1; i < pm5; i++) {
                        s5 += " * 5";
                    }
                    proccess = (boo == true) ? proccess + " * " + s5 : proccess + s5;
                    boo = true;
                }

                if (pm7 >= 1) {
                    String s7 = "7";
                    for (int i = 1; i < pm7; i++) {
                        s7 += " * 7";
                    }
                    proccess = (boo == true) ? proccess + " * " + s7 : proccess + s7;
                    boo = true;
                }

                out.print("元の値 : " + S + "<br>");

                out.print("素因数 : ");
                out.print(pm2 >= 1 ? "2" : "");
                out.print(pm3 >= 1 && boo == true ? ",3" : "");
                out.print(pm5 >= 1 && boo == true ? ",5" : "");
                out.print(pm7 >= 1 && boo == true ? ",7" : "");
                out.print(n != 1 && boo == true ? ",その他（2桁以上の数）" : boo == false ? "その他（2桁以上の数）" : "");
                out.print("<br><br>式に直すと．．．<br><br>");
                if (n != 1) {
                    if (n == S) {
                        out.print(S + " = " + n);
                    } else {
                        out.print(S + " = " + proccess + " * " + n);
                    }
                } else {
                    out.print(S + " = " + proccess);
                }
            }

        %>
    </body>
</html>
