// クッキーに現在時刻を記録し、次にアクセスした際に、前回記録した日時を表示してください。
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.text.*;

public class CookieAccessTime extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String html = "";
        html += "<html><head><title></title></head><body>";

        Cookie cookie[] = request.getCookies();
        Cookie timeOfAccess = null;

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String accesstime = sdf.format(date);

        if (cookie == null) { // 初回アクセス時
            Cookie newCookie = new Cookie("access", accesstime);
            response.addCookie(newCookie);
            html += "初回訪問です";
        } else { // ２回目以降
            for (int i = 0; i < cookie.length; i++) {
                if (cookie[i].getName().equals("access")) {
                    timeOfAccess = cookie[i];
                }
            }
            html += "前回の訪問日時は";
            html += timeOfAccess.getValue();
            html += "です";

            if (timeOfAccess != null) {
                timeOfAccess.setValue(accesstime);
                response.addCookie(timeOfAccess);
            }
        }
        html += "<a href=\"cat\">RELOAD</a>";
        html += "</body></html>";
        out.print(html);
    }
}
// クッキーの利用方法 //
// クッキーを受け取る
Cookie cookie[] = request.getCookies();
Cookie timeOfAccess = null;

// クッキーをセットする
Cookie newCookie = new Cookie("access", accesstime);
response.addCookie(newCookie);

// ほしいクッキーの情報を取得する
for (int i = 0; i < cookie.length; i++) {
    if (cookie[i].getName().equals("access")) {
        timeOfAccess = cookie[i];
    }

// クッキーに入っている情報の表示
html += "前回の訪問日時は";
html += timeOfAccess.getValue();
html += "です";

// クッキーの上書き
if (timeOfAccess != null) {
    timeOfAccess.setValue(accesstime);
    response.addCookie(timeOfAccess);
}
