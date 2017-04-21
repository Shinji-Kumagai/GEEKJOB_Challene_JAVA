// クッキーに現在時刻を記録し、次にアクセスした際に、前回記録した日時を表示してください。
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.text.*;

public class SessionAccessTime extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String html = "";
        html += "<html><head><title></title></head><body>";

        HttpSession session = request.getSession(false); // セッションがない場合は null を返す

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String accesstime = sdf.format(date);

        if (session == null) {
            html += "初回訪問です";
            session = request.getSession(true); // セッションがない場合はセッションを始める
            session.setAttribute("accessTime", accesstime);
        } else { // ２回目以降
            html += "前回の訪問日時は";
            html += session.getAttribute("accessTime");
            html += "です";
            session.setAttribute("accessTime", accesstime);
        }
        html += "<br><a href=\"sat\">RELOAD</a>";
        html += "</body></html>";
        out.print(html);
    }
}
