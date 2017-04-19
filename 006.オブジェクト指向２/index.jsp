<%@ page contentType="text/html;charset=Shift_JIS"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.regex.Matcher"%>
<%@ page import="java.util.regex.Pattern"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
        <title>BLACKJACK</title>
    </head>
    <body>
        BLACKJCAK<br>
<%!

// NOTE : HUMAN

abstract class Human {
    abstract public void setCard(ArrayList<String> myCards);
    abstract public Boolean checkSum();
    abstract public Integer open();
    public ArrayList<String> myCards = new ArrayList<String>();
}

class Dealer extends Human {
    ArrayList<String> cards = new ArrayList<String>(); // �R�D
    String[] marks = {"Hearts", "Diamonds", "Clubs", "Spades"}; // �}�[�N
    Dealer() { // �������R���X�g���N�^
        for (String mark : marks) {
            for (int i = 1; i < 14; i++) {
                cards.add(i + " of " + mark);
            }
        }
    }

    Random random = new Random(); //
    int x = 52; //���݂̎R�D��

    ArrayList<String> deal(){ // deal ���\�b�h
        ArrayList<String> returnCards = new ArrayList<String>(); // �z��J�[�h
        for (int i = 0; i < 2; i++) {
            int index = random.nextInt(x); // �R�D�̐�������������
            int n = index; // ������ۑ�
            returnCards.add(0, cards.get(n)); // �z��J�[�h�̔z��ɃZ�b�g����
            cards.remove(n); // �R�D�����炷
            x -= 1; //���������炷
        } // for
        return returnCards;
    } // deal(){

    ArrayList<String> hit(){ // hit ���\�b�h
        ArrayList<String> returnCards = new ArrayList<String>(); // �z��J�[�h
        int index = random.nextInt(x); // �R�D�̐�������������
        int n = index; // ������ۑ�
        returnCards.add(0, cards.get(n)); // �z��J�[�h�̔z��ɃZ�b�g����
        cards.remove(n); // �R�D�����炷
        x -= 1; //���������炷
        return returnCards;
    } // hit


    public void setCard(ArrayList<String> addcards) {
        //���� arraylist �Ŏ󂯂�����mycards�ɒǉ�����
        for (int i = 0; i < addcards.size(); i++) { // �����̗v�f��1�Ȃ�1��A2�Ȃ�2��
            myCards.add(addcards.get(i));
        }
    }

    public Boolean checkSum() { // myCards���m�F���A�܂��J�[�h���K�v�Ȃ�true�A�K�v�Ȃ����false��Ԃ�
        int sum = this.open();
        if (sum >= 17) { // Dealer ��17�ȏ�ɂȂ�܂łЂ��Ȃ����Ⴂ���Ȃ�
            return false;
        } else {
            return true;
        }
    }

    public Integer open() {  // myCards�̍��v�l��ԋp����
        Pattern p = Pattern.compile("\\d+"); // �g�����v���琔�����擾������ "\\d+"��"0123456789"�̓��`
        // �Ⴆ�΁u12 of Hearts�v���� 12 �������擾������

        int sum = 0; // ��D�̍��v�l
        int tempValue; // ���K�\���ŃQ�b�g�����������i�[����ϐ�
        ArrayList<Integer> hako = new ArrayList<Integer>(); // tempValue�ɓ��ꂽ�l���i�[����z��

        for (int i = 0; i < myCards.size(); i++) { // ��D�̐��������[�v����
           Matcher m = p.matcher(myCards.get(i)); // ��D( i )�̂Ȃ����琔����T��
           if(m.find()) { // ���� m.find() ��Y���� m.group() ���g���Ȃ����璍�ӁI�I�I
               tempValue = new Integer(m.group()); // ��D( i )�̐������擾
               if (tempValue >= 10) { // �G����10����
                   tempValue = 10;
               }
               hako.add(tempValue);
           }
        }

        // ��D�̍��v�l���v�Z
        if (hako.size() == 2) { // �G�[�X��10�Ȃ�u���b�N�W���b�N
            if ((hako.get(0) == 1 && hako.get(1) == 10) || (hako.get(0) == 10 && hako.get(1) == 1)) {
                return 21;
            }
        }
        // TODO
        for (int i = 0; i < hako.size(); i++) {
            int x = hako.get(i);
            if (x == 1 && sum < 11) {
                x= 11;
            }
            sum += x;
        }
        // TODO
        return sum;
    }
} // class dealer {



// NOTE : USER
class User extends Human {
    public void setCard(ArrayList<String> addcards) { //���� arraylist �Ŏ󂯂�����mycards�ɒǉ�����
        for (int i = 0; i < addcards.size(); i++) { // �����̗v�f��1�Ȃ�1��A2�Ȃ�2��
            myCards.add(addcards.get(i));
        }
    }

