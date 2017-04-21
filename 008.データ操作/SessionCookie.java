// 名前・性別・趣味を入力するページを作成してください。
// また、入力された名前・性別・趣味を記憶し、次にアクセスした際に記録されたデータを初期値として表示してください。

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class SessionCookie extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{

            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            PrintWriter out = response.getWriter();
            StringBuffer sb = new StringBuffer();

            HttpSession session = request.getSession(true); // セッションの取得 true にしない限りセッションは動かない -> セッションの処理は全部エラーになる

            String action = request.getParameter("action");
            String f_name = "";
            String l_name = "";
            String sex = "";
            String hobby = "";

            f_name = request.getParameter("f_name");
            l_name = request.getParameter("l_name");
            sex = request.getParameter("sex") != null ? request.getParameter("sex") : "";
            hobby = request.getParameter("hobby");

            String html = "";

            if ("submit".equals(action)) {
                if (f_name != null) {
                    session.setAttribute("f_name", f_name);
                }
                if (l_name != null) {
                    session.setAttribute("l_name", l_name);
                }
                if (sex != null) {
                    session.setAttribute("sex", sex);
                }
                if (hobby != null) {
                    session.setAttribute("hobby", hobby);
                }
            }

            html += "<html><head><title>フォーム</title></head><body>";

            html += "<form action\"sessionCookie\" method=\"get\">";

            html += "<input type=\"text\" name=\"f_name\" value=\"";
            if ((String)session.getAttribute("f_name") != null) {
                html += (String)session.getAttribute("f_name");
            }
            html += "\"><br>";

            html += "<input type=\"text\" name=\"l_name\" value=\"";
            if ((String)session.getAttribute("l_name") != null) {
                html += (String)session.getAttribute("l_name");
            }
            html += "\"><br>";

            html += "man : <input type=\"radio\" name=\"sex\" value=\"man\"";
            if (sex.equals("man")) {
                html += " checked";
            }
            html += "><br>";

            html += "woman : <input type=\"radio\" name=\"sex\" value=\"woman\"";
            if (sex.equals("woman")) {
                html += " checked";
            }
            html += "><br>";
            html += "<input type=\"textarea\" cols=50 rows=6 name=\"hobby\"><br>";
            html += "<input type=\"submit\" value=\"submit\" name=\"action\">";
            html += "</form>";

            html += "<a href=\"sessionCookie\">RELOAD</a>";
            html += "</body></html>";
            sb.append(html);
            out.print(new String(sb));
            out.close();

  }
}
