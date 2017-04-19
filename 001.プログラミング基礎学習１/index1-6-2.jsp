<%-- 
    Document   : idnex1-6-2
    Created on : 2017/04/12, 22:13:51
    Author     : 20156
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
//            商品の個数
            int goods = 0;
            int food = 0;
            int other = 0;
//            商品の値段
            int gprice = 1000;
            int fprice = 2000;
            int oprice = 3000;
//            クエリストリングで受け取った値を代入
            if (request.getParameter("goods") != "") {
                goods = Integer.parseInt(request.getParameter("goods"));
            }
            if (request.getParameter("food") != "") {
                food = Integer.parseInt(request.getParameter("food"));
            }
            if (request.getParameter("other") != "") {
                other = Integer.parseInt(request.getParameter("other"));

            }
//            商品の合計個数
            int totalnum = goods + food + other;
            out.print("The number of goods you bought is " + totalnum + "<br>");
//            値段を上書き
            gprice = goods * gprice;
            fprice = food * fprice;
            oprice = other * oprice;
//            合計値段
            int totalprice = gprice + fprice + oprice;
//            平均値段
            int averageprice = totalprice / totalnum;
            out.print("Total price is " + totalprice + "<br>");
            out.print("Average price is " + averageprice + "<br>");
//            ポイントの初期化
            double point = 0;
            if (totalprice >= 3000) {
                point = 0.04;
            } else if (totalprice >= 5000) {
                point = 0.05;
            }
            if (point > 0) {
                out.print("You got " + totalprice * point + " point this time");
            }

        %>
    </body>
</html>
