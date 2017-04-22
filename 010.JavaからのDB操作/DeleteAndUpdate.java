// 課題「テーブルへ情報を格納」でINSERTしたレコードを指定して削除してください。SELECT*で結果を表示してください
// profileID=1のnameを「松岡 修造」に、ageを48に、birthdayを1967-11-06に更新してください
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DeleteAndUpdate extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String html ="";

        html = "<html><head><title>データベースへの接続</title></head><body>";

        Connection conn = null;
        String url = "jdbc:mysql://localhost/challenge_db";
        String user = "user";
        String password = "password";

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, user, password);

            Statement stmt = conn.createStatement();
            String sql = "delete from profiles where profilesID = 10";
            int num = stmt.executeUpdate(sql);
            // ResultSet rs = stmt.executeQuery(sql);

            html += "レコードを削除しました<br>";

            sql = "update profiles set name='松岡 修造', age=48, birthday='1967-11-06' where profilesID = 1";
            // rs = stmt.executeQuery(sql);
            num = stmt.executeUpdate(sql);

            html += "レコードを更新しました<br>";

            sql = "select * from profiles";
            ResultSet rs = stmt.executeQuery(sql);
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
