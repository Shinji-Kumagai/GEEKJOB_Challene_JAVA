<%@ page contentType="text/html;charset=Shift_JIS"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
    </head>
    <body>
        <%!
        String addOrEven(int n) {
            // int n = n;
            if (n%2==0) {
                return "‚»‚ê‚Í‹ô”‚¾‚×";
            }
            else{
                return "Šï”‚ð“ü‚ê‚¾‚×";
            }
        }
        %>
        <%
        out.print(addOrEven(1));
        %>
    </body>
</html>
