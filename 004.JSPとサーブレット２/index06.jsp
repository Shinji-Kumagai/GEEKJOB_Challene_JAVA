<%-- ��������1��id(���l)���Ƃ�A3�l���̃v���t�B�[��(���ڂ͉ۑ�5�Q��)�����炩���߃��\�b�h���Œ�`���Ă����B��������id�l�ɂ��߂�l�Ƃ��ĕԋp����v���t�B�[����N�̂��̂ɂ��邩�I������B����ȍ~�Ȃǂ͉ۑ�u�߂�l2�v�Ɠ��������ɂ���B --%>
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
        %>
        <%
        String[] person = someone(3);
        out.print(person[1]);
        out.print(person[2]);
        out.print(person[3]);
        // out.print(someone(2));
        %>

    </body>
</html>
