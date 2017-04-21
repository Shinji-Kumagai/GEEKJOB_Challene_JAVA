<%-- 2016年11月4日 10時0分0秒のタイムスタンプを作成し、「年-月-日 時:分:秒」で表示してください。 --%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
    </head>
    <body>
<%
// タイムスタンプ生成
String time = "2016-11-04 10:00:00";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy'-'MM'-'dd' 'HH':'mm':'ss");
Date date = sdf.parse(time);
long timestamp = date.getTime(); // 本当は1000で割る
// out.print(date.getTime() / 1000);

// タイムスタンプ＝＞日付型
Date date02 = new Date(timestamp);
out.print(sdf.format(date02)); // 2016-11-04 10:00:00

// String a = sdf.format(date02);
// out.println(a);
%>
    </body>
</html>
