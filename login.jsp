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

    <center>
        <div class="box">
            <p class="title">Login</p>
            <form action="" method="post" name="formLogin" onsubmit="">
                <p>Email :</p>
                <input type="text" name="email" placeholder="Email">
    
                <p>Password :</p>
                <input type="password" name="password" placeholder="Password">

                <div class="rememberMe">
                    <input type="checkbox" name="rememberMe">
                    Remember Me
                </div>
                
                <p class="errMsg">Incorrect email or password</p>
                <button>Login</button>
            </form>
        </div>
    </center>

    <jsp:include page="footer.jsp"/> 
</body>
</html>