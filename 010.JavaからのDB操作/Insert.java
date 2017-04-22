// テーブルに自由なメンバー情報を格納する処理を構築してください。
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Insert extends HttpServlet {
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
            String sql = "insert into profiles (name, tell, age, birthday) values (\"熊谷 眞司\", \"000-0000-0000\", 20, \"0001-01-01\")";
            int num = stmt.executeUpdate(sql);
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
                html += "Birthday => " + birth + "<br>";
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
