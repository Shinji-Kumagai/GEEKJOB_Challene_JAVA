<%-- �����̃v���t�B�[��(���O�A���N�����A���ȏЉ�)��3�s�ɕ����ĕ\�����郆�[�U�[��`���\�b�h�����A���\�b�h��10��Ăяo���ĉ����� --%>
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
            html += name + "�ł��B" + "<br>";
            html += year +"�N" + month + "��" + day + "��" +"���܂�ł��B" + "<br>";
            html += "��낵���ł��B<br><br>";
            return html;
        }
        %>
        <%
        for (int i = 0;i < 10 ;i++ ) {
            out.println(getMyProf());
        }
        %>

    </body>
</html>
