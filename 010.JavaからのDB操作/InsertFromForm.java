// フォームからデータを挿入できる処理を構築してください。
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class InsertFromForm extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse res)
    throws IOException, ServletException {

        res.setContentType("text/html; charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter out = res.getWriter();

        String html = "";

        html = "<html><head><title>フォームからの挿入</title></head><body>";

        html += "<form action=\"InsertFromForm\" method\"get\">";
        html += "NAME    : <input type=\"text\" name=\"name\"><br>";
        html += "TELL      : <input type=\"text\" name=\"tell\"><br>";
        html += "Age         : <input type=\"number\" name=\"age\"><br>";
        html += "Birthday  : <input type=\"text\" name=\"birthday\"><br>";
        html += "<input type=\"submit\" name=\"register\" value=\"REGISTER\"><br>";
        html += "</form>";

        String action = req.getParameter("register");
        if ("REGISTER".equals(action)) { // if (isset($_GET['submit'])) { にしたい

            String name = (req.getParameter("name") != "") ? req.getParameter("name") : "";
            String tell = (req.getParameter("tell") != "") ? req.getParameter("tell") : "";
            int age = (req.getParameter("age") != "") ? Integer.parseInt(req.getParameter("age")) : -1;
            String birthday = (req.getParameter("birthday") != "") ? req.getParameter("birthday") : "0000-00-00";
            html += "<p>登録しました</p>";
            Connection conn = null;
            String url = "jdbc:mysql://localhost/challenge_db?zeroDateTimeBehavior=convertToNull"; // for birthday '0000-00-00'
            String user = "user";
            String password = "password";

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, user, password);

                Statement stmt = conn.createStatement();

                String sql ="";
                sql += "insert into profiles (name, tell, age, birthday) values (";
                sql += "'" + name + "','" + tell + "'," + age + ",'" + birthday + "')";
                // html += "sql sentence is -> " + sql + " <- <br>";
                int num = stmt.executeUpdate(sql);
                sql = "select * from profiles";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    int id = rs.getInt("profilesID");
                    name = rs.getString("name");
                    tell = rs.getString("tell");
                    age = rs.getInt("age");
                    birthday = rs.getString("birthday");
                    html += "ProfilesID :  " + id + "<br>";
                    html += "Name :  " + name + "<br>";
                    html += "Tell : " + tell + "<br>";
                    html += "Age : " + age + "<br>";
                    html += "Birthday : " + birthday + "<br><br>";
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
