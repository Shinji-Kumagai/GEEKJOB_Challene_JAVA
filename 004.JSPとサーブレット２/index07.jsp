<%-- �ۑ�u�����A�߂�l1�v��3�l���̃v���t�B�[���̂���1�l�����Z�����lnull�̏�ԂŒ�`���A���[�v�����őS�����̃v���t�B�[����id�ȊO�\�����鏈�������s����B���̍ہA�������ɂȂ��Ă���f�[�^��continue�Ŕ�΂� --%>
<%@page contentType="text/html" pageEncoding="Shift_JIS"%>

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
            String[] someone02 = {"1111", "�Z���搶", "��N�O", null};
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
        %>
        <%
        int[] ids = {1,2,3};
        for (int id : ids) {
            String[] person = someone(id);
            out.print("���O��"+person[1]);
            out.print(" ���܂��"+person[2]);
            if (person[3] == null) {
                out.print("<br>");
                continue;
            }
            out.print(" �Z����"+person[3]);
            out.print("<br>");
        }
        %>

    </body>
</html>
