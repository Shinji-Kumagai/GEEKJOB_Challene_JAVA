// profileIDで指定したレコードを削除できるフォームを作成してください
// profileIDで指定したレコードの、profileID以外の要素をすべて上書きできるフォームを作成してください
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ShowRecords extends HttpServlet{

    Connection conn = null;
    String url = "jdbc:mysql://localhost/challenge_db?zeroDateTimeBehavior=convertToNull";
    String user = "user";
    String password = "password";

    // getParameter 用
    String name, tell, birthday;
    int id, age;
    // sql 用
    String sql;

    public void doGet(HttpServletRequest req, HttpServletResponse res)
    throws IOException, ServletException {

        res.setContentType("text/html; charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter out = res.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, user, password);

            Statement stmt = conn.createStatement();

            sql = "select * from profiles";
            ResultSet rs = stmt.executeQuery(sql);
            out.print("<table><th>");
            out.print("<td>ProfilesID</td><td>Name</td><td>Tell</td><td>Age</td><td>Birthday</td>");
            out.print("</th>");
            while (rs.next()) {
                out.print("<tr>");
                out.print("<td></td>");
                out.print("<td>" + rs.getInt("profilesID") + "</td>");
                out.print("<td>" + rs.getString("name") + "</td>");
                out.print("<td>" + rs.getString("tell") + "</td>");
                out.print("<td>" + rs.getInt("age") + "</td>");
                out.print("<td>" + rs.getString("birthday") + "</td>");
                out.print("</tr>");
            }
            out.print("</table>");

            rs.close();
            stmt.close();

        } catch (ClassNotFoundException e) {
            out.print(e.getMessage());
        } catch (SQLException e) {
            out.print(e.getMessage());
        } catch (Exception e) {
            out.print(e.getMessage());
        } finally { // 必ず接続は止める
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                out.print(e.getMessage());
            }
        } // finally
    } // doGet
}
