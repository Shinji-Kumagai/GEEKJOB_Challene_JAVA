import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Index01 extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String f_name = request.getParameter("f_name");
        String l_name = request.getParameter("l_name");
        String sex = request.getParameter("sex");
        String hobby = request.getParameter("hobby");

        StringBuffer sb = new StringBuffer();

        String html = "";

        html += "<html><title>FORM</title></head><body>";
        html += "<p>名前は " + f_name + l_name + " です</p>";
        html += "<p>性別は " + sex + " です</p>";
        html += "<p>趣味は " + hobby + " です</p>";
        html += "</body></html>";

        sb.append(html);

        out.print(new String(sb));

        out.close();
    }
}
