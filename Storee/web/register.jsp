<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Storee - Register</title>
        <link rel="stylesheet" href="css/register.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>
    <body>
        <%@include file="header.jsp" %>


        <div class="register">
            <div class="element-register">
                <h1>Register</h1>
                <p>Log in so you don't miss out on accumulated benefits</p>
                <p>and cashback for any order</p>
                <h4>Login or Register (free)</h4>
                <img src="images/gglogin.png" alt="" width="50px">
                <img src="images/fblogin.png" alt="" width="50px"> <br>
                <hr width="100%" align="left">

                <form action="register" method="post">
                    <input class="log" type="email" name="mail" placeholder="Email"> <br>
                    <input class="log" type="text" name="username" placeholder="Username"> <br>
                    <input class="log" type="password" name="password" placeholder="Password"> <br>          
                    <input class="sub" type="submit" value="Register"> <br>
                    <a class="dn" href="login.jsp">Already have an account? Login here </a>                  
                </form>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
