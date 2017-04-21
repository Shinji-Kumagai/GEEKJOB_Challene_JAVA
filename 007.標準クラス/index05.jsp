<%-- 自分の氏名について、バイト数と文字数を取得して、表示してください。 --%>
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<%
String myJapaName = "熊谷 眞司"; // 半角1文字と漢字4文字
String myEngName = "Shinji Kumagai"; // 空白入れて14文字

out.println("私の名前は " + myJapaName + " : 文字数は " + myJapaName.length());
out.println(" : バイト数は " + myJapaName.getBytes().length + "<br>");
out.println("My name is " + myEngName + " : Character count is " + myEngName.length());
out.println(" : Byte Count is " + myEngName.getBytes().length + "<br>"); 
// 私の名前は 熊谷 眞司 : 文字数は 5 : バイト数は 9
// My name is Shinji Kumagai : Character count is 14 : Byte Count is 14
%>
</body>
</html>
