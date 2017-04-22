// profileIDで指定したレコードを削除できるフォームを作成してください
// profileIDで指定したレコードの、profileID以外の要素をすべて上書きできるフォームを作成してください
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class CompoundRetrieval extends HttpServlet{

    Connection conn = null;
    String url = "jdbc:mysql://localhost/challenge_db?zeroDateTimeBehavior=convertToNull";
    String user = "user";
    String password = "password";

    // getParameter 用
    String name;
    int min_age,max_age;
    String min_birth, max_birth;
    // int id, age;
    // sql 用
    String sql;

    public void doGet(HttpServletRequest req, HttpServletResponse res)
    throws IOException, ServletException {

        res.setContentType("text/html; charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter out = res.getWriter();

        String action = (req.getParameter("action") != null) ? req.getParameter("action") : "";

        Connection conn = null;
        String url = "jdbc:mysql://localhost/challenge_db";
        String user = "user";
        String password = "password";

        out.print("<html><head><title>複合検索</title></head><body>");

        // SEARCH FORM
        out.print("<form action=\"CompoundRetrieval\" method=\"get\">");
        out.print("NAME : <input type=\"text\" name=\"name\"><br>");
        out.print("MIN AGE : <input type=\"number\" name=\"min_age\"><br>");
        out.print("MAX AGE : <input type=\"number\" name=\"max_age\"><br>");
        out.print("MIN BIRTH : <input type=\"text\" name=\"min_birth\"><br>");
        out.print("MAX BIRTH : <input type=\"text\" name=\"max_birth\"><br>");
        out.print("<input type=\"submit\" name=\"action\" value=\"SEARCH\">");
        out.print("</form>");

        if (action.equals("SEARCH")) {

            name = (req.getParameter("name") != null) ? req.getParameter("name") : "";
            min_age = (req.getParameter("min_age") != "") ? Integer.parseInt(req.getParameter("min_age")) : -1;
            max_age = (req.getParameter("max_age") != "") ? Integer.parseInt(req.getParameter("max_age")) : 150;
            min_birth = (req.getParameter("min_birth") != "") ? req.getParameter("min_birth") : "0000-00-00";
            max_birth = (req.getParameter("max_birth") != "") ? req.getParameter("max_birth") : "2017-04-23";

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, user, password);
                Statement stmt = conn.createStatement();
                sql = "select * from profiles where ";
                sql += "name like '%" + name + "%'";
                sql += " and age >= " + min_age + " and age <= " + max_age;
                sql += " and birthday >= '" + min_birth + "' and birthday <= '" + max_birth + "'";
                ResultSet rs = stmt.executeQuery(sql);
                out.print("<p>以下の人物が条件に合致しました</p>");
                while(rs.next()) {
                    out.print("ProfilesID : " + rs.getInt("profilesID") + "<br>");
                    out.print("Name : " + rs.getString("name") + "<br>");
                    out.print("Tell : " + rs.getString("name") + "<br>");
                    if (rs.getInt("age") == -1) {
                        out.print("年齢は入力されていません" + "<br>");
                    } else {
                        out.print("Age : " + rs.getInt("age") + "<br>");
                    }
                    out.print("Birthday : " + rs.getString("name") + "<br><br>");
                }
                rs.close();
                stmt.close();
            } catch (ClassNotFoundException e) {
                out.print(e.getMessage());
            } catch(SQLException e) {
                out.print(e.getMessage());
            } catch (Exception e) {
                out.print(e.getMessage());
            } finally {
                try {
                    if (conn != null) {
                        conn.close();
                        out.print("接続を解除しました");
                    } else {
                        out.print("接続がありません");
                    }
                } catch (SQLException e) {
                    out.print(e.getMessage());
                }
            }

        }

        out.print("</body></html>");

    }  // doGet
}
