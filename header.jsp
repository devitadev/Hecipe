<%@include file="connect.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/header.js"></script>
</head>
<body>
    <header>
        <%
            Cookie[] cookies = request.getCookies();
            String userId = null;
            String role = null;

            if(cookies != null){
                for(Cookie cookie : cookies){
                    if(cookie.getName().equals("userId")) {
                        userId = cookie.getValue();
                        session.setAttribute("userId", userId);
                    }
                    if(cookie.getName().equals("role")) {
                        role = cookie.getValue();
                        session.setAttribute("role", role);
                    }
                }
            }
        %>
        <div>
            <h1>Hecipe</h1>
            <img class="navbar-toogle" onclick="toogleNavbar()" src="assets/icons8-menu.svg" alt="">
        </div>
        <nav class="navbar" id="navbar">
            <div class="navbar-nav">
                <div class="navbar-item"><a class="navbar-link" href="home.jsp">Home</a></div>
                <div class="navbar-item"><a class="navbar-link" href="food_list.jsp">Foods</a></div>
            </div>
            <%
                if(session.getAttribute("userId") == null){
                    // kalo guest
            %>
                    <div class="navbar-nav">
                        <div class="navbar-item"><a class="navbar-link" href="login.jsp">Login</a></div>
                        <div class="navbar-item"><a class="navbar-link" href="register.jsp">Register</a></div>
                    </div>
            <%
                }
                else{
                    String query = String.format("SELECT * FROM MsUser WHERE user_id='%s'", session.getAttribute("userId"));
                    ResultSet result = st.executeQuery(query);
                    String name = "";

                    if(result.next()){ name = result.getString("user_name"); }

                    if(session.getAttribute("role").equals("admin")){
                        // kalo admin
            %>
                        <div class="navbar-nav">
                            <div class="navbar-item"><p class="welcome-text">Welcome, Admin</p></div>
                            <div class="navbar-item"><a class="navbar-link" href="profile.jsp">Profile</a></div>
                            <div class="navbar-item"><a class="navbar-link" href="">View Transaction</a></div>
                            <div class="navbar-item"><a class="navbar-link" href="">Logout</a></div>
                        </div>
            <%
                    }
                    else if(session.getAttribute("role").equals("member")){
                        // kalo member
            %>
                        <div class="navbar-nav">
                            <div class="navbar-item"><p class="welcome-text">Welcome, <%= name%></p></div>
                            <div class="navbar-item"><a class="navbar-link" href="profile.jsp">Profile</a></div>
                            <div class="navbar-item"><a class="navbar-link" href="">View Cart</a></div>
                            <div class="navbar-item"><a class="navbar-link" href="">View Transaction</a></div>
                            <div class="navbar-item"><a class="navbar-link" href="">Logout</a></div>
                        </div>
            <%
                    }
                }
            %>
            
        </nav>
    </header>
</body>
</html>