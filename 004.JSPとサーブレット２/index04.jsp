<%@ page contentType="text/html;charset=Shift_JIS"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My JSP PAGE</title>
    </head>
    <body>
        <%!
        String getMyProf(){
            String html = "";
            String name = "�F�J ";
            int year = 1997, month = 02, day = 25;
            html += name + "�ł�" + "<br>";
            html += year +"�N" + month + "��" + day + "��" +"���܂�ł�" + "<br>";
            html += "��낵���ł�<br><br>";
            return html;
        }
        Boolean isSuccess() {
            return true;
        }
        %>
        <%
        Boolean isSuccess = isSuccess();
        if (isSuccess == true) {
            for (int i = 0;i < 10 ;i++ ) {
                out.println(getMyProf());
            }
            out.print("�����������ł��܂���");
        } else {
            out.print("���������s�ł��܂���ł���");
        }
        %>

    </body>
</html>
