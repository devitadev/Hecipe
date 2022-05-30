<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="css/register_style.css">
</head>
<body>
    <jsp:include page="header.jsp"/> 

    <center>
        <div class="box">
            <p class="title">Register</p>
            <form action="insert_user.jsp" method="post" name="formRegister" onsubmit="return(validateRegister())">
                <p>Name :</p>
                <input type="text" name="name" placeholder="Name">
                <p class="errMsg" id="errName1">name must be filled</p>
                <p class="errMsg" id="errName2">name should be at least 3 characters</p>
    
                <p>Email :</p>
                <input type="text" name="email" placeholder="Email">
                <p class="errMsg" id="errEmail1">email must be filled</p>
                <p class="errMsg" id="errEmail2">email should contain '@' and '.'</p>
                <p class="errMsg" id="errEmail3">email contain only one '@'</p>
                <p class="errMsg" id="errEmail4">'@' and '.' should not be side by side</p>
                <p class="errMsg" id="errEmail5">this email have been used before</p>
    
                <p>Password :</p>
                <input type="password" name="password" placeholder="Password">
                <p class="errMsg" id="errPass1">password must be filled</p>
                <p class="errMsg" id="errPass2">password should be at least 6 characters</p>
                <p class="errMsg" id="errPass3">password must contain at least one alphabet</p>
                <p class="errMsg" id="errPass4">password must contain at least one number</p>
                
                <p>Confirm Password :</p>
                <input type="password" name="confirm password" placeholder="Confirm Password">
                <p class="errMsg" id="errConfPass">confirm password must match password</p>

                <button>Register</button>
                <p class="errMsg" style="display:block"><% if(request.getParameter("err") != null) out.println(request.getParameter("err"));%></p>
                <br>
            </form>
        </div>
    </center>
    
    <jsp:include page="footer.jsp"/> 

    <script src="js/validate_register.js"></script>

</body>
</html>