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

    <section>
        <center>
            <div class="box">
                <p class="title">Register</p>
                <form action="controller/insert_user_controller.jsp" method="post">
                    <p>Name :</p>
                    <input type="text" name="name" placeholder="Name">
                    <p style="color: red; margin: 0;"><% if(request.getParameter("errName") != null) out.println(request.getParameter("errName")); %> </p>
        
                    <p>Email :</p>
                    <input type="text" name="email" placeholder="Email">
                    <p style="color: red; margin: 0;"><% if(request.getParameter("errEmail") != null) out.println(request.getParameter("errEmail")); %> </p>
        
                    <p>Password :</p>
                    <input type="password" name="password" placeholder="Password">
                    <p style="color: red; margin: 0;"><% if(request.getParameter("errPass") != null) out.println(request.getParameter("errPass")); %> </p>
                    
                    <p>Confirm Password :</p>
                    <input type="password" name="confirm password" placeholder="Confirm Password">
                    <p style="color: red; margin: 0;"><% if(request.getParameter("errConfirmP") != null) out.println(request.getParameter("errConfirmP")); %> </p>
    
                    <button>Register</button>
                    <p class="errMsg" style="display:block"><% if(request.getParameter("err") != null) out.println(request.getParameter("err"));%></p>
                    <br>
                </form>
            </div>
        </center>    
    </section>

    <jsp:include page="footer.jsp"/> 

</body>
</html>