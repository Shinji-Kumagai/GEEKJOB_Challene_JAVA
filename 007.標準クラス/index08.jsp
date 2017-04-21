<%-- ファイルに自己紹介を書き出し、保存してください。 --%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
    </head>
    <body>
デフォルトでは Shift-JIS で送られる
<%
// PrintWriter pw = new PrintWriter(new BufferedWriter(new OutputStreamWriter(
// new FileOutputStream("d:/kadai/standard_class/write.txt", true),"utf-8")));
// pw.println("熊谷だ");

String file_name = "d:/kadai/standard_class/write.txt";
File file = new File(file_name);

// String file_name = "../write02.txt";
// File file = new File(application.getRealPath(file_name));
// FileWriter filewriter = new FileWriter(file);

// File newFile = new File("./write01.txt");
// newFile.createNewFile();
// File file = new File("./write01.txt");
// filewriter.write(intro);
// filewriter.close();

FileWriter filewriter = new FileWriter(file, true); // true を追加すると書き込みじゃなくて追記
BufferedWriter bw = new BufferedWriter(filewriter);
String intro = "熊谷です。よろしく。";
bw.write(intro);
bw.newLine();
bw.write("またね");
bw.close();
%>
    </body>
</html>
