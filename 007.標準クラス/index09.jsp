<%-- ファイルから自己紹介を読み出し、表示してください。 --%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>

<%-- デフォルトでは Shift-JIS で読まれる --%>

<%
String file_name = "d:/kadai/standard_class/write.txt";
File file = new File(file_name);
FileReader filereader = new FileReader(file);
BufferedReader br = new BufferedReader(filereader);
String str;
while ((str = br.readLine()) != null) {
    out.print(str);
}
br.readLine();
%>
