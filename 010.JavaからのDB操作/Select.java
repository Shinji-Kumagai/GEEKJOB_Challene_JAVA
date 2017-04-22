// 前回の課題「テーブルの作成とinsert」で作成したテーブルからprofileID=1の情報を取得し、画面に取得した情報を表示してください。
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Select extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String html ="";

        html = "<html><head><title>データベースへの接続</title></head><body><p>";

        Connection conn = null;
        String url = "jdbc:mysql://localhost/challenge_db";
        String user = "user";
        String password = "password";

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            conn = DriverManager.getConnection(url, user, password);

            Statement stmt = conn.createStatement();
            String sql = "select * from profiles where profilesID = 1";
            ResultSet rs = stmt.executeQuery(sql);

            html += "profilesID が1の人";
            while (rs.next()) {
                String name = rs.getString("name");
                String tell = rs.getString("tell");
                int age = rs.getInt("age");
                String birth = rs.getString("birthday");
                html += "Name => " + name + "<br>";
                html += "Tell => " + tell + "<br>";
                html += "Age => " + age + "<br>";
                html += "Birthday => " + birth + "<br><br>";
            }
            sql = "select * from profiles where name like '%茂%'";
            rs = stmt.executeQuery(sql);

            html += "名前に茂が含まれる人";
            while (rs.next()) {
                String name = rs.getString("name");
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

        html += "</body></html>";
        out.print(html);
    }
}
