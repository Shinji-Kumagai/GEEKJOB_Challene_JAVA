// 検索用のフォームを用意し、名前の部分一致で検索＆表示する処理を構築してください。
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.*;

public class SearchFromForm extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse res)
    throws IOException, ServletException {

        res.setContentType("text/html; charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter out = res.getWriter();

        String html = "";

        html = "<html><head><title>データベースへの接続</title></head><body>";

        html += "<form action=\"SearchFromForm\" method\"get\">";
        html += "NAME : <input type=\"text\" name=\"name\"><br>";
        html += "<input type=\"submit\" name=\"search\" value=\"SEARCH\"><br>";
        html += "</form>";

        String action = "SEARCH";
        String search = req.getParameter("search");
        String name = req.getParameter("name");
        // String name = "";
        if ("SEARCH".equals(action)) { // if (isset($_GET['submit'])) { にしたい
            // name = req.getParameter("name");

            html += "<p>検索結果</p>";
            Connection conn = null;
            String url = "jdbc:mysql://localhost/challenge_db";
            String user = "user";
            String password = "password";

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, user, password);

                Statement stmt = conn.createStatement();
                String sql = "select * from profiles where name like '%" + name + "%'";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    name = rs.getString("name");
                    String tell = rs.getString("tell");
                    int age = rs.getInt("age");
                    String birth = rs.getString("birthday");
                    html += "Name => " + name + "<br>";
                    html += "Tell => " + tell + "<br>";
                    html += "Age => " + age + "<br>";
                    html += "Birthday => " + birth + "<br><br>";
                }

                rs.close();
                stmt.close();

            } catch (ClassNotFoundException e) {
                html += e.getMessage();
            } catch (SQLException e) {
                html += e.getMessage();
            } catch (Exception e) {
                html += e.getMessage();
            } finally { // 必ず接続は止める
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    html += e.getMessage();
                }
            }
        }
        html += "</body></html>";
        out.print(html);
    }
}
