<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <link rel="stylesheet" href="css/change_password_style.css">
</head>
<body>
    <jsp:include page="header.jsp"/>
    
    <section>
        <center>
            <p class="title">Change Password</p>
        
            <div class="content">
                <form action="controller/change_password_controller.jsp" method="post" >
                    <table>
                        <tr>
                            <td class="col1">Old Password</td>
                            <td>
                                <input type="hidden" name="id" value="<%= request.getParameter("user_id")%>" >
                                <input type="password" name="old" placeholder="Old password">
                                <p style="color: red; margin: 0;"><% if(request.getParameter("errOld") != null) out.println(request.getParameter("errOld")); %> </p>
                            </td>
                        </tr>
                    
                        <tr>
                            <td class="col1">New Password</td>
                            <td>
                                <input type="password" name="new" placeholder="New password">
                                <p style="color: red; margin: 0;"><% if(request.getParameter("errNew") != null) out.println(request.getParameter("errNew")); %> </p>
                            </td>
                        </tr>
            
                        <tr>
                            <td class="col1">Confirm Password</td>
                            <td>
                                <input type="password" name="confirm" placeholder="Confirm password">
                                <p style="color: red; margin: 0;"><% if(request.getParameter("errConfirm") != null) out.println(request.getParameter("errConfirm")); %> </p>
                            </td>
                        </tr>
                    </table>

                    <p class="errMsg" style="display: block;"> <% if(request.getParameter("err") != null) out.println(request.getParameter("err"));%>
                    </p>
                    <button class="button">Change Password</button>
                </form>
            </div>
        </center>
        
    </section>

    
    <jsp:include page="footer.jsp"/>
</body>
</html>