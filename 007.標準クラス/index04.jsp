<%-- 2015年1月1日 0時0分0秒と2015年12月31日 23時59分59秒の差（ミリ秒）を表示してください。 --%>
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
String time_A = "2015-01-01 00:00:00";
String time_B = "2015-12-31 23:59:59";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy'-'MM'-'dd' 'HH':'mm':'ss");
Date date_A = sdf.parse(time_A);
Date date_B = sdf.parse(time_B);
long timestamp_A = date_A.getTime() / 1000;
long timestamp_B = date_B.getTime() / 1000;

long result = timestamp_B - timestamp_A; // 計算
out.println("1年間は『 " + result + " 』秒。");　// 1年間は『 31535999 』 秒。




%>
</body>
</html>
