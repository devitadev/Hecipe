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
                    <p style="color: red; margin: 0;"><% if(request.getParameter("errName1") != null) out.println(request.getParameter("errName1")); %> </p>
                    <p style="color: red; margin: 0;"><% if(request.getParameter("errName2") != null) out.println(request.getParameter("errName2")); %> </p>

                    <p>Email :</p>
                    <input type="text" name="email" placeholder="Email">
                    <p style="color: red; margin: 0;"><% if(request.getParameter("errEmail1") != null) out.println(request.getParameter("errEmail1")); %> </p>
                    <p style="color: red; margin: 0;"><% if(request.getParameter("errEmail2") != null) out.println(request.getParameter("errEmail2")); %> </p>
                    <p style="color: red; margin: 0;"><% if(request.getParameter("errEmail3") != null) out.println(request.getParameter("errEmail3")); %> </p>
                    <p style="color: red; margin: 0;"><% if(request.getParameter("errEmail4") != null) out.println(request.getParameter("errEmail4")); %> </p>
        
                    <p>Password :</p>
                    <input type="password" name="password" placeholder="Password">
                    <p style="color: red; margin: 0;"><% if(request.getParameter("errPass1") != null) out.println(request.getParameter("errPass1")); %> </p>
                    <p style="color: red; margin: 0;"><% if(request.getParameter("errPass2") != null) out.println(request.getParameter("errPass2")); %> </p>
                    <p style="color: red; margin: 0;"><% if(request.getParameter("errPass3") != null) out.println(request.getParameter("errPass3")); %> </p>
                    <p style="color: red; margin: 0;"><% if(request.getParameter("errPass4") != null) out.println(request.getParameter("errPass4")); %> </p>
                    
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