<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
    </head>
    <body>
        <form action="/kadai/datamanip01" method="post">
            <input type="text" name="f_name" placeholder="first name"><br>
            <input type="text" name="l_name" placeholder="last name"><br>
            <input type="radio" name="sex" value="man"> : MAN<br>
            <input type="radio" name="sex" value="woman"> : WOMAN<br>
            <input type="textarea" name="hobby" placeholder="趣味">
            <input type="submit" value="submit">
        </form>
    </body>
</html>
