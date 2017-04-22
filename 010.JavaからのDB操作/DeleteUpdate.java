// profileIDで指定したレコードを削除できるフォームを作成してください
// profileIDで指定したレコードの、profileID以外の要素をすべて上書きできるフォームを作成してください
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DeleteUpdate extends HttpServlet{

    Connection conn = null;
    String url = "jdbc:mysql://localhost/challenge_db?zeroDateTimeBehavior=convertToNull";
    String user = "user";
    String password = "password";

    // html 用
    String html = "";
    // getParameter 用
    String name, tell, birthday;
    int id, age;
    // sql 用
    String sql;

    String disp;

    public void doGet(HttpServletRequest req, HttpServletResponse res)
    throws IOException, ServletException {

        res.setContentType("text/html; charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter out = res.getWriter();

        String action = (req.getParameter("action") != null) ? req.getParameter("action") : "";

        out.print("<html><head><title>特定のレコードの削除 OR 更新</title></head><body>");


        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, user, password);

            Statement stmt = conn.createStatement();

            sql = "select profilesID from profiles";
            ResultSet rs = stmt.executeQuery(sql);




            out.print("<form action=\"DeleteUpdate\" method=\"get\">");
            // out.print("<input type=\"number\" name=\"profilesID\" min=0>");
            out.print("<select name=\"profilesID\">");
            while (rs.next()) {
                out.print("<option value=\"" + rs.getInt("profilesID") + "\">" + rs.getInt("profilesID")+ "</option>");
            }

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

        out.print("</select>");
        out.print("<input type=\"submit\" name=\"action\" value=\"DELETE\">");
        out.print("<input type=\"submit\" name=\"action\" value=\"UPDATE\">");
        out.print("</form>");

        // DELETE PROCESS
        if (action.equals("DELETE")) {
            id = (req.getParameter("profilesID") != null) ? Integer.parseInt(req.getParameter("profilesID")) : -1;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, user, password);

                Statement stmt = conn.createStatement();

                sql = "delete from profiles where profilesID = " + id;
                int num = stmt.executeUpdate(sql);
                stmt.close();
                out.print("<p>ProfilesID " + id + "の情報を削除しました</p>");
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
        } // DELETE PROCESS

        // UPDATE PROCESS
        if (action.equals("UPDATE")) {
            id = (req.getParameter("profilesID") != null) ? Integer.parseInt(req.getParameter("profilesID")) : -1;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, user, password);
                Statement stmt = conn.createStatement();
                sql = "select * from profiles where profilesID = " + id;
                ResultSet rs = stmt.executeQuery(sql);

                out.print("<p>ProfilesID " + id + "の情報を更新します</p>");

                out.print("<form action=\"DeleteUpdate\" method=\"get\">");
                out.print("<table><th>");
                out.print("<td>ProfilesID</td><td>Name</td><td>Tell</td><td>Age</td><td>Birthday</td>");
                out.print("</th>");
                while (rs.next()) {
                    out.print("<tr>");
                    out.print("<td></td>");
                    // out.print("<td><input type=\"number\" value=\"" + rs.getInt("profilesID") + "\"></td>");
                    out.print("<td><input type=\"number\" name=\"profilesID\" value=\"" + rs.getInt("profilesID") + "\" readonly=\"readonly\"></td>");
                    out.print("<td><input type=\"text\" name=\"name\" value=\"" + rs.getString("name") + "\"></td>");
                    out.print("<td><input type=\"text\" name=\"tell\" value=\"" + rs.getString("tell") + "\"></td>");
                    out.print("<td><input type=\"number\" name=\"age\" value=\"" + rs.getInt("age") + "\"></td>");
                    out.print("<td><input type=\"text\" name=\"birthday\" value=\"" + rs.getString("birthday") + "\"></td>");
                    out.print("</tr>");
                }
                out.print("<tr><td></td></tr>");
                out.print("</table>");

                out.print("<input type=\"submit\" name=\"action\" value=\"CONFIRM\">");
                out.print("</form>");
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
        } // UPDATE PROCESS


        if (action.equals("CONFIRM")) {
            id = (req.getParameter("profilesID") != "") ? Integer.parseInt(req.getParameter("profilesID")) : -1;
            name = (req.getParameter("profilesID") != "") ? req.getParameter("name") :"";
            tell = (req.getParameter("profilesID") != "") ? req.getParameter("tell") :"";
            age = (req.getParameter("profilesID") != "") ? Integer.parseInt(req.getParameter("age")) : -1;
            birthday = (req.getParameter("profilesID") != "") ? req.getParameter("birthday") : "0000-00-00";
            out.print(id);
            out.print(name);
            out.print(age);
            out.print(birthday);
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, user, password);
                Statement stmt = conn.createStatement();
                sql = "update profiles";
                sql += " set name = '" + name + "', tell = '" + tell + "', age = " + age + ",birthday = '" + birthday + "'";
                sql += " where profilesID = " + id;

                int num = stmt.executeUpdate(sql);

                out.print("<p>ProfilesID " + id + "の情報を更新しました</p>");

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
        } // UPDATE PROCESS

        out.print("<p>すべてのレコード</p>"); // ShowRecords class の処理をインクルードする
        disp = "/ShowRecords";
        RequestDispatcher dispatch = req.getRequestDispatcher(disp);
        dispatch.include(req, res);

        out.print("</body></html>");

    }  // doGet
}