    public Boolean checkSum() { // myCards���m�F���A�܂��J�[�h���K�v�Ȃ�true�A�K�v�Ȃ����false��Ԃ�
        int sum = this.open();
        // User ��16�ȉ����������΂ɂЂ�
        Random rand = new Random();
        int ransu = rand.nextInt(50) + 1;

        if (sum == 21 ) {
            return false;
        }
        else if (sum <= 16 ) { // 16�ȉ��Ȃ�K������
            return true;
        }
        else if (sum == 17 || sum == 18){ // 17�ȏ�Ȃ�^�ň������Ђ��Ȃ������߂�
            if (ransu >= 15 && ransu <= 21) {
                return true; // 7/50 �̊m���ň���
            } else {
                return false;
            }
        }
        else if (sum == 19 || sum == 20) {
            if (ransu == 1) {
                return true; // 1/50�̊m���ň���
            } else {
                return false;
            }
        }
        else if (sum >= 22) { // 22�ȏ�Ȃ瓖�R�����Ȃ�
            return false;
        }
        else { // ���̏������Ȃ��ƃG���[
            return false;
        }
    }

    public Integer open() {     // myCards�̍��v�l��ԋp����
        Pattern p = Pattern.compile("\\d+"); // �g�����v���琔�����擾������
        int sum = 0; // ��D�̍��v�l
        int tempValue;
        ArrayList<Integer> hako = new ArrayList<Integer>();

        for (int i = 0; i < myCards.size(); i++) { // ��D�̐��������[�v����
           Matcher m = p.matcher(myCards.get(i)); // ��D( i )�̂Ȃ����琔����T��
           if(m.find()) { // ���� m.find() ��Y���� m.group() ���g���Ȃ����璍�ӁI�I�I
               tempValue = new Integer(m.group()); // ��D( i )�̐������擾
               if (tempValue >= 10) { // �G����10����
                   tempValue = 10;
               }
               hako.add(tempValue);
           }
        }

        if (hako.size() == 2) { // �G�[�X��10�Ȃ�u���b�N�W���b�N
            if ((hako.get(0) == 1 && hako.get(1) == 10) || (hako.get(0) == 10 && hako.get(1) == 1)) {
                return 21;
            }
        }

        if(hako.indexOf(1) == -1 ) { // 1���܂܂�Ȃ��ꍇ
            for (int i = 0; i < hako.size(); i++) {
                sum += hako.get(i); // ���ʂɌv�Z
            }
        }
        else { // 1���܂܂��ꍇ
            int index = hako.indexOf(1);
            int ace = hako.get(index);
            int tempSum = 0;
            for (int i = 0; i < hako.size(); i++) {
                if (i == index) { // 1�͂܂����v���Ȃ�
                    continue;
                }
                tempSum += hako.get(i);
            }
            if (tempSum <= 10) { // ���v��10�ȉ��Ȃ�11����
                ace = 11;
            } else { // ���v��11�ȏ�Ȃ�1����
                ace = 1;
            }
            sum = tempSum + ace;
        }
        return sum;
    }
}

%>
<%
int userWinFlag = 0; // 0 = win , 1 = lose,  2 = draw

// �C���X�^���X����
Dealer dealer = new Dealer();
User user = new User();

// �ŏ��̃J�[�h��z��
user.myCards = dealer.deal();
dealer.myCards = dealer.deal();

// �q�b�g���邩�ǂ������f����
// �q�b�g������z��Ɉ������J�[�h�����Ă��玩���̎�D�ɃZ�b�g����
ArrayList<String> hiku01 = new ArrayList<String>();
ArrayList<String> hiku02 = new ArrayList<String>();
while (user.checkSum()) {
    out.print("���݂̎�D�̍��v��" + user.open() + "�Ȃ̂ň����܂�<br>");

    hiku01 = dealer.hit();
    user.setCard(hiku01);
}
while (dealer.checkSum()) {
    hiku02 = dealer.hit();
    dealer.setCard(hiku02);
}

// �ǂ��������������̔���
int userPoint = user.open();
int dealerPoint = dealer.open();
if (userPoint > 21) { // USER �� 21 ����Ȃ� DEALER �̏���
    userWinFlag = 1;
} else if (userPoint <= 21 && dealerPoint > 21) { // USER �� 21 �ȉ��� DEALER �� 21 ����Ȃ� USER �̏���
    userWinFlag = 0;
} else if (userPoint <= 21 && dealerPoint <= 21) { // ����21�ȉ��Ȃ�21�ɋ߂��ق������A�����Ȃ��������
    userPoint = 21 - userPoint;
    dealerPoint = 21 - dealerPoint;
    userWinFlag = (userPoint == dealerPoint) ? 2 : (userPoint < dealerPoint) ? 0 : 1;
}


out.println("�v���[���[�̎�D : " + user.myCards);
out.println("���v : " + user.open());
out.print("<br>");
out.println("�f�B�[���[�̎�D : " + dealer.myCards);
out.println("���v : " + dealer.open());
out.print("<br>");
out.print("<br>");
String msg;
out.print("Flag is : " + userWinFlag + "<br>");
if (userWinFlag == 0) {
    msg = "�v���[���[�̏����ł�";
    out.println(msg);
}
if (userWinFlag == 1) {
    msg = "�f�B�[���[�̏����ł�";
    out.println(msg);
}
if (userWinFlag == 2) {
    msg = "��������";
    out.println(msg);
}

%>
    </body>
</html>
