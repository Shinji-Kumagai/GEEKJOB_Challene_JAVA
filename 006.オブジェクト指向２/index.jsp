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
    ArrayList<String> cards = new ArrayList<String>(); // 山札
    String[] marks = {"Hearts", "Diamonds", "Clubs", "Spades"}; // マーク
    Dealer() { // 初期化コンストラクタ
        for (String mark : marks) {
            for (int i = 1; i < 14; i++) {
                cards.add(i + " of " + mark);
            }
        }
    }

    Random random = new Random(); //
    int x = 52; //現在の山札数

    ArrayList<String> deal(){ // deal メソッド
        ArrayList<String> returnCards = new ArrayList<String>(); // 配るカード
        for (int i = 0; i < 2; i++) {
            int index = random.nextInt(x); // 山札の数だけ乱数生成
            int n = index; // 乱数を保存
            returnCards.add(0, cards.get(n)); // 配るカードの配列にセットする
            cards.remove(n); // 山札を減らす
            x -= 1; //乱数を減らす
        } // for
        return returnCards;
    } // deal(){

    ArrayList<String> hit(){ // hit メソッド
        ArrayList<String> returnCards = new ArrayList<String>(); // 配るカード
        int index = random.nextInt(x); // 山札の数だけ乱数生成
        int n = index; // 乱数を保存
        returnCards.add(0, cards.get(n)); // 配るカードの配列にセットする
        cards.remove(n); // 山札を減らす
        x -= 1; //乱数を減らす
        return returnCards;
    } // hit


    public void setCard(ArrayList<String> addcards) {
        //引数 arraylist で受けた情報をmycardsに追加する
        for (int i = 0; i < addcards.size(); i++) { // 引数の要素が1つなら1回、2なら2回
            myCards.add(addcards.get(i));
        }
    }

    public Boolean checkSum() { // myCardsを確認し、まだカードが必要ならtrue、必要なければfalseを返す
        int sum = this.open();
        if (sum >= 17) { // Dealer は17以上になるまでひかなくちゃいけない
            return false;
        } else {
            return true;
        }
    }

    public Integer open() {  // myCardsの合計値を返却する
        Pattern p = Pattern.compile("\\d+"); // トランプから数字を取得したい "\\d+"は"0123456789"の同義
        // 例えば「12 of Hearts」から 12 だけを取得したい

        int sum = 0; // 手札の合計値
        int tempValue; // 正規表現でゲットした数字を格納する変数
        ArrayList<Integer> hako = new ArrayList<Integer>(); // tempValueに入れた値を格納する配列

        for (int i = 0; i < myCards.size(); i++) { // 手札の数だけループ処理
           Matcher m = p.matcher(myCards.get(i)); // 手札( i )のなかから数字を探す
           if(m.find()) { // この m.find() を忘れると m.group() が使えないから注意！！！
               tempValue = new Integer(m.group()); // 手札( i )の数字を取得
               if (tempValue >= 10) { // 絵柄は10扱い
                   tempValue = 10;
               }
               hako.add(tempValue);
           }
        }

        // 手札の合計値を計算
        if (hako.size() == 2) { // エースと10ならブラックジャック
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
    public void setCard(ArrayList<String> addcards) { //引数 arraylist で受けた情報をmycardsに追加する
        for (int i = 0; i < addcards.size(); i++) { // 引数の要素が1つなら1回、2なら2回
            myCards.add(addcards.get(i));
        }
    }

    public Boolean checkSum() { // myCardsを確認し、まだカードが必要ならtrue、必要なければfalseを返す
        int sum = this.open();
        // User は16以下だったら絶対にひく
        Random rand = new Random();
        int ransu = rand.nextInt(50) + 1;

        if (sum == 21 ) {
            return false;
        }
        else if (sum <= 16 ) { // 16以下なら必ず引く
            return true;
        }
        else if (sum == 17 || sum == 18){ // 17以上なら運で引くかひかないか決める
            if (ransu >= 15 && ransu <= 21) {
                return true; // 7/50 の確率で引く
            } else {
                return false;
            }
        }
        else if (sum == 19 || sum == 20) {
            if (ransu == 1) {
                return true; // 1/50の確率で引く
            } else {
                return false;
            }
        }
        else if (sum >= 22) { // 22以上なら当然引かない
            return false;
        }
        else { // この処理がないとエラー
            return false;
        }
    }

    public Integer open() {     // myCardsの合計値を返却する
        Pattern p = Pattern.compile("\\d+"); // トランプから数字を取得したい
        int sum = 0; // 手札の合計値
        int tempValue;
        ArrayList<Integer> hako = new ArrayList<Integer>();

        for (int i = 0; i < myCards.size(); i++) { // 手札の数だけループ処理
           Matcher m = p.matcher(myCards.get(i)); // 手札( i )のなかから数字を探す
           if(m.find()) { // この m.find() を忘れると m.group() が使えないから注意！！！
               tempValue = new Integer(m.group()); // 手札( i )の数字を取得
               if (tempValue >= 10) { // 絵柄は10扱い
                   tempValue = 10;
               }
               hako.add(tempValue);
           }
        }

        if (hako.size() == 2) { // エースと10ならブラックジャック
            if ((hako.get(0) == 1 && hako.get(1) == 10) || (hako.get(0) == 10 && hako.get(1) == 1)) {
                return 21;
            }
        }

        if(hako.indexOf(1) == -1 ) { // 1が含まれない場合
            for (int i = 0; i < hako.size(); i++) {
                sum += hako.get(i); // 普通に計算
            }
        }
        else { // 1が含まれる場合
            int index = hako.indexOf(1);
            int ace = hako.get(index);
            int tempSum = 0;
            for (int i = 0; i < hako.size(); i++) {
                if (i == index) { // 1はまだ合計しない
                    continue;
                }
                tempSum += hako.get(i);
            }
            if (tempSum <= 10) { // 合計が10以下なら11扱い
                ace = 11;
            } else { // 合計が11以上なら1扱い
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

// インスタンス生成
Dealer dealer = new Dealer();
User user = new User();

// 最初のカードを配る
user.myCards = dealer.deal();
dealer.myCards = dealer.deal();

// ヒットするかどうか判断する
// ヒットしたら配列に引いたカードを入れてから自分の手札にセットする
ArrayList<String> hiku01 = new ArrayList<String>();
ArrayList<String> hiku02 = new ArrayList<String>();
while (user.checkSum()) {
    out.print("現在の手札の合計は" + user.open() + "なので引きます<br>");

    hiku01 = dealer.hit();
    user.setCard(hiku01);
}
while (dealer.checkSum()) {
    hiku02 = dealer.hit();
    dealer.setCard(hiku02);
}

// どっちが勝ったかの判定
int userPoint = user.open();
int dealerPoint = dealer.open();
if (userPoint > 21) { // USER が 21 より上なら DEALER の勝ち
    userWinFlag = 1;
} else if (userPoint <= 21 && dealerPoint > 21) { // USER が 21 以下で DEALER が 21 より上なら USER の勝ち
    userWinFlag = 0;
} else if (userPoint <= 21 && dealerPoint <= 21) { // 両方21以下なら21に近いほう勝ち、同じなら引き分け
    userPoint = 21 - userPoint;
    dealerPoint = 21 - dealerPoint;
    userWinFlag = (userPoint == dealerPoint) ? 2 : (userPoint < dealerPoint) ? 0 : 1;
}


out.println("プレーヤーの手札 : " + user.myCards);
out.println("合計 : " + user.open());
out.print("<br>");
out.println("ディーラーの手札 : " + dealer.myCards);
out.println("合計 : " + dealer.open());
out.print("<br>");
out.print("<br>");
String msg;
out.print("Flag is : " + userWinFlag + "<br>");
if (userWinFlag == 0) {
    msg = "プレーヤーの勝ちです";
    out.println(msg);
}
if (userWinFlag == 1) {
    msg = "ディーラーの勝ちです";
    out.println(msg);
}
if (userWinFlag == 2) {
    msg = "引き分け";
    out.println(msg);
}

%>
    </body>
</html>
