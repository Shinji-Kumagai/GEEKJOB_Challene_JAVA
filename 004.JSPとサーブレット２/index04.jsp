<%@ page contentType="text/html;charset=Shift_JIS"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My JSP PAGE</title>
    </head>
    <body>
        <%!
        String getMyProf(){
            String html = "";
            String name = "åFíJ ";
            int year = 1997, month = 02, day = 25;
            html += name + "Ç≈Ç∑" + "<br>";
            html += year +"îN" + month + "åé" + day + "ì˙" +"ê∂Ç‹ÇÍÇ≈Ç∑" + "<br>";
            html += "ÇÊÇÎÇµÇ≠Ç≈Ç∑<br><br>";
            return html;
        }
        Boolean isSuccess() {
            return true;
        }
        %>
        <%
        Boolean isSuccess = isSuccess();
        if (isSuccess == true) {
            for (int i = 0;i < 10 ;i++ ) {
                out.println(getMyProf());
            }
            out.print("ê≥ÇµÇ≠èàóùÇ≈Ç´Ç‹ÇµÇΩ");
        } else {
            out.print("ê≥ÇµÇ≠é¿çsÇ≈Ç´Ç‹ÇπÇÒÇ≈ÇµÇΩ");
        }
        %>

    </body>
</html>
