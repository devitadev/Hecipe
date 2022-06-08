<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/login_style.css">
</head>
<body>
    <jsp:include page="header.jsp"/> 

    <section>
        <center>
            <div class="box">
                <p class="title">Login</p>
                <form action="controller/login_controller.jsp" method="post" name="formLogin" onsubmit="return(validateLogin())">
                    <p>Email :</p>
                    <input type="text" name="email" placeholder="Email">
                    <p class="errMsg" id="errEmail1">email must be filled</p>
                    <p class="errMsg" id="errEmail2">email should contain '@' and '.'</p>
                    <p class="errMsg" id="errEmail3">email contain only one '@'</p>
                    <p class="errMsg" id="errEmail4">'@' and '.' should not be side by side</p>
        
                    <p>Password :</p>
                    <input type="password" name="password" placeholder="Password">
                    <p class="errMsg" id="errPass1">password must be filled</p>
    
                    <div class="rememberMe">
                        <input type="checkbox" name="rememberMe" value="remember">
                        Remember Me
                    </div>
                    
                    <p class="errMsg" style="display: block;"><% if(request.getParameter("err") != null) out.println(request.getParameter("err"));%></p>
                    <button>Login</button>
                </form>
            </div>
        </center>
    </section>

    <jsp:include page="footer.jsp"/> 

    <script src="js/validate_login.js"></script>
</body>
</html>