<%-- 2016年1月1日 0時0分0秒のタイムスタンプを作成し、表示してください。 --%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
    </head>
    <body>
        <%
        // Date date0 = new Date();
        // out.println(date0.toString());
        // out.println(date0);
        // SimpleDateFormat myformat = new SimpleDateFormat("yyyy/mm/dd HH:mm:ss");
        // out.println(date0.getTime() / 1000);
        // out.print(myformat.format(date0));

        // 使い方
        // String time = "0000-00-00 00:00:00"; // 0000年00月00日 00時00分00秒のタイムスタンプを生成
        // SimpleDateFormat sdf = new SimpleDateFormat("yyyy'-'MM'-'dd' 'HH':'mm':'ss");
        // Date date = sdf.parse(time);
        // out.print("TIMESTAMP = " + date.getTime() / 1000);

         String time = "2016-01-01 00:00:00"; // 求めたい日付
         String a = " yyyy'-'MM'-'dd' 'HH':'mm':'ss "; // ← 書き方難しい
         SimpleDateFormat myformat01 = new SimpleDateFormat(a.trim()); // 入れるときは空白なしで入れる (下の行みたいに)
        //  SimpleDateFormat myformat01 = new SimpleDateFormat("yyyy'-'MM'-'dd' 'HH':'mm':'ss");
         Date date = myformat01.parse( time );
         out.println("TIMESTAMP = " + date.getTime()/1000);
        // TIMESTAMP = 1451574000
        %>
    </body>
</html>
