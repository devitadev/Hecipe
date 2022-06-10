<%@include file="connect.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="css/profile_style.css">
</head>
<body>
    <jsp:include page="header.jsp"/>
    
    <section>
        <center>
            <p class="title">Profile</p>
        
            <div class="content">
                <%
                    String id = session.getAttribute("userId").toString();

                    String query = String.format("SELECT * FROM MsUser WHERE user_id='%s'", id);
                    ResultSet rs = st.executeQuery(query);
                    
                    while(rs.next()){
                %>
                    <table>
                        <tr>
                            <td class="bold">Name</td>
                            <td><%= rs.getString("user_name") %></td>
                        </tr>
                        <tr>
                            <td class="bold">Email</td>
                            <td><%= rs.getString("email") %></td>
                        </tr>
                        <tr>
                            <td class="bold">Role</td>
                            <td><%= rs.getString("user_role") %></td>
                        </tr>
                    </table>
                    <a class="change_pass" href="change_password.jsp?user_id=<%= rs.getString("user_id") %>">Change Password</a>
                <%  
                    }
                %>
            </div>
        </center>
        
    </section>

    <jsp:include page="footer.jsp"/>
</body>
</html>