<%-- ���Integer limit=2���`���Ă����A�ۑ�7�̏����̂���2�l��(limit�Œ�`�����l�̐l��)�܂łŃ��[�v�����𔲂���悤�ɂ��� --%>
<%@ page contentType="text/html;charset=Shift_JIS"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My JSP PAGE</title>
    </head>
    <body>
        <%!
        String[] someone(int id){
            String[] info = {null};
            String[] someone01 = {"0000", "�N��", "����", "�ǂ���"};
            String[] someone02 = {"1111", "�Z���搶", "��N�O", "�C"};
            String[] somedog03 = {"2222", "�x��", "20�N���炢�O", "����"};

            switch(id) {
                case 1:
                    info = someone01;
                    break;
                case 2:
                    info = someone02;
                    break;
                case 3:
                    info = somedog03;
                    break;
            }
            return info;
        }
        int limit = 2;
        int count = 0;
        %>
        <%
        int[] ids = {1,2,3};
        for(int id : ids) {
            if(count == limit) {
                break;
            }
            String[] person = someone(id);
            out.print(person[1]);
            out.print(person[2]);
            out.print(person[3]);
            out.print("<br>");
            count++;
        }
        // String[] person = someone(3);
        // out.print(someone(2));
        %>

    </body>
</html>
