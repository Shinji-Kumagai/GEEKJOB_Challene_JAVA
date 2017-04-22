// Challenge_dbへのエラーハンドリングを含んだ接続の確立を行ってください。
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ConnectDB extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String html = "";

        Connection conn = null;
        String url = "jdbc:mysql://localhost/challenge_db";
        String user = "user";
        String password = "password";

        html = "<html><head><title>データベースへの接続</title></head><body><p>";

        try {
            // クラスの利用
            // Class.forName(クラス名)
            // インスタンスの作成
            // Class.forName(クラス名).newInstance();
            Class.forName("com.mysql.jdbc.Driver").newInstance(); // JDBC ドライバのロード

            conn = DriverManager.getConnection(url, user, password);
            // url = jdbc:mysql://(サーバ名)/(データベース名)
            // localhost とはこのコンピューターのこと（今あなたが使っているコンピューター）
            html += "データベースへの接続に成功しました<br>";
        } catch (ClassNotFoundException e) {
            html += "ClassNotFoundException : " + e.getMessage();
        } catch (SQLException e) {
            html += "SQLException : " + e.getMessage();
        } catch (Exception e) {
            html += "Exception : " + e.getMessage();
        } finally { // try の中にエラーがあってもなくても必ず実行される文。
            try {
                if (conn != null) {
                    conn.close();
                    html += "データベース接続を終了しました。";
                } else {
                    html += "コネクションがありません";
                }
            } catch (SQLException e) {
                html += "SQLException : " + e.getMessage();
            }
        }
        html += "</p></body></html>";

        out.print(html);
    }
}
