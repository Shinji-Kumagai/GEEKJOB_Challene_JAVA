<!-- �߂�l�Ƃ��Ă���l����id(���l),���O,���N�����A�Z����ԋp���郁�\�b�h���쐬���A�󂯎�������id�ȊO�̒l��\������ -->
<%@ page contentType="text/html;charset=Shift_JIS"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My JSP PAGE</title>
    </head>
    <body>
        <%!
        String[] someone(){
            String[] someone = {"0000", "�N��", "����", "�ǂ���"};
            return someone;
        }
        %>
        <%
        String[] person = someone();
        out.print(person[1]);
        out.print(person[2]);
        out.print(person[3]);
        %>

    </body>
</html>
